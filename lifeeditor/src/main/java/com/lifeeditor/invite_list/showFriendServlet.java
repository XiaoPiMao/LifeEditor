package com.lifeeditor.invite_list;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lifeeditor.backstage.report.DataToGson;
import com.lifeeditor.model.user_spec.user_specVO;

@WebServlet("/com.lifeeditor.invite_list/showFriendServlet")
public class showFriendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public showFriendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/json");
		HttpSession session = request.getSession();
		user_specVO user = (user_specVO) session.getAttribute("LoginOK");
		Integer userID = user.getUserID();
		List<user_listVO> showFriend = new addFriendDAO().showMyFriend(userID);
		
		if(showFriend != null){
			
			String DataFromJson = new DataToGson().changeDataToGson(showFriend);
			PrintWriter pw = response.getWriter();
			pw.write(DataFromJson);
			
		}
	}

}
