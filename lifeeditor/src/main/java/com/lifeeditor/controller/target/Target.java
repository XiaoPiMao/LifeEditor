package com.lifeeditor.controller.target;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.model.type_list.TypeListVO;



@WebServlet("/target")
public class Target extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		System.out.println(request.getParameter("timeStart"));
		System.out.println(action);
		if("insert".equals(action)) {
			String errorMsg = "";
			String intention = request.getParameter("intention");
			String trgName = request.getParameter("trgName");
			String timeStartStr = request.getParameter("timeStart");
			String timeFinishStr = request.getParameter("timeFinish");
			if(trgName == null || trgName.trim().length() == 0 ) 
				errorMsg += "名稱要填唷!";
			if(intention == null || intention.trim().length() == 0 ) 
				errorMsg += " 初衷要填唷!";
			if( (timeStartStr == null || timeFinishStr == null) || 
					(timeStartStr.trim().length() == 0 || timeFinishStr.trim().length() == 0) )	
				errorMsg += " 日期沒填好!";
			else {
				java.sql.Date timeStart = java.sql.Date.valueOf(timeStartStr);
				java.sql.Date timeFinish = java.sql.Date.valueOf(timeFinishStr);
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
			
//			
//			TargetVO target = new TargetVO();
//			
//			
//			
//			target.setTrgName(request.getParameter("trgName"));
//			TypeListVO type = new TypeListVO();
//			type.setTypeID(Integer.parseInt(request.getParameter("typeID")));
//			target.setTypeVO(type);
			return;
		}
	}
	

}
