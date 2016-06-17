package com.lifeeditor.controller.type_list;

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

import com.lifeeditor.model.type_list.TypeListVO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.TypeListService;




@WebServlet("/getTypePic")
public class getTypePic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public getTypePic() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			OutputStream os = null;	
		Integer typeID = new Integer(req.getParameter("typeID"));
		TypeListService typeSrc = new TypeListService();
		TypeListVO TypeListVO = typeSrc.getOneUser(typeID);
		Blob b = TypeListVO.getTypePic();
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
