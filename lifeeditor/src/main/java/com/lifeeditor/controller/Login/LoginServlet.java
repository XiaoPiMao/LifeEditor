package com.lifeeditor.controller.Login;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;

import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.user_specService;


 
@WebServlet("/ch04_02/Login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 設定輸入資料的編碼
		request.setCharacterEncoding("UTF-8");
		// 定義存放錯誤訊息的 Collection物件
		HttpSession session = request.getSession();
		// 準備存放錯誤訊息的 Map<String, String> 物件 : errorMsgMap
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		// 將 errorMsgMap 放入 request 置物櫃內，識別字串為 "ErrorMsgKey"
		request.setAttribute("ErrorMsgKey", errorMsgMap);
		String account =request.getParameter("account");
		String pswd = request.getParameter("pswd");
		System.out.println(account);
		System.out.println(pswd);
		    // 讀取使用者所輸入，由瀏覽器送來的 EMAIL 欄位內的資料	
			
			// 檢查使用者輸入資料，如果 account欄位為空白，放錯誤訊息"帳號欄必須輸入"到 errorMsgMap 之內
			// 對應的識別字串為 "AccountEmptyError"
			if (account == null || account.trim().length() == 0) {
				System.out.println("帳號欄為空orNull");
				errorMsgMap.put("AccountEmptyError", "帳號欄必須輸入");
			}
			// 如果 password 欄位為空白，放錯誤訊息"密碼欄必須輸入"到 errorMsgMap 之內
			// 對應的識別字串為 "PasswordEmptyError"
			if (pswd == null || pswd.trim().length() == 0) {
				System.out.println("密碼欄為空orNull");
				errorMsgMap.put("PasswordEmptyError", "密碼欄必須輸入");
			}
			// 如果 errorMsgMap 不是空的，表示有錯誤，交棒給/ch06_01/login.jsp，
			// 然後 return
			if (!errorMsgMap.isEmpty()) {
				System.out.println("有錯誤訊息 回login.jsp");
				RequestDispatcher rd = request
						.getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
				return;
			}
			// 4. 進行 Business Logic 運算
			// 將LoginService類別new為物件，存放物件參考的變數為 ls
			// user_specVO 扮演封裝輸入資料的角色			
			user_specService ls = new user_specService();
			// 呼叫 ls物件的 checkIDPassword()，要記得傳入userid與password兩個參數
			// 同時將傳回值放入MemberBean型別的變數mb之內。
			user_specVO vo = ls.checkIDPassword(account, pswd);
			// 如果變數vo的值不等於 null,表示帳密吻合，資料庫含有account搭配password的紀錄
			System.out.println("已取得帳號密碼");
			if (vo != null) {
				System.out.println("帳號密碼吻合");
				// OK, 將mb物件放入Session範圍內，識別字串為"LoginOK"，表示此使用者已經登入
				session.setAttribute("LoginOK", vo);
			} else {
				// NG, userid與密碼的組合錯誤，放錯誤訊息"該帳號不存在或密碼錯誤"到 errorMsgMap 之內
				// 對應的識別字串為 "LoginError"
				System.out.println("帳號密碼不吻合");
				errorMsgMap.put("LoginError", "該帳號不存在或密碼錯誤");
			}
			// 5.依照 Business Logic 運算結果來挑選適當的畫面
			// 如果 errorMsgMap是空的，表示沒有任何錯誤，準備交棒給下一隻程式
			if (errorMsgMap.isEmpty()) {
				// 如果session物件內含有"target"屬性物件，表示使用者先前嘗試執行某個應該
				// 登入，但使用者未登入的網頁，由該網頁放置的"target"屬性物件，因此如果
				// 有"target"屬性物件則導向"target"屬性物件所標示的網頁，否則導向首頁
				System.out.println("沒有錯誤");
				String contextPath = getServletContext().getContextPath();
				String target = (String) session.getAttribute("target");
				if (target != null) {
					System.out.println("有target屬性");
					// 先由session中移除此項屬性，否則下一次User直接執行login功能後，
					// 會再度被導向到 target
					session.removeAttribute("target");
					// 導向 contextPath + target
					//response.sendRedirect(contextPath + target);
					response.sendRedirect(
				       response.encodeRedirectURL(contextPath + target));

				} else {
					System.out.println("沒有target屬性.回到首頁");
					// 導向 contextPath + "/index.jsp"
					//response.sendRedirect(contextPath + "/index.jsp");
	                response.sendRedirect(
				      response.encodeRedirectURL(contextPath + "/index.jsp" ));
				}
				return;
			} 
			else {
				// 如果 errorMsgMap 不是空的，表示有錯誤，交棒給/ch06_01/login.jsp
				System.out.println("有錯誤回到login頁面");
				RequestDispatcher rd = request
						.getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
				return;
			}
		}
}