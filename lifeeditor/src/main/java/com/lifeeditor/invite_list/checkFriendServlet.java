package com.lifeeditor.invite_list;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lifeeditor.backstage.report.DataToGson;
import com.lifeeditor.model.user_spec.user_specVO;

@WebServlet("/com.lifeeditor.invite_list/checkFriendServlet")
public class checkFriendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public checkFriendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		user_specVO sessionMe = (user_specVO) session.getAttribute("LoginOK");
		Integer userID = sessionMe.getUserID();

		try {
			List<user_listVO> getChkFriend = new addFriendDAO().checkMyFriend(userID);
			if(getChkFriend != null){
				String DataFromJson = new DataToGson().changeDataToGson(getChkFriend);
				PrintWriter pw = response.getWriter();
				pw.write(DataFromJson);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
