package com.lifeeditor.invite_list;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lifeeditor.model.user_spec.user_specVO;

@WebServlet("/com.lifeeditor.invite_list/addFriendServlet")
public class addFriendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public addFriendServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();	
		user_specVO sessionMe = (user_specVO) session.getAttribute("LoginOK");
		Integer me = sessionMe.getUserID();
		String myFri = request.getParameter("id");
		try {
			new addFriendDAO().insert(me,myFri);
		} catch (SQLException e) {			
			e.printStackTrace();
		}
	}

}
