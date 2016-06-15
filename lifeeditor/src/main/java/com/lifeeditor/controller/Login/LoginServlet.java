package com.lifeeditor.controller.Login;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.xml.bind.DatatypeConverter;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.FriendService;
import com.lifeeditor.service.user_specService;
import com.lifeeditor.utility.DoBase64;
import com.lifeeditor.utility.MyGson;


 
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
		String rm = request.getParameter("rememberMe");
		System.out.println(account);
		System.out.println(pswd);
		  
			
			
			if ((account == null || account.trim().length() == 0) || (pswd == null || pswd.trim().length() == 0)) {                                       // 檢查使用者輸入資料，如果 account欄位為空白，放錯誤訊息"帳號欄必須輸入"到 errorMsgMap 之內
				                                                                                                                            // 對應的識別字串為 "AccountEmptyError"
				System.out.println("帳號欄為空orNull");
				errorMsgMap.put("LoginError", "帳號密碼請勿空白");
			}
			

			if(errorMsgMap.isEmpty()) {
				user_specService ls = new user_specService();        								        	   // 4. 進行 Business Logic 運算 ,, 將LoginService類別new為物件，存放物件參考的變數為 ls,user_specVO 扮演封裝輸入資料的角色	
	
				user_specVO vo = ls.checkIDPassword(account, pswd);									// 呼叫 ls物件的 checkIDPassword()，要記得傳入userid與password兩個參數,,同時將傳回值放入MemberBean型別的變數mb之內。	
				System.out.println("已取得帳號密碼");															// 如果變數vo的值不等於 null,表示帳密吻合，資料庫含有account搭配password的紀錄
				if (vo != null) {
					System.out.println("帳號密碼吻合");				
					session.setAttribute("LoginOK", vo); 																// OK, 將mb物件放入Session範圍內，識別字串為"LoginOK"，表示此使用者已經登入
					Gson gson = new Gson();
					JsonObject jFriends = new JsonObject();
					JsonObject jFriend = null;
					FriendService friendSvc = new FriendService();
					List<user_specVO> friends = friendSvc.getFriendsByUserID(vo.getUserID());
					for(user_specVO friend : friends) {
						jFriend = new JsonObject();
						jFriend.addProperty("firstName", friend.getFirstName());
						jFriend.addProperty("lastName", friend.getLastName());
						jFriends.add(friend.getUserID().toString(), jFriend);
					}
					session.setAttribute("jFriends", jFriends.toString());
					session.setAttribute("jUser", MyGson.GSON.toJson(vo));
				} else{
	
					System.out.println("帳號密碼不吻合");														// NG, userid與密碼的組合錯誤，放錯誤訊息"該帳號不存在或密碼錯誤"到 errorMsgMap 之內,,, 對應的識別字串為 "LoginError"
					errorMsgMap.put("LoginError", "該帳號不存在或密碼錯誤");
				}
			}
					
		//  **********Remember Me**************************** 
			Cookie cookieUser = null;
			Cookie cookiePassword = null;
			Cookie cookieRememberMe = null;
			
			if (rm != null) {   // rm存放瀏覽器送來之RememberMe的選項
				cookieUser = new Cookie("account", account);
				cookieUser.setMaxAge(30*60*60);
				cookieUser.setPath(request.getContextPath());
				// 稍微編碼(不算是加密)
				String encodePassword = DatatypeConverter.printBase64Binary(pswd.getBytes());
				cookiePassword = new Cookie("pswd", encodePassword);
				cookiePassword.setMaxAge(30*60*60);
				cookiePassword.setPath(request.getContextPath());
				cookieRememberMe = new Cookie("rm", "true");
				cookieRememberMe.setMaxAge(30*60*60);
				cookieRememberMe.setPath(request.getContextPath());
			} else {
				cookieUser = new Cookie("account", account);
				cookieUser.setMaxAge(0);   // MaxAge==0 表示要請瀏覽器刪除此Cookie
				cookieUser.setPath(request.getContextPath());
				String encodePassword = DatatypeConverter.printBase64Binary(pswd.getBytes());
				cookiePassword = new Cookie("pswd", encodePassword);
				cookiePassword.setMaxAge(0);
				cookiePassword.setPath(request.getContextPath());
				cookieRememberMe = new Cookie("rm", "false");
				cookieRememberMe.setMaxAge(30*60*60);
				cookieRememberMe.setPath(request.getContextPath());
			}
			response.addCookie(cookieUser);
			response.addCookie(cookiePassword);
			response.addCookie(cookieRememberMe);
			//********************************************
			
			
			
			if (errorMsgMap.isEmpty()) {																						// 5.依照 Business Logic 運算結果來挑選適當的畫面,,,// 如果 errorMsgMap是空的，表示沒有任何錯誤，準備交棒給下一隻程式

				return;
			} 
			else {	
				response.setCharacterEncoding("UTF-8");
		
				PrintWriter os = response.getWriter();
				Gson gson = new Gson();		
				System.out.println(gson.toJson(errorMsgMap));
				os.write(gson.toJson(errorMsgMap));

				return;
			}
		}
}
