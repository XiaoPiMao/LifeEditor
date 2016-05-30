package com.lifeeditor.controller.user_spec;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lifeeditor.service.user_specService;


/**
 * Servlet implementation class EditorHotMan
 */
@WebServlet("/EditorHotMan")
public class EditorHotMan extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public EditorHotMan() {
        super();
    }

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println(1);  
		Integer hotMan = Integer.parseInt(request.getParameter("hotMan"));
		Integer userID = Integer.parseInt(request.getParameter("id"));
		
		user_specService userSvc = new user_specService();
		userSvc.updateHotMan(hotMan, userID);
	}

}
