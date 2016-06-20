package com.lifeeditor.controller.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.lifeeditor.model.target_list.Target_ListVO;
import com.lifeeditor.model.target_spec.Target_specVO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.TargetSpecService;
import com.lifeeditor.service.Target_List_Service;
import com.lifeeditor.service.user_specService;


@WebServlet("/getTargetSpecs")
public class getTargetSpecs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public getTargetSpecs() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Integer targetID =  new Integer(req.getParameter("targetID"));
		
		System.out.println(targetID);
		Target_List_Service targetListSvc = new Target_List_Service();
		Target_ListVO trgListVO = targetListSvc.findByTargetID(targetID);
		
		user_specVO user_specVO = trgListVO.getUserVO();
		
		TargetSpecService targetSpecSvc = new TargetSpecService();
		
		List<Target_specVO> targetSpec = targetSpecSvc.getNote(user_specVO.getUserID(), targetID);
			
		JsonArray jsonArray = new JsonArray();
		JsonObject jsonObj ;
		for(Target_specVO vo : targetSpec ){
			jsonObj = new JsonObject();
			jsonObj.addProperty("targetID", vo.getTargetVO().getTargetID());
			jsonObj.addProperty("userID", vo.getUserVO().getUserID());
			jsonObj.addProperty("trgSpecID",vo.getTrgSpecID());
			jsonObj.addProperty("trgNote", vo.getTrgNote());
			jsonObj.addProperty("trgPicPath",vo.getTrgPicPath());
			jsonArray.add(jsonObj);
			
		}
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
