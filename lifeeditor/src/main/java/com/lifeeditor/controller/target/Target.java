package com.lifeeditor.controller.target;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lifeeditor.model.sec_list.SecListVO;
import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.model.type_list.TypeListVO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.TargetService;
import com.lifeeditor.service.Target_List_Service;



@WebServlet("/target")
public class Target extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		user_specVO user = (user_specVO)request.getSession().getAttribute("LoginOK");
		if("insert".equals(action)) {
			String errorMsg = "";
			String intention = request.getParameter("intention");
			String trgName = request.getParameter("trgName");
			String timeStartStr = request.getParameter("timeStart");
			String timeFinishStr = request.getParameter("timeFinish");
			java.sql.Date timeStart = null;
			java.sql.Date timeFinish = null;
			if(trgName == null || trgName.trim().length() == 0 ) 
				errorMsg += "名稱要填唷!";
			if(intention == null || intention.trim().length() == 0 ) 
				errorMsg += " 初衷要填唷!";
			if( (timeStartStr == null || timeFinishStr == null) || 
					(timeStartStr.trim().length() == 0 || timeFinishStr.trim().length() == 0) )	
				errorMsg += " 日期沒填好!";
			else {
				timeStart = java.sql.Date.valueOf(timeStartStr);
				timeFinish = java.sql.Date.valueOf(timeFinishStr);
				long start = timeStart.getTime();
				long finish = timeFinish.getTime();
				if(finish < System.currentTimeMillis()-86400*1000)
					errorMsg += " 結束時間不能小於今天";
				//if(timeStart.compareTo(anotherString))
				else if(finish < start)
					errorMsg += " 結束時間不能小於開始時間";
			}
			
			if(errorMsg.length() != 0) {
				response.setCharacterEncoding("utf-8");
				response.getWriter().print(errorMsg);
				return;
			}
			
			Integer typeID = Integer.parseInt(request.getParameter("typeID"));
			
			TargetVO target = new TargetVO();
			target.setTimeStart(timeStart);
			target.setTimeFinish(timeFinish);
			target.setIntention(intention);
			target.setTrgName(trgName);
			target.setPrivacy(Integer.parseInt(request.getParameter("privacy")));
			target.setPriority(Integer.parseInt(request.getParameter("priority")));
			target.setGenkiBar(0);
			target.setStatus(1);
			target.setTrgType(3);
			TypeListVO type = new TypeListVO();
			type.setTypeID(typeID);
			target.setTypeVO(type);
			if(typeID != 0) {
				SecListVO sec = new SecListVO();
				sec.setSecID(Integer.parseInt(request.getParameter("sectionID")));
				target.setSectionVO(sec);
			}
			TargetService trgSvc = new TargetService();
			int targetID = trgSvc.addTrg(target);
			
			Target_List_Service trgListSvc = new Target_List_Service();
			trgListSvc.addTrgList(user.getUserID(), targetID);
			return;
		}
	}
	

}
