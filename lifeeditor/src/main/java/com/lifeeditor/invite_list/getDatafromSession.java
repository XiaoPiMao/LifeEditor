package com.lifeeditor.invite_list;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lifeeditor.backstage.report.DataToGson;

/**
 * Servlet implementation class getDatafromSession
 */
@WebServlet("/com.lifeeditor.invite_list/getDatafromSession")
public class getDatafromSession extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public getDatafromSession() {
        super();
        
    }

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		String txt = request.getParameter("txt"); //要搜尋的資料	
		int txtLength = txt.length();
		HttpSession session = request.getSession();		
		List<user_listVO> data = (List<user_listVO>) session.getAttribute("userData"); //讀取Session資料
		List<user_listVO> reData = new ArrayList<user_listVO>();//回傳的List
		
		for(int i = 0;i<data.size();i++){
			if(data.get(i).getName().contains(txt)){	 //判斷有包含txt的資料
				user_listVO user = new user_listVO();
				user.setUserid(data.get(i).getUserid());
				user.setAccount(data.get(i).getAccount());
				user.setName(data.get(i).getName());
				user.setPicture(data.get(i).getPicture());
				reData.add(user); //裝貨櫃
				
			}
		}
		if(reData != null){ //如果是空值就回傳空的
		String DatafromJson = new DataToGson().changeDataToGson(reData);
		PrintWriter pw = response.getWriter();
		pw.write(DatafromJson);
		}
	}

}
