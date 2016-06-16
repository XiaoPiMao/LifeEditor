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

import com.lifeeditor.backstage.report.DataToGson;

@WebServlet("/com.lifeeditor.schedule/ShowDetailServlet")
public class ShowDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ShowDetailServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");

		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		try {
			List<scheduleVO> getDetail = new scheduleDAO().getScheduleFromUser(id);
			String getJson = new DataToGson().changeDataToGson(getDetail);
			out.write(getJson);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
