package com.lifeeditor.controller.target;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lifeeditor.model.target_spec.Target_specVO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.TargetService;
import com.lifeeditor.service.TargetSpecService;
import com.lifeeditor.service.user_specService;


/**
 * Servlet implementation class EditorHotMan
 */
@WebServlet("/manager/TargetSpecServlet")
public class TargetSpecServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public TargetSpecServlet() {
        super();
    }

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		System.out.println("aaa");
	    response.setHeader("Access-control-Allow-Origin","*");
        response.setHeader("content-type", "text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		Integer targetID = Integer.parseInt(request.getParameter("targetID"));
	 
//		Integer userID = Integer.parseInt(request.getParameter("userID"));
//  	Integer trgNote = Integer.parseInt(request.getParameter("trgNote"));

		TargetSpecService trgSpeSvc = new TargetSpecService();
		
		Target_specVO vo = trgSpeSvc.getOneTrgSpec(targetID);
		request.setAttribute("setOK",vo);
		RequestDispatcher successMsg =request.getRequestDispatcher("/manager/showTargetSpec.jsp");
		successMsg.forward(request,response);
		return;

	    

	}

}
