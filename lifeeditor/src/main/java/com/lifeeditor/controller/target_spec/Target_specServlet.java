package com.lifeeditor.controller.target_spec;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Blob;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialBlob;

import com.lifeeditor.model.event.eventVO;
import com.lifeeditor.model.target.TargetDAO_JNDI;
import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.model.target_spec.Target_specVO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.TargetService;
import com.lifeeditor.service.TargetSpecService;
import com.lifeeditor.service.eventService;


@MultipartConfig(maxFileSize = 1024 * 1024 * 500)
@WebServlet("/manager/target_Spec/Target_specServlet.do")
public class Target_specServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Target_specServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
	

			
		
		
		
		if ("start_insert_Target_spec".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			Map<String, String> errorMsg = new HashMap<String, String>();
			try {
			/*這邊取得使用者資訊，將從session理取到的使用者資訊與使用者目標資訊做比對，確認為該目標及該使用者     
                                  ，確認無誤後才能跳轉頁面，同時讀出該類別的資料顯示在表單上
			
				
			*/
			
				HttpSession session = req.getSession();
				Object user_specVO=session.getAttribute("LoginOK");
				
				Object TargetDAO_JNDI=session.getAttribute("?");
				Target_specVO Target_specVO=new Target_specVO();
				
				
				
				
				Target_specVO.getUserVO().getUserID();
				Target_specVO.getTargetVO().getTargetID();
				Target_specVO.getTargetVO().getTrgName();

				String url = "跳轉到新增網頁（需動態載入按鈕，審核/新增）JSP";
				

					
					
					
					
					
					req.setAttribute("TargetName", Target_specVO.getTargetVO().getTrgName());
					req.setAttribute("TargetName", Target_specVO.getTargetVO().getTrgName());
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
					
					
				
				
				
			
			} catch (Exception e) {
				// 出現錯誤後要跳轉的頁面
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/manager/eventTemplate/event_event_insert.jsp");
				failureView.forward(req, res);
			}
		}
	

	if ("Target_Spec_insert".equals(action)) {

		List<String> errorMsgs = new LinkedList<String>();

		req.setAttribute("errorMsgs", errorMsgs);

		Map<String, String> errorMsg = new HashMap<String, String>();

		try {
		/*這裡表示insert頁面按下了insert，這裡將取到送過來的表單的值，
		 * 用表單的值做判斷，如果為官方類別，則insert的同時將targertTable裡的status值做修改
		       如果為非官方類別則直接將所有的值insert進資料庫
		*/
			Target_specVO TargetspecVO=new Target_specVO();

			TargetVO TargetVO=new TargetVO();

//			user_specVO user_specVO=new user_specVO();
		    int statusvalue=2;
//		    		TargetVO.getStatus();
	                         

		    TargetSpecService Target_specSvc = new TargetSpecService();
		     String url = "ok.jsp";

		     RequestDispatcher successView = req.getRequestDispatcher(url);
//			//以下為取得表單要insert的值
			Integer UserID = 1;
//					user_specVO.getUserID();
			Integer TargetID =1;
//			TargetVO.getTargetID();				
			String UserTarget_desc = req.getParameter("input_target_Note");		
			//這邊將要insert的路徑做設定
			String current = new java.io.File( "." ).getCanonicalPath();
	        System.out.println("Current dir:"+current);                       
	        String currentDir = System.getProperty("user.dir");
	        System.out.println("Current dir using System:" +currentDir);
	        String path="C:\\LocalRepository\\lifeeditor\\src\\main\\webapp\\images\\"+UserID.toString()+TargetID.toString()+".jpg";
//			String bb=current+path;//此為路徑
//			Properties properties = new Properties();
//		    properties.load(getServletContext().getResourceAsStream("/"));

			
			
			
			if(statusvalue==2){
			 File file1=new File(path);//存入檔案的路徑
				@SuppressWarnings("resource")
				FileOutputStream fos1 = new FileOutputStream(file1);
		       Part filePart1 = req.getPart("insert_targetPic");
		       req.setAttribute("TargetspecVO", TargetspecVO);
		                          
    
		       successView.forward(req, res);
		                      

		       InputStream in1 = filePart1.getInputStream();
				byte[] b1 = readFully(in1);
				// in.read(b,0,fileSize);
				Blob Pic1 = new SerialBlob(b1);
				Pic1.getBytes(1, (int) Pic1.length());
				fos1.write(Pic1.getBytes(1, (int) Pic1.length()),0,(int) Pic1.length());
		
				TargetspecVO = Target_specSvc.addTargetSpec_changeStatus(UserID,TargetID,UserTarget_desc,path);
				req.setAttribute("TargetspecVO", TargetspecVO);
				successView.forward(req, res);                   

		
			}else{
				
				TargetspecVO = Target_specSvc.addTargetSpec_changeStatus(UserID,TargetID,UserTarget_desc,path);
				req.setAttribute("TargetspecVO", TargetspecVO);
				successView.forward(req, res);
				
				 File file2=new File(path);//存入檔案的路徑
					@SuppressWarnings("resource")
					FileOutputStream fos2 = new FileOutputStream(file2);
					 Part filePart2 = req.getPart("insert_targetPic");
					
					InputStream in2 = filePart2.getInputStream();
					byte[] b2 = readFully(in2);
					// in.read(b,0,fileSize);
					Blob Pic2 = new SerialBlob(b2);
					Pic2.getBytes(1, (int) Pic2.length());
					fos2.write(Pic2.getBytes(1, (int) Pic2.length()),0,(int) Pic2.length());
//				
				
			}
		} catch (Exception e) {
			// 出現錯誤後要跳轉的頁面
			errorMsgs.add(e.getMessage());
			RequestDispatcher failureView = req
					.getRequestDispatcher("/manager/eventTemplate/event_event_insert.jsp");
			failureView.forward(req, res);
		}}}
	

private byte[] readFully(InputStream in) {
	
	byte[] buffer = new byte[8192];
	int bytesRead;
	ByteArrayOutputStream output = new ByteArrayOutputStream();
	try {
		while ((bytesRead = in.read(buffer)) != -1) {
			output.write(buffer, 0, bytesRead);
		}
	} catch (IOException e) {
		
		e.printStackTrace();
	}
	return output.toByteArray();

}
}
