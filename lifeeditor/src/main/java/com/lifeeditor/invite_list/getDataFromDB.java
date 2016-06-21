package com.lifeeditor.invite_list;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lifeeditor.backstage.report.DataToGson;
import com.lifeeditor.model.user_spec.user_specVO;

/**
 * Servlet implementation class getDataFromDB
 */
@WebServlet("/com.lifeeditor.invite_list/getDataFromDB")
public class getDataFromDB extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public getDataFromDB() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		String mySelectWord = request.getParameter("txt");

		
		HttpSession session = request.getSession();
		user_specVO user = (user_specVO) session.getAttribute("LoginOK"); //得到user
		Integer userID = user.getUserID(); //取得userID
	
		List<user_listVO> EndData = new ArrayList<user_listVO>();//回傳的List
		
		try {
			List<user_listVO> data = new addFriendDAO().selectFriend(userID);
			for(int i = 0;i< data.size();i++){ //讀取可加資料
				if(data.get(i).getLastname().contains(mySelectWord) || data.get(i).getFirstname().contains(mySelectWord)){
					user_listVO mySelectValue = new user_listVO();
					mySelectValue.setUserid(data.get(i).getUserid());
					mySelectValue.setAccount(data.get(i).getAccount());
					mySelectValue.setLastname(data.get(i).getLastname());
					mySelectValue.setFirstname(data.get(i).getFirstname());
					EndData.add(mySelectValue); //裝貨櫃
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(EndData != null){ //如果是空值就回傳空的
			String DatafromJson = new DataToGson().changeDataToGson(EndData);
			PrintWriter pw = response.getWriter();
			pw.write(DatafromJson);
		}
	}

}
