package com.lifeeditor.controller.user_spec;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Hibernate;

import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.user_specService;




@WebServlet("/RegisteredServlet")
public class RegisteredServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public RegisteredServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		user_specVO user_specVO =  (com.lifeeditor.model.user_spec.user_specVO) req.getSession().getAttribute("user_specVO");
		
		String account = user_specVO.getAccount();
		String pswd = user_specVO.getPswd();;
        String lastName = user_specVO.getLastName();
        String firstName = user_specVO.getFirstName();
		String gender = user_specVO.getGender();
		java.sql.Date birthdate = user_specVO.getBirthdate();
		String email = user_specVO.getEmail();
		String address = user_specVO.getAddress();
		String phone = user_specVO.getPhone(); 
		Blob picture = user_specVO.getPicture();
		System.out.println(picture);
		
		InputStream in = new FileInputStream(req.getServletContext().getRealPath("/images/picture.jpg"));
		@SuppressWarnings("deprecation")
		Blob picture1 = Hibernate.createBlob(in);
		System.out.println(picture1);
		try {
			if(picture.length() == 0){
				user_specService user_specService = new user_specService();
			 	user_specVO = user_specService.addUser(account, pswd, lastName, firstName, gender, birthdate,email,address,phone,picture1);
			 	
			}else{
				user_specService user_specService = new user_specService();
			 	user_specVO = user_specService.addUser(account, pswd, lastName, firstName, gender, birthdate,email,address,phone,picture);
			 	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
     	req.getSession().setAttribute("LoginOK", user_specVO);
     	
     	String url = "/home.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url); 
		successView.forward(req, resp);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		
		
		
	}

}
