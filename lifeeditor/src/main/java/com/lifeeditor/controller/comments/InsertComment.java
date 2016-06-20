package com.lifeeditor.controller.comments;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.commentsService;


@WebServlet("/insertComment")
public class InsertComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		user_specVO user = (user_specVO) request.getSession().getAttribute("LoginOK");
		Integer targetID = Integer.parseInt(request.getParameter("targetID"));
		Integer userID = user.getUserID() ;
		String comment = request.getParameter("comment");
		
		commentsService comtSvc = new commentsService();
		comtSvc.addComment(targetID, userID, comment);
	}

}
