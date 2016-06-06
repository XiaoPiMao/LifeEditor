package com.lifeeditor.controller.sec_list;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.hibernate.Hibernate;

import com.lifeeditor.controller.user_spec.EmailUtils;
import com.lifeeditor.controller.user_spec.VerifyUtils;
import com.lifeeditor.init.ContextListener;
import com.lifeeditor.model.sec_list.SecListVO;
import com.lifeeditor.model.type_list.TypeListVO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.SecListService;
import com.lifeeditor.service.TypeListService;
import com.lifeeditor.utility.MyGson;


@WebServlet("/sec_listServlet")
@MultipartConfig( maxFileSize = 524288000 )
public class sec_listServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public sec_listServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");	
		
		if ("insert".equals(action)) { 
		
			Map<String, String> errorMsgs = new HashMap<String, String>();			
			req.setAttribute("errorMsgs", errorMsgs);
			try{
				Integer typeID = new Integer(req.getParameter("typeID"));
				String secName = req.getParameter("secName");
				
				if (secName == null || secName.trim().length() == 0) {
					errorMsgs.put("errorAccountempty","名稱不可空白");
				}
				
				Part filePart = req.getPart("secPic");
				int fileSize = (int) filePart.getSize();				
				if(fileSize == 0){
					errorMsgs.put("errorpicture","請選擇圖片");
				}else if(fileSize > 1024*10*100){ 
					errorMsgs.put("errorpicture","圖片大小不得超過1mb");
	            }
	            	InputStream in = filePart.getInputStream();
					
					@SuppressWarnings("deprecation")
					Blob picture = Hibernate.createBlob(in);
					
					
					//String picture = req.getParameter("picture").trim();
	            
				
				
				
				SecListVO SecListVO = new SecListVO();
				SecListVO.setTypeID(typeID);
				SecListVO.setSecName(secName);
				SecListVO.setSecPic(picture);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("SecListVO", SecListVO); 
					RequestDispatcher failureView = req
							.getRequestDispatcher("/manager/editorType.jsp");
					failureView.forward(req, resp);
					return;
				}
				
				SecListService SecListService = new SecListService();
				SecListVO = SecListService.addSec(typeID,secName,picture);
				ContextListener.context.setAttribute("secs", MyGson.gson.toJson(ContextListener.getSecMap()));//項目
				
				String url = "/manager/editorType.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, resp);
			} catch (Exception e) {
				e.getMessage();
				errorMsgs.put("errorAccountempty","此類別已存在");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/manager/editorType.jsp");
				failureView.forward(req, resp);
			}
		}
		if ("update".equals(action)) { 
			
			Map<String, String> errorMsgs = new HashMap<String, String>();			
			req.setAttribute("errorMsgs1", errorMsgs);
			try{
				
				Integer secID = new Integer(req.getParameter("secID1"));
				
				Integer typeID = new Integer(req.getParameter("typeID1"));
				
				String secName = req.getParameter("secName1");
				
				if (secName == null || secName.trim().length() == 0) {
					errorMsgs.put("errorAccountempty","名稱不可空白");
				}
				SecListService SecListService = new SecListService();
				SecListVO SecListVO1 = new SecListVO();
				SecListVO1 = SecListService.getOneUser(secID);
				
				Blob picture = SecListVO1.getSecPic();
				
				Part filePart = req.getPart("secPic1");
				int fileSize = (int) filePart.getSize();				
				if(fileSize == 0){
					errorMsgs.put("errorpicture","請選擇圖片");
				}else if(fileSize > 1024*10*100){ 
					errorMsgs.put("errorpicture","圖片大小不得超過1mb");
	            }
	            	InputStream in = filePart.getInputStream();
					
					@SuppressWarnings("deprecation")
					Blob pictureUpdate = Hibernate.createBlob(in);
					
					
					//String picture = req.getParameter("picture").trim();
	            
				
				
				SecListVO SecListVO = new SecListVO();
				SecListVO.setSecID(typeID);
				SecListVO.setTypeID(typeID);
				SecListVO.setSecName(secName);
				SecListVO.setSecPic(pictureUpdate);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("SecListVO", SecListVO); 
					RequestDispatcher failureView = req
							.getRequestDispatcher("/manager/editorType.jsp");
					failureView.forward(req, resp);
					return;
				}
				if(fileSize == 0){
					SecListVO = SecListService.updateSec(secID,typeID,secName,picture);
				}else{
					SecListVO = SecListService.updateSec(secID,typeID,secName,pictureUpdate);
				}
				ContextListener.context.setAttribute("secs", MyGson.gson.toJson(ContextListener.getSecMap()));//項目
				
				
				String url = "/manager/editorType.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, resp);
			} catch (Exception e) {
				e.getMessage();
				errorMsgs.put("errorAccountempty","請選擇類別");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/manager/editorType.jsp");
				failureView.forward(req, resp);
			}
		}
	}

}
