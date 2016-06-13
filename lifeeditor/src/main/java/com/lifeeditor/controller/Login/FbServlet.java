package com.lifeeditor.controller.Login;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;

import com.google.gson.Gson;
import com.google.gson.JsonParser;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.user_specService;



@WebServlet("/ch04_02/Fb.do")
public class FbServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String account =request.getParameter("account");
		String password = request.getParameter("pswd");
		// 讀取使用者所輸入，由瀏覽器送來的 EMAIL 欄位內的資料
		String email = request.getParameter("EMAIL");
		String lastname = request.getParameter("LASTNAME");
		String firstname = request.getParameter("FIRSTNAME");
		String pswd = request.getParameter("PSWD");
		String gender = request.getParameter("GENDER");
		String picture = request.getParameter("PIC");
		
		System.out.println(picture );
		JsonParser jsonParser = new JsonParser();
		String url = jsonParser.parse(picture).getAsJsonObject().getAsJsonObject("data").get("url").toString().replace("\"", "");
		System.out.println(url);
		String contextPath = getServletContext().getContextPath();
		
		if (gender.equals("male")) {
			gender = "M";
		} else {   
			gender = "F";
		}
		// user_specVO 扮演封裝輸入資料的角色
//		user_specVO vo = new user_specVO();
		user_specService mfio = new user_specService();
		String useraccount = null;
//		try {
			System.out.println("uuuuuuuu");
//			List<user_specVO> list = mfio.getAll();        //取出所有會員資料
//			for (user_specVO vo1 : list) {              
//				useraccount = vo1.getAccount();              //每一筆會員的帳號
//			}
//			//與全部帳號比對，檢查是否重複,若沒有重複,新增它
//			if (!email.equals(useraccount)) {
//				System.out.println("新增帳號");
//				mfio.addUser(email, pswd, lastname, firstname, gender, null,
//						email, null, null, null);
//			}		
			
			
			user_specVO vo = mfio.checkIDPassword(email, pswd);									// 呼叫 ls物件的 checkIDPassword()，要記得傳入userid與password兩個參數,,同時將傳回值放入MemberBean型別的變數mb之內。	
			if(vo == null){
				mfio.addUser(email, pswd, lastname, firstname, gender, null,
						email, null, null, null);
				session.setAttribute("FbPicture",url); 
				session.setAttribute("LoginOK", vo);
			}else{
				System.out.println("已取得帳號密碼");															// 如果變數vo的值不等於 null,表示帳密吻合，資料庫含有account搭配password的紀錄
		     	session.setAttribute("FbPicture",url); 
				session.setAttribute("LoginOK", vo);
			}
			
			
			// OK, 將mb物件放入Session範圍內，識別字串為"LoginOK"，表示此使用者已經登入			
			
		
			return;
	}
}