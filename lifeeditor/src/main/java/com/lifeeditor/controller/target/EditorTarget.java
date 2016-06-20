package com.lifeeditor.controller.target;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lifeeditor.service.TargetService;


@WebServlet("/editTarget")
public class EditorTarget extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
  
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		Integer targetID = Integer.parseInt(request.getParameter("targetID"));
		TargetService trgSvc = new TargetService();
		if("check".equals(action)) {
			trgSvc.check(targetID);
			return;
		}
		
		if("complete".equals(action)) {
			trgSvc.complete(targetID);
			return;
		}
		
	
	}

}
