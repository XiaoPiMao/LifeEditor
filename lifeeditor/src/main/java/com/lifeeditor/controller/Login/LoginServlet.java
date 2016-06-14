package com.lifeeditor.controller.Login;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;

import com.google.gson.Gson;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.user_specService;


 
@WebServlet("/ch04_02/Login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 設定輸入資料的編碼
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();                                              	// 定義存放錯誤訊息的 Collection物件		
		Map<String, String> errorMsgMap = new HashMap<String, String>();    // 準備存放錯誤訊息的 Map<String, String> 物件 : errorMsgMap		
		request.setAttribute("ErrorMsgKey", errorMsgMap);                                // 將 errorMsgMap 放入 request 置物櫃內，識別字串為 "ErrorMsgKey"
		String account =request.getParameter("account");
		String pswd = request.getParameter("pswd");
		System.out.println(account);
		System.out.println(pswd);
		  
			
			
			if ((account == null || account.trim().length() == 0) || (pswd == null || pswd.trim().length() == 0)) {                                       // 檢查使用者輸入資料，如果 account欄位為空白，放錯誤訊息"帳號欄必須輸入"到 errorMsgMap 之內
				                                                                                                                            // 對應的識別字串為 "AccountEmptyError"
				System.out.println("帳號欄為空orNull");
				errorMsgMap.put("LoginError", "帳號密碼請勿空白");
			}
			
			

//			if (!errorMsgMap.isEmpty()) { 																			// 如果 errorMsgMap 不是空的，表示有錯誤，交棒給/ch06_01/login.jsp，然後 return
//				System.out.println("有錯誤訊息 回login.jsp");
//				RequestDispatcher rd = request
//						.getRequestDispatcher("/login.jsp");
//				rd.forward(request, response);
//				return;
//			} 

			if(errorMsgMap.isEmpty()) {
				user_specService ls = new user_specService();        								        	   // 4. 進行 Business Logic 運算 ,, 將LoginService類別new為物件，存放物件參考的變數為 ls,user_specVO 扮演封裝輸入資料的角色	
	
				user_specVO vo = ls.checkIDPassword(account, pswd);									// 呼叫 ls物件的 checkIDPassword()，要記得傳入userid與password兩個參數,,同時將傳回值放入MemberBean型別的變數mb之內。	
				System.out.println("已取得帳號密碼");															// 如果變數vo的值不等於 null,表示帳密吻合，資料庫含有account搭配password的紀錄
				if (vo != null) {
					System.out.println("帳號密碼吻合");				
					session.setAttribute("LoginOK", vo); 																// OK, 將mb物件放入Session範圍內，識別字串為"LoginOK"，表示此使用者已經登入
					System.out.println(session.getAttribute("LoginOK") + "<br>");
				} else{
	
					System.out.println("帳號密碼不吻合");														// NG, userid與密碼的組合錯誤，放錯誤訊息"該帳號不存在或密碼錯誤"到 errorMsgMap 之內,,, 對應的識別字串為 "LoginError"
					errorMsgMap.put("LoginError", "該帳號不存在或密碼錯誤");
				}
			}
					
			if (errorMsgMap.isEmpty()) {																						// 5.依照 Business Logic 運算結果來挑選適當的畫面,,,// 如果 errorMsgMap是空的，表示沒有任何錯誤，準備交棒給下一隻程式

//				// 如果session物件內含有"target"屬性物件，表示使用者先前嘗試執行某個應該
//				// 登入，但使用者未登入的網頁，由該網頁放置的"target"屬性物件，因此如果
//				// 有"target"屬性物件則導向"target"屬性物件所標示的網頁，否則導向首頁
//				System.out.println("沒有錯誤");
//				String contextPath = getServletContext().getContextPath();
//				String target = (String) session.getAttribute("target");
//				if (target != null) {
//					System.out.println("有target屬性");				
//					session.removeAttribute("target"); 																			    	// 先由session中移除此項屬性，否則下一次User直接執行login功能後，	// 會再度被導向到 target					
//					response.sendRedirect(																										// 導向 contextPath + target	//response.sendRedirect(contextPath + target);
//				       response.encodeRedirectURL(contextPath + target));
//				} else {
//					System.out.println("沒有target屬性.回到首頁");			
//	                response.sendRedirect(																										// 導向 contextPath + "/index.jsp"	//response.sendRedirect(contextPath + "/index.jsp");
//				      response.encodeRedirectURL(contextPath + "/home.jsp" ));
//				}
				return;
			} 
			else {	
				response.setCharacterEncoding("UTF-8");
		
				PrintWriter os = response.getWriter();
				Gson gson = new Gson();		
				System.out.println(gson.toJson(errorMsgMap));
				os.write(gson.toJson(errorMsgMap));
//			System.out.println("有錯誤回到login頁面");
//				RequestDispatcher rd = request                  // 如果 errorMsgMap 不是空的，表示有錯誤，交棒給/ch06_01/login.jsp
//						.getRequestDispatcher("/login.jsp");
//				rd.forward(request, response);
				return;
			}
		}
}