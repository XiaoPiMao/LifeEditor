package com.lifeeditor.controller.user_spec;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Hibernate;

import com.google.gson.Gson;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.user_specService;

;

/**
 * Servlet implementation class user_specServlet
 */
@WebServlet("/user_specServlet")
@MultipartConfig( maxFileSize = 524288000 )
public class user_specServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public user_specServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
			
			if ("insert".equals(action)) { 
			
			Map<String, String> errorMsgs = new HashMap<String, String>();			
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				boolean valid = true;
				
				if (valid) {
					 
			         String gRecaptchaResponse = req.getParameter("g-recaptcha-response");
			 
			         System.out.println("gRecaptchaResponse=" + gRecaptchaResponse);
			 
			         // Verify CAPTCHA.
			         valid = VerifyUtils.verify(gRecaptchaResponse);
			         if (!valid) {
			        	 errorMsgs.put("errorCaptcha","機器人驗證失敗");
			         }
			     }
				
				String account = req.getParameter("account");
				System.out.println(account);
				String accountReg = "^[(a-zA-Z0-9_)]{1,10}$";
				if (account == null || account.trim().length() == 0) {
					
					errorMsgs.put("errorAccountempty","帳號不可空白");
				}else if(!account.trim().matches(accountReg) ){
					errorMsgs.put("errorAccountempty","帳號為最多10個字的英文及數字");
				};
				
				String pswd = req.getParameter("pswd");
				if (pswd == null || pswd.trim().length() == 0) {
					errorMsgs.put("errorpswd","密碼不可空白");
				}else if(pswd.trim().length() < 6 && pswd.trim().length() >= 30){
					errorMsgs.put("errorpswd","密碼最少6個字最多30個字");
				};
				
				String pswd1 = req.getParameter("pswd1");
				if (pswd1 == null || pswd1.trim().length() == 0) {
					errorMsgs.put("errorpswd1","請再次輸入密碼");
				}else if(!pswd.trim().equals(pswd1.trim())){
					errorMsgs.put("errorpswd1","確認密碼與密碼不一致");
				};
				
				String lastName = req.getParameter("lastName");
				String lastNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,10}$";
				if (lastName == null || lastName.trim().length() == 0) {
					errorMsgs.put("errorlastName","請輸入姓氏");
				} else if(!lastName.trim().matches(lastNameReg) ) { 
					errorMsgs.put("errorlastName","姓氏格式不正確(10個字以下的英文或中文)");
	            }
				
				String firstName = req.getParameter("firstName");
				String firstNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,10}$";
				if (firstName == null || firstName.trim().length() == 0) {
					errorMsgs.put("errorfirstName","請輸入姓名");
				} else if(!firstName.trim().matches(firstNameReg) ) { 
					errorMsgs.put("errorfirstName","姓名格式不正確(10個字以下的英文或中文)");
	            }
				
				String gender = req.getParameter("gender");
				if (gender == null || gender.trim().length() == 0) {
					errorMsgs.put("errorgender","請選擇性別");
				}
				
				java.sql.Date birthdate = null;
				try {
					birthdate = java.sql.Date.valueOf(req.getParameter("birthdate").trim());
					if (birthdate == null) {
						errorMsgs.put("errorbirthdate","請選擇生日");
					}
				} catch (IllegalArgumentException e) {
					birthdate=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.put("errorbirthdate","請選擇生日");
//					e.getStackTrace();
				}
				
				String email = req.getParameter("email");
				String emailReg = "^[_a-z0-9-]+([.][_a-z0-9-]+)*@[a-z0-9-]+([.][a-z0-9-]+)*$" ;
				if (email == null || email.trim().length() == 0) {
					errorMsgs.put("erroremail","email不可空白");
				} else if(!email.trim().matches(emailReg) ) { 
					errorMsgs.put("erroremail","email格式不正確");
	            }
				
				String address = req.getParameter("address");
				if(address.trim().length() > 50 ){
					errorMsgs.put("erroraddress","地址不可超過50個字");
				}
				
				String phone = req.getParameter("phone");
				String phoneReg = "^[(0-9)]{0,10}$";
				if(!phone.trim().matches(phoneReg) ) { 
					errorMsgs.put("errorphone","電話格式為最多10個數字");
	            }
				
				Part filePart = req.getPart("picture");
				int fileSize = (int) filePart.getSize();
				
				if(fileSize > 1024*10*100){ 
					errorMsgs.put("errorpicture","大頭照大小不得超過1mb");
	            }
				    
				    InputStream in = filePart.getInputStream();
					@SuppressWarnings("deprecation")
					Blob picture = Hibernate.createBlob(in);
	            
//					InputStream is = new FileInputStream("src/main/webapp/images/picture.jpg");
//					@SuppressWarnings("deprecation")
//					Blob picture1 = Hibernate.createBlob(is);
					
	            
				
					user_specVO user_specVO = new user_specVO();
					user_specVO.setAccount(account);
					user_specVO.setPswd(pswd);
					user_specVO.setLastName(lastName);
					user_specVO.setFirstName(firstName);
					user_specVO.setGender(gender);
					user_specVO.setBirthdate(birthdate);
					user_specVO.setEmail(email);
					user_specVO.setAddress(address);
					user_specVO.setPhone(phone);
					user_specVO.setPicture(picture);
				
				System.out.println(user_specVO.getEmail());
				
				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("user_specVO", user_specVO); 
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/register/register.jsp");
//					failureView.forward(req, resp);
					resp.setCharacterEncoding("UTF-8");
					
					PrintWriter os = resp.getWriter();
					Gson gson = new Gson();		
					System.out.println(gson.toJson(errorMsgs));
					os.write(gson.toJson(errorMsgs));
					
					return;
					
				}
				
				req.getSession().setAttribute("user_specVO", user_specVO);
				
				EmailUtils.sendAccountActivateEmail(user_specVO); 
		       
				
