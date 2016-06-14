package com.lifeeditor.controller.target_List;

import java.io.IOException;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.*;
import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.model.target_list.Target_ListVO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.Target_List_Service;


@WebServlet("/GetJTargetByUser")
public class GetJTargetByUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Target_List_Service trgListSvc = new Target_List_Service();
		user_specVO user = (user_specVO)request.getSession().getAttribute("LoginOK");
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().setDateFormat("yyyy-MM-dd").create();
		List<Target_ListVO> list = trgListSvc.findByUserID(user.getUserID());
		JsonArray jsonArray = new JsonArray();
		JsonObject jsonObj = null;
		for(Target_ListVO trgList : list) {
			jsonObj = new JsonObject();
			TargetVO trg = trgList.getTrgVO();
			JsonObject JTrg = gson.toJsonTree(trg).getAsJsonObject();
			jsonObj.addProperty("typeID", trg.getTypeVO().getTypeID());
			jsonObj.addProperty("secID", trg.getSectionVO().getSecID());
			
			for(Entry<String,JsonElement> entry : JTrg.entrySet()) {
				String key = entry.getKey();
				if(!key.equals("typeVO") && !key.equals("sectionVO")) 
					jsonObj.add(key, entry.getValue());
			}
			jsonArray.add(jsonObj);
		}
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.getWriter().write(jsonArray.toString());
	}

}
