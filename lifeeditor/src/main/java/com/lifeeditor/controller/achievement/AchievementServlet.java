package com.lifeeditor.controller.achievement;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lifeeditor.model.achievement.AchievementVO;
import com.lifeeditor.service.AchievementService;

@WebServlet("/AchievementServlet")
public class AchievementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public AchievementServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String achID = req.getParameter("achID");
		
		AchievementService achmtSrve = new AchievementService();
		AchievementVO achVO = achmtSrve.getOneEmp(Integer.parseInt(achID));
		
		resp.setCharacterEncoding("UTF-8");
		Writer os = resp.getWriter();
		os.write(achVO.getAchDesc());
			
	}
	
}
