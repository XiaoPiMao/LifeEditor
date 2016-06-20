package com.lifeeditor.controller.genkiBar_list;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.genkiBar_listService;
import com.lifeeditor.utility.MyGson;


@WebServlet("/genkiBar")
public class GenkiBar extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		Integer userID = ((user_specVO)request.getSession().getAttribute("LoginOK")).getUserID();
		Integer targetID = Integer.parseInt(request.getParameter("targetID"));
		genkiBar_listService genkiSvc = new genkiBar_listService();
		response.setCharacterEncoding("utf-8");
		
		if("whoGenki".equals(action)) {
			List<user_specVO> list = genkiSvc.whoGenki(targetID);
			response.setContentType("application/json");
			response.getWriter().write(MyGson.GSON.toJson(list));;
			return;
		}
		
		if("insert".equals(action)) {
			genkiSvc.genki(targetID, userID);
			return;
		}
		
		if("delete".equals(action)) {
			genkiSvc.degenki(targetID, userID);
			return;
		}
	}

}
