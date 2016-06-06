package com.lifeeditor.controller.type_list;

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
import com.lifeeditor.model.type_list.TypeListVO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.SecListService;
import com.lifeeditor.service.TypeListService;
import com.lifeeditor.utility.MyGson;


@WebServlet("/type_listServlet")
@MultipartConfig( maxFileSize = 524288000 )
public class type_listServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public type_listServlet() {
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
				String typeName = req.getParameter("typeName");
				
				if (typeName == null || typeName.trim().length() == 0) {
					errorMsgs.put("errorAccountempty","名稱不可空白");
				}
				
				Part filePart = req.getPart("typePic");
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
	            
				
				
				
				TypeListVO TypeListVO = new TypeListVO();
				TypeListVO.setTypeName(typeName);
				TypeListVO.setTypePic(picture);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("TypeListVO", TypeListVO); 
					RequestDispatcher failureView = req
							.getRequestDispatcher("/manager/editorType.jsp");
					failureView.forward(req, resp);
					return;
				}
				
				TypeListService TypeListService = new TypeListService();
				TypeListVO = TypeListService.addType(typeName,picture);
				
				ContextListener.types = new TypeListService().getAll();
				ContextListener.context.setAttribute("types", ContextListener.types);//類別
				ContextListener.context.setAttribute("jTypes", MyGson.gson.toJson(ContextListener.types));//類別Json
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
				
				Integer typeID = new Integer(req.getParameter("typeID1"));
				
				String typeName = req.getParameter("typeName1");
				
				if (typeName == null || typeName.trim().length() == 0) {
					errorMsgs.put("errorAccountempty","名稱不可空白");
				}
				TypeListService TypeListService = new TypeListService();
				TypeListVO TypeListVO1 = new TypeListVO();
				TypeListVO1 = TypeListService.getOneUser(typeID);
				
				Blob picture = TypeListVO1.getTypePic();
				
				Part filePart = req.getPart("typePic1");
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
	            
				
				
				TypeListVO TypeListVO = new TypeListVO();
				TypeListVO.setTypeID(typeID);
				TypeListVO.setTypeName(typeName);
				TypeListVO.setTypePic(pictureUpdate);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("TypeListVO", TypeListVO); 
					RequestDispatcher failureView = req
							.getRequestDispatcher("/manager/editorType.jsp");
					failureView.forward(req, resp);
					return;
				}
				if(fileSize == 0){
					TypeListVO = TypeListService.updateType(typeID,typeName,picture);
				}else{
					TypeListVO = TypeListService.updateType(typeID,typeName,pictureUpdate);
				}
				
				ContextListener.types = new TypeListService().getAll();
				ContextListener.context.setAttribute("types", ContextListener.types);//類別
				ContextListener.context.setAttribute("jTypes", MyGson.gson.toJson(ContextListener.types));//類別Json
				
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
