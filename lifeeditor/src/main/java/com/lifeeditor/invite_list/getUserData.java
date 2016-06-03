package com.lifeeditor.invite_list;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;
import com.lifeeditor.model.user_spec.user_specVO;

/**
 * Servlet implementation class getUserJson
 */
@WebServlet("/com.lifeeditor.invite_list/getUserData")
public class getUserData extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public getUserData() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		getAllFriendFromDB gaf = new getAllFriendFromDB();
		user_specVO user1 = (user_specVO) session.getAttribute("LoginOK"); //得到user
		Integer userName = user1.getUserID();
		List<myFriendVO> myAllFriend = gaf.selectFriend(userName);
		session.setAttribute("userData",myAllFriend); //創建Session物件 把friend放入
//		getAllDatafromDB ga = new getAllDatafromDB();
//		List<user_listVO> getalldata = ga.selectFriend();
//		session.setAttribute("userData",getalldata); //創建Session物件 把userData放入
		System.out.println("Add session Object");
		RequestDispatcher rd = request.getRequestDispatcher("/manager/_addfriend/addfriend.jsp");
		rd.forward(request, response);
		return;

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
