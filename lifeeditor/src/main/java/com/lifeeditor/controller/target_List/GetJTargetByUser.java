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
import com.lifeeditor.model.ach_list.ach_listVO;
import com.lifeeditor.model.achievement.AchievementVO;
import com.lifeeditor.model.comments.commentsVO;
import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.model.target_list.Target_ListVO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.Target_List_Service;
import com.lifeeditor.service.ach_listService;
import com.lifeeditor.service.commentsService;


@WebServlet("/UserPage")
public class GetJTargetByUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Target_List_Service trgListSvc = new Target_List_Service();
		user_specVO user = (user_specVO)request.getSession().getAttribute("LoginOK");
		Integer userID = user.getUserID();
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().setDateFormat("yyyy-MM-dd").create();
		List<TargetVO> list = trgListSvc.pageFindByUserID(userID);
		JsonArray jsonArray = new JsonArray();
		JsonObject jsonObj = null;
		for(TargetVO trg  : list) {
			jsonObj = new JsonObject();
			JsonObject JTrg = gson.toJsonTree(trg).getAsJsonObject();
			jsonObj.addProperty("typeID", trg.getTypeVO().getTypeID());
			jsonObj.addProperty("typeName", trg.getTypeVO().getTypeName());
			jsonObj.addProperty("secID", trg.getSectionVO().getSecID());
			jsonObj.addProperty("secName", trg.getSectionVO().getSecName());
			
			for(Entry<String,JsonElement> entry : JTrg.entrySet()) {
				String key = entry.getKey();
				if(!key.equals("typeVO") && !key.equals("sectionVO")) 
					jsonObj.add(key, entry.getValue());
			}
			jsonArray.add(jsonObj);
		}
		request.setAttribute("targets", jsonArray.toString());
		
		jsonArray = new JsonArray();
		commentsService cmtSvc = new commentsService();
		List<commentsVO> comments = cmtSvc.getCommentByUser(userID);
		for(commentsVO comment : comments) {
			jsonObj = new JsonObject();
			jsonObj.addProperty("targetID", comment.getTargetID());
			user_specVO gUser = comment.getUser_specVO();
			jsonObj.addProperty("userID", gUser.getUserID());
			jsonObj.addProperty("firstName", gUser.getFirstName());
			jsonObj.addProperty("lastName", gUser.getLastName());
			jsonObj.addProperty("comment", comment.getComment());
			jsonArray.add(jsonObj);
			
		}
		request.setAttribute("liveComments", jsonArray.toString());
		
		ach_listService ach_listSvc = new ach_listService();
		List<ach_listVO> achLists = ach_listSvc.getAchName(userID);
		jsonArray = new JsonArray();
		for(ach_listVO achList : achLists) {
			AchievementVO ach = achList.getAchievementVO();
			jsonObj = new JsonObject();
			jsonObj.addProperty("achID", ach.getAchID());
			jsonObj.addProperty("achName", ach.getAchName());
			jsonObj.addProperty("achDesc", ach.getAchDesc());
			jsonArray.add(jsonObj);
			System.out.println(jsonArray.toString());
		}
		request.setAttribute("jAchs", jsonArray.toString());
		
		request.getRequestDispatcher("/test.jsp").forward(request, response);
	}

}
