package com.lifeeditor.controller.target;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.lifeeditor.model.achievement.AchievementVO;
import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.service.AchievementService;
import com.lifeeditor.service.TargetService;

@WebServlet("/ChallengeServlet")
public class insertChallengeServlet extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("autoComplete".equals(action)) {
			String keyword = req.getParameter("keyword");
			
			TargetService trgSrvc= new TargetService();
			List<TargetVO> list = trgSrvc.findKey(keyword);
			
			Gson gson = new GsonBuilder().setDateFormat("MM/dd/yyyy").create();
			String jsonStr = gson.toJson(list);
			res.setCharacterEncoding("UTF-8");
			PrintWriter os = res.getWriter();
			os.print(jsonStr);
			return;
		}
		
		
		
		
			
	}
	
}
