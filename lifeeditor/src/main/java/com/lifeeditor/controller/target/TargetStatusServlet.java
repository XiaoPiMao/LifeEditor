package com.lifeeditor.controller.target;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lifeeditor.service.TargetService;
import com.lifeeditor.service.TargetSpecService;
import com.lifeeditor.service.user_specService;


/**
 * Servlet implementation class EditorHotMan
 */
@WebServlet("/TargetStatusServlet")
public class TargetStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public TargetStatusServlet() {
        super();
    }

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println(1);  
		System.out.println("aaa");
//	    response.setHeader("Access-control-Allow-Origin","*");
//        response.setHeader("content-type", "text/html;charset=UTF-8");
//		request.setCharacterEncoding("UTF-8");
		
		Integer status = Integer.parseInt(request.getParameter("status"));
		Integer targetID = Integer.parseInt(request.getParameter("targetID"));
	
		
		TargetService targetSvc = new TargetService();
		targetSvc.updateTargetStatus(status,targetID);
		
//		request.setAttribute("setOKK",targetSvc);
//		RequestDispatcher successMsg =request.getRequestDispatcher("/manager/showTargetSpec.jsp");
//		successMsg.forward(request,response);
		
		return;
		
//		TargetSpecService TarStaSvc = new TargetSpecService();
//		TarStaSvc.getOneTrgSpec(targetID);
//		System.out.println("ANAN");	
	}

}
