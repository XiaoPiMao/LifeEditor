package com.lifeeditor.controller.target_List;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.hibernate.Hibernate;

import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.AchievementService;
import com.lifeeditor.service.TargetService;
import com.lifeeditor.service.Target_List_Service;

@WebServlet("/userAddTargetServlet")
public class userAddTargetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public userAddTargetServlet() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		/***************************1.新增資料***************************************/	
		
		 if("insert".equals(action)){ // 來自user_challenge.jsp的新增請求
		
				
				//String LoginOK = req.getParameter("LoginOK");
				user_specVO user = (user_specVO) req.getSession().getAttribute("LoginOK");
				Integer userID = user.getUserID();
							
				//Integer userID = Integer.parseInt(req.getParameter("userID"));
				
				Integer targetID = Integer.parseInt(req.getParameter("targetID"));	
				System.out.println(targetID);
				TargetService trgSrvc= new TargetService();
				trgSrvc.copyTrg(targetID, userID);

		 }
		
		 
		 
		 
		 
	}

}
