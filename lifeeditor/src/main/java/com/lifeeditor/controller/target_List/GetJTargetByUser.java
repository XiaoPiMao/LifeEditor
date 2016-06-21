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
import com.lifeeditor.model.genkiBar_list.genkiBar_listVO;
import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.model.target_list.Target_ListVO;
import com.lifeeditor.model.target_spec.Target_specVO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.TargetSpecService;
import com.lifeeditor.service.Target_List_Service;
import com.lifeeditor.service.ach_listService;
import com.lifeeditor.service.commentsService;
import com.lifeeditor.service.genkiBar_listService;


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
		System.out.println("targets");
		
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
		System.out.println("liveComments");
		
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
		}
		request.setAttribute("jAchs", jsonArray.toString());
		System.out.println("jAchs");
		
		TargetSpecService trgSpecSvc = new TargetSpecService();
		List<Target_specVO> trgSpecs = trgSpecSvc.getByUser(userID);
		jsonObj = new JsonObject();
		jsonArray = new JsonArray();
		Integer tempTrgID = 0;
		int length = trgSpecs.size();
		for(int i = 0;i < length;i++) {
			Target_specVO trgSpec = trgSpecs.get(i);
			JsonObject jObj_trgSpec = new JsonObject();
			jObj_trgSpec.addProperty("trgNote", trgSpec.getTrgNote().replaceAll("\"", "\\\\\""));
			jObj_trgSpec.addProperty("picPath", trgSpec.getTrgPicPath());
			int trgID = trgSpec.getTargetID();
			
			if(i == 0) {
				jsonArray.add(jObj_trgSpec);
				tempTrgID = trgID;
				if(i == length - 1) {
					jsonObj.add(tempTrgID.toString(), jsonArray);
				}
				
				continue;
			}
			
			if(tempTrgID != trgID) {
				jsonObj.add(tempTrgID.toString(), jsonArray);
				jsonArray = new JsonArray();
				jsonArray.add(jObj_trgSpec);
				tempTrgID = trgID;
			}else {
				jsonArray.add(jObj_trgSpec);
			}
			if(i == length - 1) {
				jsonObj.add(tempTrgID.toString(), jsonArray);
				break;
			}
		}
		request.setAttribute("jSpecs", jsonObj.toString());
		System.out.println("jSpecs");
		
		
		genkiBar_listService gblSvc = new genkiBar_listService();
		List<genkiBar_listVO> genkis = gblSvc.haveGenki(userID, userID);
		System.out.println("jHaveGenki");
		jsonObj = new JsonObject();
		for(genkiBar_listVO genki : genkis) {
			jsonObj.addProperty(genki.getTargetID().toString(), true);
		}
		request.setAttribute("jHaveGenki", jsonObj.toString());
		
		
		
		request.getRequestDispatcher("/test.jsp").forward(request, response);
	}

}
