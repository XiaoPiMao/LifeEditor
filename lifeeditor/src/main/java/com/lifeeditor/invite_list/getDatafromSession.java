package com.lifeeditor.invite_list;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
import com.lifeeditor.model.user_spec.user_specVO;

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
		user_specVO user1 = (user_specVO) session.getAttribute("LoginOK"); //得到user
		Integer userName = user1.getUserID();
		ArrayList<Integer> oldFri = null;
		try {
			oldFri = new addFriendDAO().select(userName);
//			for(int i = 0;i<oldFri.size();i++){
//				System.out.println(oldFri.get(i));
//			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println("Hello");
		for(int i = 0;i<data.size();i++){
			if(data.get(i).getName().contains(txt) && (data.get(i).getUserid() != userName) ){	 //判斷有包含txt的資料

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
