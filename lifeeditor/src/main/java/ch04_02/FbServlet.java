package ch04_02;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;

import com.lifeeditor.user_spec.model.user_specService;

@WebServlet("/ch04_02/Fb.do")
public class FbServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 定義存放錯誤訊息的 Collection物件
		Map<String, String> errorMessage = new HashMap<>();
		request.setAttribute("ErrorMsg", errorMessage);
		// 設定輸入資料的編碼
		request.setCharacterEncoding("UTF-8");
		// 讀取使用者所輸入，由瀏覽器送來的 EMAIL 欄位內的資料
		String email = request.getParameter("EMAIL");
		String lastname = request.getParameter("LASTNAME");
		String firstname = request.getParameter("FIRSTNAME");
		String pswd= request.getParameter("PSWD");
		String gender= request.getParameter("GENDER");
		if (gender.equals("male"))  { gender="M"  ;}
		else {gender="F";}
		
		// MemberBean 扮演封裝輸入資料的角色
//		user_specVO mb = new user_specVO();
//		mb.setLastName(lastname) ;
//		mb.setEmail(email);
//		mb.setAccount(email);
//		mb.setGender("M");
//		mb.setFirstName("XingDa");
//		mb.setPswd("233456");
		user_specService mfio = new user_specService();
		try {
			System.out.println("aaa");
			
		mfio.addUser(email, pswd,lastname, firstname,gender, null, email, null ,null, null);
		
		//request.setAttribute("user_specVO", mb);
		// 依照執行的結果挑選適當的view元件，送回相關訊息
		// 產生 RequestDispatcher 物件 rd
		RequestDispatcher rd = request
				.getRequestDispatcher("/index");
		// 請容器代為呼叫下一棒程式
		rd.forward(request, response);
		 
		return;
		 
		}	catch (Exception e) {
			System.out.println("ccc");
			if (e.getMessage().indexOf("重複的索引鍵") != -1 || 
				e.getMessage().indexOf("Duplicate entry") != -1) 
			{
				System.out.println("帳號重複，請重新輸入帳號");
			} 
			else {
				errorMessage.put("exception","資料庫存取錯誤:" + e.getMessage());
			}
			RequestDispatcher rd = request
				.getRequestDispatcher("/DBTest.jsp");
			rd.forward(request, response);
			return;
		}
		
	}
}