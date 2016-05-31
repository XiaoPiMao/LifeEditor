package oceanKuan;

import java.io.*;
import java.nio.file.Files;
import java.sql.Blob;
import java.sql.Timestamp;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.sql.rowset.serial.SerialBlob;






@MultipartConfig(maxFileSize = 1024 * 1024 * 500)
@WebServlet("/eventServlet.do")
public class eventServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
//		if ("".equals(action)) { 
//
//			List<String> errorMsgs = new LinkedList<String>();
//			
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			try {
//				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
//				String str = req.getParameter("eventID");
//				if (str == null || (str.trim()).length() == 0) {
//					errorMsgs.add("輸入員工編號");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/emp/select_page.jsp");
//					failureView.forward(req, res);
//					return;
//				}
//				
//				Integer eventID = null;
//				try {
//					eventID = new Integer(str);
//				} catch (Exception e) {
//					errorMsgs.add("���u�s���榡�����T");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/emp/select_page.jsp");
//					failureView.forward(req, res);
//					return;//�{�����_
//				}
//				
//			eventService evtSvc = new eventService();
//				eventVO eventVO = evtSvc.getOneevent(eventID);
//				if (eventID == null) {
//					errorMsgs.add("�d�L���");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("");
//					failureView.forward(req, res);
//					return;//�{�����_
//				}
//				
//				req.setAttribute("eventVO", eventID); // ��Ʈw���X��empVO����,�s�Jreq
//				String url = "/emp/listOneEmp.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
//				successView.forward(req, res);
//
//				/***************************��L�i�઺���~�B�z*************************************/
//			} catch (Exception e) {
//				errorMsgs.add("�L�k���o���:" + e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/emp/select_page.jsp");
//				failureView.forward(req, res);
//			}
//		}
//******************************************************************************
		//以下是輸入
		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);
			long sizeInBytes = 0;
			Map<String, String> errorMsg = new HashMap<String, String>();
			try {
                         //從jsp上的input取得物件的值
				String eventName = req.getParameter("inputEventName");
				System.out.println(eventName);
				//判斷是否為空值
				if (eventName == null || eventName.trim().length() == 0) {
					errorMsgs.add("請輸入活動名稱");
				}
				//正則表示式，必須符合正確的資料格式
				String evNReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (!eventName.trim().matches(evNReg)) {
					errorMsgs.add("輸入格式正確的資料");
				}

				String orgName = req.getParameter("inputOrgName");
				System.out.println(orgName);
				if (orgName == null || orgName.trim().length() == 0) {
					errorMsgs.add("請輸入舉辦單位名稱");
				}
				java.sql.Date eventTime = null;
				try {
					eventTime = java.sql.Date.valueOf(req.getParameter(
							"inputEventTime").trim());
				} catch (IllegalArgumentException e) {
					eventTime = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入正確的時間");
				}

				String orgAddr = req.getParameter("inputOrgAddr");
				System.out.println(orgAddr);
				if (orgAddr == null || orgAddr.trim().length() == 0) {
					errorMsgs.add("請輸入活動地址");
				}
				String eventDesc = req.getParameter("inputEventDesc").trim();
				System.out.println(eventDesc);
				if (eventDesc == null || eventDesc.trim().length() == 0) {
					errorMsgs.add("請輸入活動描述");
				}
				Part filePart = req.getPart("file1");
				int fileSize = (int) filePart.getSize();
				InputStream in= filePart.getInputStream();
				 byte[]b=readFully(in);
				//in.read(b,0,fileSize);
				Blob eventPic = new SerialBlob(b);

				if (fileSize == 0) {
					errorMsg.put("errorpicture", "請選擇大頭照");
				} else if (fileSize > 1024 * 10 * 100) {
					errorMsg.put("errorpicture", "大頭照大小不得超過1mb");
				}

				eventVO eventVO = new eventVO();
                 //取得了資料後，呼叫service的addevent方法將值存入VO
				eventService eventSvc = new eventService();
				eventVO = eventSvc.addevent(eventName, eventPic, orgName,
						orgAddr, eventTime, eventDesc);
				System.out.println(eventVO.getEventName());
				String url = "/ok.jsp";
                 //INSERT的完成後要跳轉的頁面
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);

			} catch (Exception e) {
				//出現錯誤後要跳轉的頁面
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/error.jsp");
				failureView.forward(req, res);
			}
		}
