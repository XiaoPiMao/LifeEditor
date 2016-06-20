package com.lifeeditor.controller.user_spec;

import java.security.MessageDigest;  
import java.security.NoSuchAlgorithmException;  
  
import javax.servlet.ServletRequest;  
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

/** 
 * 生成帐户激活、重新设置密码的链接 
 */  
public class GenerateLinkUtils {  
      
    private static final String CHECK_CODE = "checkCode";  

    /** 
     * 生成重设密码的链接 
     */  
    public static String generateResetPwdLink(user_specVO user_specVO) {  
        return "http://localhost:8080/lifeeditor/XXXsetNewPSWD.jsp?userAccount="   
                + user_specVO.getAccount() + "&" + CHECK_CODE + "=" + generateCheckcode(user_specVO);    
        }  
      
    /** 
     * 生成验证帐户的MD5校验码 
     * @param user  要激活的帐户 
     * @return 将用户名和密码组合后，通过md5加密后的16进制格式的字符串 
     */  
    public static String generateCheckcode(user_specVO user_specVO) {  
        String userAccount = user_specVO.getAccount();
        String randomCode = user_specVO.getRandomCode();  
        return md5(userAccount + ":" + randomCode);  
    }  
      
    /** 
     * 验证校验码是否和注册时发送的验证码一致 
     * @param user 要激活的帐户 
     * @param checkcode 注册时发送的校验码 
     * @return 如果一致返回true，否则返回false 
     */  
    public static boolean verifyCheckcode(user_specVO user_specVO,ServletRequest request) {  
        String checkCode = request.getParameter(CHECK_CODE);  
        return generateCheckcode(user_specVO).equals(checkCode);  
    }  
  
    private static String md5(String string) {  
        MessageDigest md = null;  
        try {  
            md = MessageDigest.getInstance("md5");  
            md.update(string.getBytes());  
            byte[] md5Bytes = md.digest();  
            return bytes2Hex(md5Bytes);  
        } catch (NoSuchAlgorithmException e) {  
            e.printStackTrace();  
        }  
          
        return null;  
    }  
      
    private static String bytes2Hex(byte[] byteArray)  
    {  
        StringBuffer strBuf = new StringBuffer();  
        for (int i = 0; i < byteArray.length; i++)  
        {  
            if(byteArray[i] >= 0 && byteArray[i] < 16)  
            {  
                strBuf.append("0");  
            }  
            strBuf.append(Integer.toHexString(byteArray[i] & 0xFF));  
        }  
        return strBuf.toString();  
    }  
}  
