package com.lifeeditor.controller.Login;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;

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
			System.out.println("aaa");
			List<user_specVO> list = mfio.getAll();        //取出所有會員資料
			for (user_specVO vo1 : list) {              
				useraccount = vo1.getAccount();              //每一筆會員的帳號
			}
			//判斷是否帳號已經存在,若不存在,新增它
			if (!email.equals(useraccount)) {
				mfio.addUser(email, pswd, lastname, firstname, gender, null,
						email, null, null, null);
			}
		
			RequestDispatcher rd = request
					.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
			System.out.println("bbb");	
			return;
	}
}