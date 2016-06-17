package com.lifeeditor.backstageLogin;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

@WebServlet("/backstageLogin/loginService")
public class loginService extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public loginService() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("account").isEmpty() || request.getParameter("pswd").isEmpty()){
			RequestDispatcher rd = request.getRequestDispatcher("../manager/Backstage.jsp");
			rd.forward(request, response);
			return;					
		}else{
			String account = request.getParameter("account");
			String pswd = request.getParameter("pswd");
			backmangerVO backVO = new loginServiceDB().chkpassword(account, pswd);
			if(backVO.getPicture() == null){
				response.sendRedirect((response.encodeRedirectURL("../manager/Backstage.jsp")));
				return;
			}
			//System.out.println(backVO.getPicture());
			
			String photo64 = null;
			try {
				InputStream in;
				in = backVO.getPicture().getBinaryStream();
				ByteArrayOutputStream buffer = new ByteArrayOutputStream();			
				int len;
				byte[] data = new byte[8192];
				while((len=in.read(data))>0)   {   
				buffer.write(data, 0, len);
				in.close();}
				byte[] arr = buffer.toByteArray();
				 photo64 = DatatypeConverter.printBase64Binary(arr);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			HttpSession session = request.getSession();
			session.setAttribute("backPhoto", photo64);
			session.setAttribute("backVO", backVO);

			response.sendRedirect(request.getServletContext().getContextPath() + "/manager/report.jsp");
			return;

			
		}
		

	}

}