//				user_specService user_specService = new user_specService();
//				user_specVO = user_specService.addUser(account, pswd, lastName, firstName, gender, birthdate,email,address,phone,picture);
				
				
//				String url = "/register/send.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); 
//				successView.forward(req, resp);
			} catch (Exception e) {
				errorMsgs.put("errorAccountempty","此帳號已存在");
				
			}
		}
			if ("getOne_For_Update".equals(action)) { 

								
				try {
					
					Integer userID = new Integer(req.getParameter("userID"));
					
					
					user_specService user_specSvc = new user_specService();
					user_specVO user_specVO = user_specSvc.getOneUser(userID);
									
					
					req.setAttribute("user_specVO", user_specVO);
					
					req.getSession().setAttribute("user_specVO", user_specVO);
					
					String url = "/updateUser.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); 
					successView.forward(req, resp);

					
				} catch (Exception e) {
					e.getStackTrace();
				}
			}
			if ("update".equals(action)) { 
				
				Map<String, String> errorMsgs = new HashMap<String, String>();			
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					user_specVO user_specVO = (com.lifeeditor.model.user_spec.user_specVO) req.getSession().getAttribute("LoginOK");
					
					Integer userID = user_specVO.getUserID();
					String account = user_specVO.getAccount();
					String pswd = user_specVO.getPswd();
					Integer genkiBarTol = user_specVO.getGenkiBarTol();
					Integer level = user_specVO.getLevel();
					Blob picture = user_specVO.getPicture();
					Timestamp regTime = user_specVO.getRegTime();
					Integer hotMan = user_specVO.getHotMan();
					Integer suspendType = user_specVO.getSuspendType();
					
					
					String lastName = req.getParameter("lastName");
					String lastNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,10}$";
					if (lastName == null || lastName.trim().length() == 0) {
						errorMsgs.put("errorlastName","請輸入姓氏");
					} else if(!lastName.trim().matches(lastNameReg) ) { 
						errorMsgs.put("errorlastName","姓氏格式不正確(10個字以下的英文或中文)");
		            }
					
					String firstName = req.getParameter("firstName");
					String firstNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,10}$";
					if (firstName == null || firstName.trim().length() == 0) {
						errorMsgs.put("errorfirstName","請輸入姓名");
					} else if(!firstName.trim().matches(firstNameReg) ) { 
						errorMsgs.put("errorfirstName","姓名格式不正確(10個字以下的英文或中文)");
		            }
					
					String gender = req.getParameter("gender");
					if (gender == null || gender.trim().length() == 0) {
						errorMsgs.put("errorgender","請選擇性別");
					}
					
					java.sql.Date birthdate = null;
					try {
						birthdate = java.sql.Date.valueOf(req.getParameter("birthdate").trim());
						if (birthdate == null) {
							errorMsgs.put("errorbirthdate","請選擇生日");
						}
					} catch (IllegalArgumentException e) {
						birthdate=new java.sql.Date(System.currentTimeMillis());
						errorMsgs.put("errorbirthdate","請選擇生日");
//						e.getStackTrace();
					}
					
					String email = req.getParameter("email");
					String emailReg = "^[_a-z0-9-]+([.][_a-z0-9-]+)*@[a-z0-9-]+([.][a-z0-9-]+)*$" ;
					if (email == null || email.trim().length() == 0) {
						errorMsgs.put("erroremail","email不可空白");
					} else if(!email.trim().matches(emailReg) ) { 
						errorMsgs.put("erroremail","email格式不正確");
		            }
					
					String address = req.getParameter("address");
					if(address.trim().length() > 50 ){
						errorMsgs.put("erroraddress","地址不可超過50個字");
					}
					
					String phone = req.getParameter("phone");
					String phoneReg = "^[(0-9)]{0,10}$";
					if(!phone.trim().matches(phoneReg) ) { 
						errorMsgs.put("errorphone","電話格式為最多10個數字");
		            }
					
					
					Part filePart = req.getPart("picture");
					int fileSize = (int) filePart.getSize();							
						
					InputStream in = filePart.getInputStream();
					
					@SuppressWarnings("deprecation")
					Blob pictureUpdate = Hibernate.createBlob(in);						
					
					
					user_specVO.setLastName(lastName);
					user_specVO.setFirstName(firstName);
					user_specVO.setGender(gender);
					user_specVO.setBirthdate(birthdate);
					user_specVO.setEmail(email);
					user_specVO.setAddress(address);
					user_specVO.setPhone(phone);
					user_specVO.setPicture(pictureUpdate);		
					
						
					
					
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("user_specVO", user_specVO); 
						RequestDispatcher failureView = req
								.getRequestDispatcher("/updateUser.jsp");
						failureView.forward(req, resp);
						return;
					}
					
					       
					if(fileSize == 0){
					user_specService user_specService = new user_specService();
					user_specVO = user_specService.updateUser( userID, account,  pswd,  lastName, firstName,
							 gender, birthdate, email,	 address, phone, genkiBarTol, 
							 level, picture, regTime, hotMan, suspendType);
					}else{
						user_specService user_specService = new user_specService();
						user_specVO = user_specService.updateUser( userID, account,  pswd,  lastName, firstName,
								 gender, birthdate, email,	 address, phone, genkiBarTol, 
								 level, pictureUpdate, regTime, hotMan, suspendType);
					}
					String url = "/home.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); 
					successView.forward(req, resp);
					
				} catch (Exception e) {
					errorMsgs.put("errorAccountempty","此帳號已存在");
					RequestDispatcher failureView = req
							.getRequestDispatcher("/updateUser.jsp");
					failureView.forward(req, resp);
				}
			}
	}
	

}