//****************************************************************************************		
		//擇一UPDATE的方法
		if ("getOne_For_Update".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			//這邊需要一個物件來裝錯誤訊息
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				//這邊先取得eventID對應的值
				Integer eventID = new Integer(req.getParameter("eventID"));
				//呼叫service來取出eventID的數值
				eventService eventSvc = new eventService();
				eventVO  eventVO = eventSvc.getOneevent(eventID);
				//給予一個屬性其一個屬性名稱
				
				req.setAttribute("eventVO", eventVO);        
				String url = "/update_delete.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				//發生錯誤後要顯示的錯誤內容及要跳轉的頁面
				errorMsgs.add("顯示錯誤名稱:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/error.jsp");
				failureView.forward(req, res);
			}
		}
		//************************************************************************************
		//以下開始是修改
		
		if ("update".equals(action)) { 
			
			List<String> errorMsgs = new LinkedList<String>();
			
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				//先取得三個跟修改無關但是必須顯示的數值
				Integer eventID = new Integer(req.getParameter("eventID").trim());
				Integer typeID = new Integer(req.getParameter("typeID").trim());
				Integer secID = new Integer(req.getParameter("secID").trim());
				
				//取得與此jsp標籤對應的數值
				String eventName = req.getParameter("updateEventName");
				System.out.println(eventName);
				//判斷是否為空值
				
				if (eventName == null || eventName.trim().length() == 0) {
					errorMsgs.add("修改");
				}
				
				String evNReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (!eventName.trim().matches(evNReg)) {
					errorMsgs.add("輸入格式正確的資料");
				}

				String orgName = req.getParameter("updateOrgName");
				System.out.println(orgName);
				if (orgName == null || orgName.trim().length() == 0) {
					errorMsgs.add("請輸入舉辦單位名稱");
				}
				java.sql.Date eventTime = null;
				try {
					eventTime = java.sql.Date.valueOf(req.getParameter(
							"updateEventTime").trim());
				} catch (IllegalArgumentException e) {
					eventTime = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入正確的時間");
				}

				String orgAddr = req.getParameter("updateOrgAddr");
				System.out.println(orgAddr);
				if (orgAddr == null || orgAddr.trim().length() == 0) {
					errorMsgs.add("請輸入活動地址");
				}
				String eventDesc = req.getParameter("updateEventDesc").trim();
				System.out.println(eventDesc);
				if (eventDesc == null || eventDesc.trim().length() == 0) {
					errorMsgs.add("請輸入活動描述");
				}
				Part filePart = req.getPart("updatefile");
				int fileSize = (int) filePart.getSize();

				InputStream is = filePart.getInputStream();
				byte[] b = new byte[is.read()];
				
				
				Blob eventPic = new SerialBlob(b);

				Map<String, String> errorMsg = null;
				if (fileSize == 0) {
					errorMsg.put("errorpicture", "請選擇大頭照");
				} else if (fileSize > 1024 * 10 * 100) {
					errorMsg.put("errorpicture", "大頭照大小不得超過1mb");
				}

				eventVO eventVO = new eventVO();

				eventService eventSvc = new eventService();
				eventVO = eventSvc.updateevent(eventID,typeID, secID, eventName,  eventPic,
						orgName, orgAddr, eventTime, eventDesc);
				System.out.println(eventVO.getEventName());
				String url = "/show_all_event.jsp";

				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllevent.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/oceanKuan/show_all_event.jsp");
				failureView.forward(req, res);
			}		}
		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
		
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				Integer eventID = new Integer(req.getParameter("eventID"));
				
				eventService eventSvc = new eventService();
				eventSvc.deleteevent(eventID);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/show_all_event.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("顯示錯誤資訊"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/error.jsp");
				failureView.forward(req, res);
			}
	}
	}

	private byte[] readFully(InputStream in) {
		// TODO Auto-generated method stub byte[] buffer = new byte[8192];
		byte[] buffer = new byte[8192];
		int bytesRead;
	    ByteArrayOutputStream output = new ByteArrayOutputStream();
	    try {
			while ((bytesRead = in.read(buffer)) != -1)
			{
			    output.write(buffer, 0, bytesRead);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return output.toByteArray();
		
	}}
