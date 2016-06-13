package com.lifeeditor.controller.achievement;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.hibernate.Hibernate;
import com.google.gson.Gson;
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
		String action = req.getParameter("action");
		
		/*********************achievement.jsp頁面展示時，必走的程式****************************/
		
		if("autoComplete".equals(action)) { // 來自achievement.jsp的請求
			
			resp.setContentType("application/json");
			String keyword = req.getParameter("keyword");
			
			AchievementService achmtSrvc= new AchievementService();
			List<AchievementVO> list = achmtSrvc.findKey(keyword);
			
			Gson gson = new Gson();
			String jsonStr = gson.toJson(list);
			PrintWriter pos = resp.getWriter();
			pos.print(jsonStr);
					
			return;
		}
		
		/***************************新增圖片資料***************************************/	
		 
		 if("insertAchmt".equals(action)){ // 來自achievement.jsp的新增請求
			 
			 try{
				 
				String achName = req.getParameter("achName");
				String achDesc = req.getParameter("achDesc");
				Part filePart = req.getPart("rewardPic");
				
	            InputStream in = filePart.getInputStream();
				@SuppressWarnings("deprecation")
				Blob rewardPic = Hibernate.createBlob(in);
				
				AchievementVO achmtVO = new AchievementVO();
				achmtVO.setAchName(achName);
				achmtVO.setAchDesc(achDesc);
				achmtVO.setRewardPic(rewardPic);
				
				AchievementService achmtSrvc = new AchievementService();
				achmtSrvc.addAchmt(achName, achDesc, rewardPic);
	
				 
			 }catch(Exception se){;
				 se.printStackTrace();
			 }
			 
		 }

			
	}
	
}
