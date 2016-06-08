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
		
		System.out.println(1);
		System.out.println(request.getParameter("trgName"));
		System.out.println(action);
		if("insert".equals(action)) {
			String errorMsg = "";
			String intension = request.getParameter("intension");
			String trgName = request.getParameter("trgName");
			String timeStart = request.getParameter("timeStart");
			String timeFinish = request.getParameter("timeFinish");
			if(trgName == null || trgName.trim().length() == 0 ) 
				errorMsg += "名稱要填唷!";
			if(intension == null || intension.trim().length() == 0 ) 
				errorMsg += " 初衷要填唷!";
			if(timeStart.contains("年") || timeFinish.contains("年"))	
				errorMsg += " 日期沒填好!";
			
			if(errorMsg.length() != 0) {
				System.out.println(1);
				response.setCharacterEncoding("Big5");
				response.getWriter().print(errorMsg);
				return;
			}
			
			
			TargetVO target = new TargetVO();
			
			
			
			target.setTrgName(request.getParameter("trgName"));
			TypeListVO type = new TypeListVO();
			type.setTypeID(Integer.parseInt(request.getParameter("typeID")));
			target.setTypeVO(type);
			return;
		}
	}
	

}
