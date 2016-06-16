package com.lifeeditor.controller.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.lifeeditor.model.target_list.Target_ListVO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.Target_List_Service;
import com.lifeeditor.service.user_specService;


@WebServlet("/getTargetLists")
public class getTargetLists extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public getTargetLists() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Map<String, String> targetLists = new HashMap<String, String>();			
		req.setAttribute("trgName", targetLists);
		req.setAttribute("timeStart", targetLists);
		req.setAttribute("timeFinish", targetLists);
		
		String account = req.getParameter("account");
		String pswd = req.getParameter("pswd");
		
		user_specService userSvc = new user_specService();
		user_specVO user_specVO = userSvc.checkIDPassword(account, pswd);
		
		Target_List_Service targetListSvc = new Target_List_Service();
		
		List<Target_ListVO> targetList = targetListSvc.findByUserID(user_specVO.getUserID());
		
	
		for(Target_ListVO vo : targetList ){
			
			targetLists.put("trgName", vo.getTrgVO().getTrgName());
			targetLists.put("timeStart", vo.getTrgVO().getTimeStart().toString());
			targetLists.put("timeFinish", vo.getTrgVO().getTimeFinish().toString());
			
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter os = resp.getWriter();
		Gson gson = new Gson();		
		System.out.println(gson.toJson(targetLists));
		os.write(gson.toJson(targetLists));
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
