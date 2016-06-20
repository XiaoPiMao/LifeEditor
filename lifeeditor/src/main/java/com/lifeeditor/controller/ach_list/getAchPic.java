package com.lifeeditor.controller.ach_list;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lifeeditor.model.achievement.AchievementVO;
import com.lifeeditor.model.sec_list.SecListVO;
import com.lifeeditor.service.AchievementService;
import com.lifeeditor.service.SecListService;

/**
 * Servlet implementation class getAchPic
 */
@WebServlet("/getAchPic")
public class getAchPic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public getAchPic() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			OutputStream os = null;	
		Integer achID = new Integer(req.getParameter("achID"));
		
		AchievementService achSrc = new AchievementService();
		AchievementVO AchievementVO = achSrc.getOneAchmt(achID);
		Blob b = AchievementVO.getRewardPic();
		
		long size;
		
			size = b.length();
		
		byte[] bs = b.getBytes(1, (int)size);
		resp.setContentType("image/jpeg");
		os = resp.getOutputStream();
		os.write(bs);
		
		os.flush();
		
		os.close();
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
