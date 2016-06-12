package com.lifeeditor.controller.sec_list;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lifeeditor.model.sec_list.SecListVO;
import com.lifeeditor.model.type_list.TypeListVO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.SecListService;
import com.lifeeditor.service.TypeListService;




@WebServlet("/getSecPic")
public class getSecPic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public getSecPic() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			OutputStream os = null;	
		Integer secID = new Integer(req.getParameter("secID"));
		SecListService secSrc = new SecListService();
		SecListVO SecListVO = secSrc.getOneUser(secID);
		Blob b = SecListVO.getSecPic();
		long size;
		
			size = b.length();
		
		byte[] bs = b.getBytes(1, (int)size);
		resp.setContentType("image/jpeg");
		os = resp.getOutputStream();
		os.write(bs);
		
		os.flush();
		
		os.close();
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
