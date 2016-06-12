package com.lifeeditor.controller.target;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.hibernate.Hibernate;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.lifeeditor.model.achievement.AchievementVO;
import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.AchievementService;
import com.lifeeditor.service.TargetService;

@MultipartConfig()
@WebServlet("/ChallengeServlet")
public class insertChallengeServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		//System.out.println(action);

		
		/*********************achievement.jsp頁面展示時，必走的程式****************************/
		
		if("autoComplete".equals(action)) { // 來自achievement.jsp的請求
			
			 res.setCharacterEncoding("UTF-8");
			 res.setContentType("application/json");
			
			String keyword = req.getParameter("keyword");
			
			TargetService trgSrvc= new TargetService();
			List<TargetVO> list = trgSrvc.findKey(keyword);
			
			Gson gson = new GsonBuilder().setDateFormat("MM/dd/yyyy").create();
			String jsonStr = gson.toJson(list);
			//System.out.println(jsonStr);
			PrintWriter os = res.getWriter();
			os.print(jsonStr);
			
			
			return;
		}
		
		
		/***************************2.新增資料***************************************/	
			
		 if("insert".equals(action)){ // 來自achievement.jsp的新增請求
			try {
			Integer achID = 0;
			if(!req.getParameter("achID") .equals("undefined") )
			achID= Integer.parseInt(req.getParameter("achID"));	
			String achName = req.getParameter("achName");
			String achDesc = req.getParameter("achDesc");
			String trgName = req.getParameter("trgName");
			String intention = req.getParameter("intention");
			
			Integer typeID = Integer.parseInt(req.getParameter("typeID"));
			Integer sectionID = Integer.parseInt(req.getParameter("sectionID"));
			Integer difficulty = Integer.parseInt(req.getParameter("difficulty"));

			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			java.sql.Date timeStart = new java.sql.Date(
					sdf.parse(req.getParameter("timeStart")).getTime());
			java.sql.Date timeFinish = new java.sql.Date(
					sdf.parse(req.getParameter("timeFinish")).getTime());
			
			AchievementService achmtSrvc = new AchievementService();
			Part filePart = req.getPart("rewardPic");
			if(filePart.getSize() == 0L) {
				achID = achmtSrvc.addAchmt(achName, achDesc, achmtSrvc.getPicture(achID).getRewardPic());
				
			}else {
				InputStream in = filePart.getInputStream();
				@SuppressWarnings("deprecation")
				Blob rewardPic = Hibernate.createBlob(in);
				achID = achmtSrvc.addAchmt(achName, achDesc, rewardPic);
			}
			
			TargetService trgSrvc= new TargetService();
			trgSrvc.addTrg(trgName, typeID, sectionID, difficulty, intention,
					0, 0, achID, 1, 1, 1, 1, 1, timeStart, timeFinish, null);		
		
			}catch(Exception e){
				e.printStackTrace();
			}
			
			
		}	
	   /*********************************3.修改資料***************************************/	

		 if("update".equals(action)){ // 來自achievement.jsp的新增請求
				
				try {
				AchievementService achmtSrvc = new AchievementService();
				
				Integer achID = Integer.parseInt(req.getParameter("achID"));
				String achName = req.getParameter("achName");
				String achDesc = req.getParameter("achDesc");
				String trgName = req.getParameter("trgName");
				Integer targetID = Integer.parseInt(req.getParameter("targetID"));
				Integer typeID = Integer.parseInt(req.getParameter("typeID"));
				Integer sectionID = Integer.parseInt(req.getParameter("sectionID"));
				Integer difficulty = Integer.parseInt(req.getParameter("difficulty"));
				String intention = req.getParameter("intention");
				SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
				java.sql.Date timeStart = new java.sql.Date(
						sdf.parse(req.getParameter("timeStart")).getTime());
				java.sql.Date timeFinish = new java.sql.Date(
						sdf.parse(req.getParameter("timeFinish")).getTime());	
				Part filePart = req.getPart("rewardPic");
				
				if(filePart.getSize() == 0L) {
					achmtSrvc.updateAchmt(achID, achName, achDesc, achmtSrvc.getPicture(achID).getRewardPic());
					
				}else {
					InputStream in = filePart.getInputStream();
					@SuppressWarnings("deprecation")
					Blob rewardPic = Hibernate.createBlob(in);
					achmtSrvc.updateAchmt(achID, achName, achDesc, rewardPic);
				}
				
				TargetService trgSrvc= new TargetService();
				trgSrvc.updateTrg(targetID, trgName, typeID, sectionID, difficulty, intention,
						null, null, achID, null, null, 1, null, 1, timeStart, timeFinish, null);		
			
				}catch(Exception e){
					e.printStackTrace();
				}
				
				
			}	
			
		 
		   /*********************************4.秀圖片***************************************/			 
		 
		 
		 if("showPic".equals(action)){ // 來自achievement.jsp的新增請求
		 
				 
			OutputStream OutputStream = null;
			InputStream InputStream = null;
			int count = 0;
			
			AchievementService achmtSrvc = new AchievementService(); 
			AchievementVO acgmtVO = achmtSrvc.getPicture(Integer.valueOf(req.getParameter("achID")));

			Blob pic = acgmtVO.getRewardPic();
				
			try {
				InputStream = pic.getBinaryStream();
				OutputStream = res.getOutputStream();

				byte[] bytes = new byte[8192];
				while ((count = InputStream.read(bytes)) != -1) {
					OutputStream.write(bytes, 0, count);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
			
		 }
 
		 
		 
	}
	
}
