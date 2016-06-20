package com.lifeeditor.controller.comments;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.lifeeditor.model.comments.commentsVO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.commentsService;


@WebServlet("/comment")
public class Comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer targetID = Integer.parseInt(request.getParameter("targetID"));
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		commentsService cmtSvc = new commentsService();
		
		List<commentsVO> list = cmtSvc.getCommentByTarget(targetID);
		JsonArray jsonArray = new JsonArray();
		JsonObject jsonObj = null;
		
		for(commentsVO comment : list) {
			jsonObj = new JsonObject();
			user_specVO user = comment.getUser_specVO();
			jsonObj.addProperty("userID", user.getUserID());
			jsonObj.addProperty("firstName", user.getFirstName());
			jsonObj.addProperty("lastName", user.getLastName());
			jsonObj.addProperty("comment", comment.getComment());
			jsonArray.add(jsonObj);
		}
		
		response.getWriter().write(jsonArray.toString());
		
	}

}
