package com.lifeeditor.controller.user_spec;
import java.io.IOException;  
import java.io.InputStream;  
import java.util.Date;  
import java.util.Properties;  
  


import javax.mail.Authenticator;  
import javax.mail.Message.RecipientType;  
import javax.mail.PasswordAuthentication;  
import javax.mail.Session;  
import javax.mail.Transport;  
import javax.mail.internet.InternetAddress;  
import javax.mail.internet.MimeMessage;  

import com.lifeeditor.model.user_spec.user_specVO;
 

  
public class EmailUtils {
	
	static String host = "smtp.gmail.com";
	static int port = 587;
      
    private static final String FROM = "eeit85@gmail.com";
    private static final String password = "JAVAgroup";
  
    /** 
     * 注册成功后,向用户发送帐户激活链接的邮件 
     * @param user 未激活的用户 
     */  
    public static void sendAccountActivateEmail(user_specVO user_specVO) {  
        Session session = getSession();  
        MimeMessage message = new MimeMessage(session);  
        try {  
            message.setSubject("Email認證信件");  
            message.setSentDate(new Date());  
            message.setFrom(new InternetAddress(FROM));  
            message.setRecipient(RecipientType.TO, new InternetAddress(user_specVO.getEmail()));  
            message.setContent("<a href='http://localhost:8080/maven-lifeeditor-webapp/RegisteredServlet'>點此完成驗證</a>","text/html;charset=utf-8");  
            // 发送邮件
            Transport transport = session.getTransport("smtp");
            transport.connect(host, port, FROM, password);
            Transport.send(message);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }
    public static Session getSession() {  
        Properties props = new Properties();  
        props.setProperty("mail.transport.protocol", "smtp");  
        props.setProperty("mail.smtp.host", "smtp.gmail.com");  
        props.setProperty("mail.smtp.port", "587");  
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(props, new Authenticator() {  
            @Override  
            protected PasswordAuthentication getPasswordAuthentication() {  
                
                return new PasswordAuthentication(FROM, password);  
            }  
              
        });  
        return session;         
       
    }  
}