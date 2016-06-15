package com.lifeeditor.controller.ach_list;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lifeeditor.model.ach_list.ach_listVO;
import com.lifeeditor.service.AchievementService;
import com.lifeeditor.service.ach_listService;


@WebServlet("/ach_listServlet")
public class ach_listServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ach_listServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		Integer userID = new Integer(req.getParameter("userID"));
		
		ach_listService ach_listSvc = new ach_listService();
		
		List<ach_listVO> achList = ach_listSvc.getAchName(userID);
		
		req.setAttribute("achList", achList);
		
		String url = "/ach_list/ach_list.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url); 
		successView.forward(req, resp);
		
		
	}

}
