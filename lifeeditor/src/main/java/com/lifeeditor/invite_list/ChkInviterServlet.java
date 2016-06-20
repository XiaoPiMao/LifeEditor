package com.lifeeditor.invite_list;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lifeeditor.model.user_spec.user_specVO;

@WebServlet("/com.lifeeditor.invite_list/ChkInviterServlet")
public class ChkInviterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ChkInviterServlet() {
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
		String userID = sessionMe.getUserID().toString();
		String getInviter = request.getParameter("id");
		String getStatus = request.getParameter("status");
		
		addFriendDAO chkInviter = new addFriendDAO();
		
		if(getStatus.equals("delete")){	
			chkInviter.deleteInviter(userID, getInviter);
		}else if(getStatus.equals("makeFriend")){
			chkInviter.addFriendFromInviter(userID, getInviter);
		}else if(getStatus.equals("deleteFriend")){
			chkInviter.deleteFriend(userID,getInviter);
		}

		
	}

}
