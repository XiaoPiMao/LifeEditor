package com.lifeeditor.controller.user_spec;

import java.io.IOException;  
import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;  
import java.util.Map;  
  











import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

import com.lifeeditor.model.user_spec.user_specDAO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.user_specService;
  
@WebServlet("/ResetPswd.do")
  
/** 
 * 重新设置密码 
 */  
public class ResetPasswordServlet extends HttpServlet {  
    private static final long serialVersionUID = 1L;  
         
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
    	System.out.println("aaa");
        String userAccount = request.getParameter("userAccount");  
        String email =request.getParameter("userEmail");  
        String newPassword = request.getParameter("newPassword");  
        String newPassword2 = request.getParameter("newPassword2");  
        Map<String,String> errors = new HashMap<String, String>();  
        if (newPassword == null || "".equals(newPassword)) {  
            errors.put("newPassword", "密碼不得空白！");  
        }  
          
        if (newPassword2 == null || "".equals(newPassword2)) {  
            errors.put("newPassword2", "確認密碼不得空白！");  
        }  
          
        if (!newPassword.equals(newPassword2)) {  
            errors.put("passwordError", "兩次密碼輸入不同！");  
        }  
          
        if (!errors.isEmpty()) {  
            request.setAttribute("errors", errors);  
            request.getRequestDispatcher("/setNewPSWD.jsp?userName=" + userAccount).forward(request, response);  
            return;  
        }  
         System.out.println("hello");
         System.out.println(userAccount);
       user_specService user_specSVC = new user_specService();
        user_specVO vo = user_specSVC.findUserByAccount(userAccount);
        Integer userID = vo.getUserID();
        String account = vo.getAccount();
        String pswd = newPassword;
        String lastName =vo.getLastName();
        String firstName = vo.getFirstName();
        String gender =vo.getGender();
        Date birthdate = vo.getBirthdate();
        String email2 =vo.getEmail();
        String address =vo.getAddress();
        String phone =vo.getPhone();
        Integer genkiBarTol=vo.getGenkiBarTol();
        Integer level = vo.getLevel();
        Timestamp regTime =vo.getRegTime();
        Integer hotMan = vo.getHotMan();
        Integer suspendType = vo.getSuspendType();     
        Blob picture = vo.getPicture();
        user_specSVC.updateUser(userID, account, pswd, lastName, firstName, gender, birthdate, email2, address, phone, genkiBarTol, level, picture, regTime, hotMan, suspendType);
        System.out.println("bitch");
        System.out.println(vo);
        request.getRequestDispatcher("/updatePSWDSuc.jsp").forward(request, response);  
          
    }  
  
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        doGet(request, response);  
    }  
}  