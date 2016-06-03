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

import com.lifeeditor.model.user_spec.user_specVO;




@WebServlet("/getPicture")
public class getPicture extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public getPicture() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		user_specVO user_specVO = (com.lifeeditor.model.user_spec.user_specVO) req.getSession().getAttribute("user_specVO");
		OutputStream os = null;		
		Blob b = user_specVO.getPicture();
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
