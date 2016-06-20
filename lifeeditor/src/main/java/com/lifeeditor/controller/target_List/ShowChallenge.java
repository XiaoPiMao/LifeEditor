package com.lifeeditor.controller.target_List;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.TargetService;
import com.lifeeditor.utility.MyGson;


@WebServlet("/ShowChallenge")
public class ShowChallenge extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ShowChallenge() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		TargetService trgSrvc = new TargetService();
		List<TargetVO> list = null; 
		JsonArray jArray = new JsonArray();
		JsonObject jObj = null;
		trgSrvc= new TargetService();
		list=  trgSrvc.getAllofficial();
		
		
	
		for(TargetVO target : list) {
			jObj = MyGson.GSON.toJsonTree(target).getAsJsonObject();
			int countNames =  trgSrvc.countNumsOfTargetName(target.getTrgName());
			jObj.addProperty("countNames", countNames);
			if(countNames > 0) {
				int rateNames =  trgSrvc.countRateOfTargetName(target.getTrgName());
				jObj.addProperty("rateNames", rateNames);
			}else {
				jObj.addProperty("rateNames", 0);
			}
			jArray.add(jObj);
		}
		req.setAttribute("oc", jArray.toString().replaceAll("\"", "\\\\\""));
		

/***************************3.登入時自動抓出該會員先前接過的挑戰***************************************/			
		user_specVO user = (user_specVO) req.getSession().getAttribute("LoginOK");
		Integer userID = user.getUserID();
		System.out.println(userID);			
		list=  trgSrvc.getAllChallengeNameFromUser(userID);
		String jsonStr2 = MyGson.GSON.toJson(list);
		req.setAttribute("ut", jsonStr2);
						
		req.getRequestDispatcher("/apply_challenge.jsp").forward(req, res);
	}
	

}
