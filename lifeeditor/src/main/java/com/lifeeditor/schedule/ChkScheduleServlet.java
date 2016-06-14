package com.lifeeditor.schedule;

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

@WebServlet("/com.lifeeditor.schedule/ChkScheduleServlet")
public class ChkScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ChkScheduleServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		user_specVO user = (user_specVO) session.getAttribute("LoginOK");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		//request.setCharacterEncoding("UTF-8");
		try {		
			//List<scheduleVO> userData = new scheduleDAO().getScheduleFromUser(user.getUserID());
			List<showScheduleVO> getShowJson = new scheduleDAO().showSchedule(user.getUserID());
			
			String getJson = new DataToGson().changeDataToGson(getShowJson);
			
			//System.out.println(getJson);
			out.write(getJson.toLowerCase());
			//System.out.println("Hello");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
