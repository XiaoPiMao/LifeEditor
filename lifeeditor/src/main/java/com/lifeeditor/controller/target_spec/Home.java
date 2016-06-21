package com.lifeeditor.controller.target_spec;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.lifeeditor.model.target_spec.Target_specVO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.TargetSpecService;


@WebServlet("/home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Integer userID = ((user_specVO)request.getSession().getAttribute("LoginOK")).getUserID();
		
		TargetSpecService trgSpecSvc = new TargetSpecService();
		List<Target_specVO> trgSpecs = trgSpecSvc.getHomePage(userID);
		JsonArray jArray = new JsonArray();
		JsonObject jObj = null;
		for(Target_specVO trgSpec : trgSpecs) {
			jObj = new JsonObject();
			jObj.addProperty("trgSpecID", trgSpec.getTrgSpecID());
			jObj.addProperty("userID", trgSpec.getUserVO().getUserID());
			jObj.addProperty("firstName", trgSpec.getUserVO().getFirstName());
			jObj.addProperty("lastName", trgSpec.getUserVO().getLastName());
			jObj.addProperty("targetID", trgSpec.getTargetVO().getTargetID());
			jObj.addProperty("trgNote", trgSpec.getTrgNote());
			jObj.addProperty("trgPicPath", trgSpec.getTrgPicPath());
			jObj.addProperty("trgName", trgSpec.getTargetVO().getTrgName());
			jObj.addProperty("intention", trgSpec.getTargetVO().getIntention());
			jArray.add(jObj);
		}
		
		request.setAttribute("jHome",jArray.toString());
		
		RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
		rd.forward(request, response);
		
		
	}

}
