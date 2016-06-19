package com.lifeeditor.controller.target;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.TargetService;
import com.lifeeditor.utility.MyGson;

@WebServlet("/SearchTarget")
public class SearchTarget extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearchTarget() {
        super();
    }


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		TargetService trgSrvc= new TargetService();
		Gson gson = new GsonBuilder().create();
		List<TargetVO> list = null;
		TargetVO trgVO = null;
		String jsonStr = null;
		PrintWriter os = null;
		
		user_specVO user = (user_specVO) req.getSession().getAttribute("LoginOK");
		Integer userID = user.getUserID();

		System.out.println(userID);	
		
		
		
		/*********************1.從keyword搜尋任務名稱****************************/
		
		if("keyWordSearch".equals(action)) { // 來自achievement.jsp的請求
			
			res.setCharacterEncoding("UTF-8");
			res.setContentType("application/json");
			String keyword = req.getParameter("keyword");
				
			trgSrvc =  new TargetService();
			list =  trgSrvc.getFromKeyWordSearch(keyword);

			jsonStr = MyGson.GSON.toJson(list);
			os = res.getWriter();
			os.print(jsonStr);
			
			return;
			
		}
		
		
		/*********************2.從自動隨機產生一個任務****************************/
		
		if("getRandomTarget".equals(action)) { // 來自achievement.jsp的請求
			
			res.setCharacterEncoding("UTF-8");
			res.setContentType("application/json");
	
			trgSrvc =  new TargetService();
			trgVO =  trgSrvc.getRandomTarget();

			gson = new GsonBuilder().setDateFormat("MM/dd/yyyy").create();
			jsonStr = gson.toJson(trgVO);
			os = res.getWriter();
			os.print(jsonStr);
			
			return;
			
		}
		
		
		
	}

}
