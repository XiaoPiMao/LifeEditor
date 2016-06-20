package com.lifeeditor.controller.user_spec;

import java.io.IOException;  

import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

import com.lifeeditor.model.user_spec.user_specDAO;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.user_specService;


@WebServlet("/forgotPswd.do")
/** 
 * 发送重设密码申请的链接 
 */  
public class ForgotPwdServlet extends HttpServlet {  
      
    private static final long serialVersionUID = 1L;  
  
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
    	
        String account = request.getParameter("userAccount");  
        String email = request.getParameter("userEmail");  
        user_specService user_specSvc = new user_specService();

        user_specVO vo = user_specSvc.findUserByNameAndEmail(account, email);
        if (vo == null) {  
        	System.out.println(vo);
            request.setAttribute("errorMsg", account + "不存在！" + email +"不存在！");  
            request.getRequestDispatcher("/updatePassword.jsp").forward(request, response);  
            return;  
        }  
        System.out.println("ccc");
        // 发送重新设置密码的链接  
        EmailUtils.sendResetPasswordEmail(vo);  
          
      
        System.out.println("ddd");
        request.getRequestDispatcher("/register/send.jsp").forward(request, response);  
    }  
  
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        doGet(request, response);  
    }  
}  