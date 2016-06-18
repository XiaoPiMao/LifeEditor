package com.lifeeditor.controller.app;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.model.target_list.Target_ListVO;
import com.lifeeditor.service.TargetService;


@WebServlet("/getTarget")
public class getTarget extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public getTarget() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer targetID = new Integer(req.getParameter("targetID"));
		
		TargetService trgSvc = new TargetService();
		
		TargetVO targetVO = new TargetVO();
		
		targetVO = trgSvc.getOneTrg(targetID);
		
		JsonArray jsonArray = new JsonArray();
		JsonObject jsonObj ;
		
			jsonObj = new JsonObject();
			jsonObj.addProperty("targetID", targetVO.getTargetID());
			jsonObj.addProperty("trgName",targetVO.getTrgName());
			jsonObj.addProperty("typeName", targetVO.getTypeVO().getTypeName());
			jsonObj.addProperty("secName",targetVO.getSectionVO().getSecName());
			jsonObj.addProperty("intention",targetVO.getIntention());
			jsonArray.add(jsonObj);
			
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter os = resp.getWriter();
		Gson gson = new Gson();	
//		System.out.println(gson.toJson(targetLists));
//		os.write(gson.toJson(targetLists));
		os.println(jsonArray.toString());
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
