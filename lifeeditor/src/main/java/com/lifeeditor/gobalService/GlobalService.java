package com.lifeeditor.gobalService;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Collection;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import javax.xml.bind.DatatypeConverter;

public class GlobalService {
	
	public static final int RECORDS_PER_PAGE = 2;
	public static final String HOST = "127.0.0.1";
	public static final String USERID = "sa";
	public static final String PASSWORD = "password";
	public static final String SYSTEM_NAME = "Life Editor";
	public static final String JNDI_DB_NAME = "java:comp/env/jdbc/LE01";
	public static final int IMAGE_FILENAME_LENGTH = 20;
	public static final String DB_URL = "jdbc:sqlserver://" + GlobalService.HOST + ":1433;databaseName=LE01";
	public static final String KEY = "LifeEditor";//16,24,32
	public static final String DRIVERNAME = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	
	public String getSystemName(){ 
		return SYSTEM_NAME;
	}
	
	public static String encryptString(String message) throws InvalidKeyException, IllegalBlockSizeException, BadPaddingException{
		
		String encryptedString = "";
		try{
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
			SecretKeySpec secretKey = new SecretKeySpec(KEY.getBytes(),"AES");
			cipher.init(Cipher.ENCRYPT_MODE,secretKey);
			encryptedString = DatatypeConverter.printBase64Binary(cipher.doFinal(message.getBytes()));
		}catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		}
		return encryptedString;
		
	}
	
	public static String decryptString(String key,String stringToDecrypt) throws InvalidKeyException, IllegalBlockSizeException, BadPaddingException{
		String decryptedString = "";
		try{
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
			SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(), "AES");
			cipher.init(Cipher.DECRYPT_MODE, secretKey);
			byte[] b = DatatypeConverter.parseBase64Binary(stringToDecrypt);
			decryptedString = new String(cipher.doFinal(b));
		}catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		}
		return decryptedString;
		
	}

	public static String adjustFileName(String fileName, int maxLength) {
		  int length = fileName.length();
		  if ( length <= maxLength ) {
			  return fileName ;
		  }
  	    int n      = fileName.lastIndexOf(".");
        int sub    = fileName.length() - n - 1;
        fileName = fileName.substring(0, maxLength-1-sub) + "." 
                     + fileName.substring(n+1); 
		return fileName;
	}
	
	public static String getFileName(final Part p) {
		for (String content : p.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim()
						.replace("\"", "");
			}
		}
		return null;
	}
	
}
