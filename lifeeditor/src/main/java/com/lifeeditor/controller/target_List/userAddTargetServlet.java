package com.lifeeditor.controller.target_List;

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
import com.lifeeditor.model.achievement.AchievementVO;
import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.AchievementService;
import com.lifeeditor.service.TargetService;
import com.lifeeditor.utility.MyGson;

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
		
		
		TargetService trgSrvc= new TargetService();
		Gson gson = new GsonBuilder().create();
		List<TargetVO> list = null;
		String jsonStr = null;
		PrintWriter os = null;
		
		/***************************1-A.從官方挑戰承接目標copy下來用***************************************/	
		
		 if("insert".equals(action)){ // 來自user_challenge.jsp的新增請求
					
				//String LoginOK = req.getParameter("LoginOK");
				user_specVO user = (user_specVO) req.getSession().getAttribute("LoginOK");
				Integer userID = user.getUserID();
							
				//Integer userID = Integer.parseInt(req.getParameter("userID"));
				
				Integer targetID = Integer.parseInt(req.getParameter("targetID"));	
				System.out.println(targetID);
				trgSrvc= new TargetService();
				trgSrvc.copyTrg(targetID, userID);
				
				return;
		 }
		 
			/***************************1-B.從搜尋獲隨機目標找到的目標take下來用***************************************/	
			
		 if("insertTake".equals(action)){ // 來自user_challenge.jsp的新增請求
					
				//String LoginOK = req.getParameter("LoginOK");
				user_specVO user = (user_specVO) req.getSession().getAttribute("LoginOK");
				Integer userID = user.getUserID();
							
				//Integer userID = Integer.parseInt(req.getParameter("userID"));
				
				Integer targetID = Integer.parseInt(req.getParameter("targetID"));
				String trgName = req.getParameter("trgName");
				String intention = req.getParameter("intention");
				System.out.println(targetID);
				trgSrvc= new TargetService();
				trgSrvc.takeTrg2(targetID, trgName, intention, userID);
				
				return;
		 }
	 
		 /***************************2.進入頁面時，抓出所有的官方挑戰，存成Json來用***************************************/	
			
		 if("showAllOfficial".equals(action)){ // 來自user_challenge.jsp的新增請求
		
				 res.setCharacterEncoding("UTF-8");
				 res.setContentType("application/json");
	
				//String LoginOK = req.getParameter("LoginOK");
//				user_specVO user = (user_specVO) req.getSession().getAttribute("LoginOK");
//				Integer userID = user.getUserID();
//	
//				Integer targetID = Integer.parseInt(req.getParameter("targetID"));
						
				trgSrvc= new TargetService();
				list=  trgSrvc.getAllofficial();
	
				
				jsonStr = MyGson.GSON.toJson(list);
				os = res.getWriter();
				os.print(jsonStr);
				
				return;
		 }
			
		 
		 /***************************3.登入時自動抓出該會員先前接過的挑戰***************************************/	
			
		 if("showAllChallengeName".equals(action)){ // 來自user_challenge.jsp的新增請求
		
				 res.setCharacterEncoding("UTF-8");
				 res.setContentType("application/json");
	
				//String LoginOK = req.getParameter("LoginOK");
				user_specVO user = (user_specVO) req.getSession().getAttribute("LoginOK");
				Integer userID = user.getUserID();
	
				System.out.println(userID);			
				
				list=  trgSrvc.getAllChallengeNameFromUser(userID);
				
				
				
				jsonStr = MyGson.GSON.toJson(list);
				os = res.getWriter();
				os.print(jsonStr);

				return;
								
		 }	 
		 
		 
			
		/*********************4.從挑戰名稱取得的keyword下SQL指令，以算出數量****************************/
		
		if("countNames".equals(action)) { // 來自achievement.jsp的請求
			
			res.setCharacterEncoding("UTF-8");
			String keyword = req.getParameter("keyword");
				
			trgSrvc =  new TargetService();
			int result =  trgSrvc.countNumsOfTargetName(keyword);
			
			os = res.getWriter();
			os.print(result);
		
			return;
		}
			 

		
		/*********************5.從挑戰名稱取得的keyword下SQL指令，以算出達成率****************************/
		
		if("rateNames".equals(action)) { // 來自achievement.jsp的請求
			
			res.setCharacterEncoding("UTF-8");
			String keyword = req.getParameter("keyword");
				
			trgSrvc =  new TargetService();
			int result =  trgSrvc.countRateOfTargetName(keyword);
			
			os = res.getWriter();
			os.print(result);
		
			return;
		}
		
		
		 /*********************取得一筆target****************************/
		
			if("getTarget".equals(action)) { // 來自achievement.jsp的請求
				res.setCharacterEncoding("UTF-8");
				res.setContentType("application/json");
				
				trgSrvc = new TargetService();
				TargetVO vo =  trgSrvc.getOneTrg(new Integer(req.getParameter("targetID")));
						
				jsonStr = MyGson.GSON.toJson(vo);
				os = res.getWriter();
				os.print(jsonStr);
				
				return;
			}
		
			 
	}

}
