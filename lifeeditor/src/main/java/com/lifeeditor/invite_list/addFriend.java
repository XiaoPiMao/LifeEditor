package com.lifeeditor.invite_list;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/com.lifeeditor.invite_list/addFriend")
public class addFriend extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public addFriend() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String me = "26";
		String myFri = request.getParameter("id");
		try {
			new addFriendDAO().insert(me,myFri);
		} catch (SQLException e) {			
			e.printStackTrace();
		}
	}

}
