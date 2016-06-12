package com.lifeeditor.controller.user_spec;

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

import com.lifeeditor.service.user_specService;


@WebServlet("/GetUserPicture")
public class GetUserPicture extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public GetUserPicture() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			Integer id = Integer.parseInt(request.getParameter("id"));
			user_specService userSvc = new user_specService();
			Blob b = userSvc.getOneUser(id).getPicture();
			try {
				int len = 0;
				InputStream is = b.getBinaryStream();
				OutputStream os = response.getOutputStream();
				byte[] bytes = new byte[1024];
				while( (len = is.read(bytes)) != -1) {
					os.write(bytes, 0, len);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
	}

}
