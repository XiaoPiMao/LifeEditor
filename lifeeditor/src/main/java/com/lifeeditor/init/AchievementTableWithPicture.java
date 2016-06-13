package com.lifeeditor.init;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.lifeeditor.utility.GlobalValues;

public class AchievementTableWithPicture {
	
	
	public final static String SQL_URL = "jdbc:sqlserver://localhost:1433;DatabaseName=LE01";
	public static final String KEY = "KittySnoopyMicky";  // 16, 24, 32
	public static final int IMAGE_FILENAME_LENGTH = 20;

	public  static final String INSERT_STMT = 
			"INSERT INTO achievement (achName,achDesc,rewardPic) VALUES ( ?, ?, ?)";
	public  static final String GET_ALL_STMT = 
			"SELECT pokedex,poke_name,element,picture FROM pokemon order by pokedex";
	public  static final String GET_ONE_STMT = 
			"SELECT pokedex,poke_name,element,picture FROM pokemon where pokedex = ?";
	public  static final String DELETE = 
			"DELETE FROM pokemon where pokedex = ?";
	public  static final String UPDATE = 
			"UPDATE achievement set achName=?, achDesc=?, rewardPic=? where achID = ?";

	
	
	
	public static final String UTF8_BOM = "\uFEFF";  // 定義 UTF-8的BOM字元 
	
	public static void main(String args[]){
		  Connection con;
	      PreparedStatement pstmt;
	      PreparedStatement pstmt1;
	      Statement stmt;
	      String dropString;   
	      String createString;
	      String line  = "";
	      String sql   = "";
	      String sql1  = "";
	      String encrypedString = "";
	
	      
	      try{
	    	// 連上後端的資料庫
	    	  con =  DriverManager.getConnection( GlobalValues.SQL_URL,GlobalValues.SQL_USER,GlobalValues.SQL_PWD);
	    	// 建立Statement物件，以便傳送SQL命令到後端的資料庫
	    	  stmt = con.createStatement();
	    	  
	      }catch(SQLException e){
	    	  System.err.println("存取資料庫有關的例外：" + e.getMessage() );
	    	  e.printStackTrace() ;
	          return ;
	      }
	  	    		  
	      try {
	          sql = "UPDATE achievement set achName=?, achDesc=?, rewardPic=? where achID = ?";
	          // 建立新增書籍記錄的PreparedStatement物件
	          pstmt = con.prepareStatement(sql);
	          // 讀取pokemon表格的初始資料，準備新增到pokemon表格內                                            
	          BufferedReader br = new BufferedReader(new FileReader("src/main/webapp/images/testPic/achievement.dat")); 
//	          BufferedReader br = new BufferedReader(new FileReader("WebContent/images/testPic/achievement.dat"));	          
	          
	          while ( (line = br.readLine() ) != null){
	        	  // 去除 UTF8_BOM
	        	  if (line.startsWith(UTF8_BOM )){
	        		  line = line.substring(1);
	        	  }
	        	  String[] token = line.split("\\|");
	        	  pstmt.setString(1, token[0]);
	        	  pstmt.setString(2, token[1]);
	        	  pstmt.setString(3, token[2].trim());
	        	  pstmt.setString(4, token[3]);

	        	  // 讀取圖片檔
	        	  File aFile = new File("src/main/webapp/images/testPic/" + token[2].trim());
//	        	  File aFile = new File("WebContent/images/testPic/" + token[2].trim());
	        	  long size = aFile.length();
	        	  InputStream is = new FileInputStream(aFile);
	        	  // 設定Image欄位
	        	  pstmt.setBlob(3, is, size);
	              //  執行新增pokemon表格之紀錄的SQL命令
	              int r = pstmt.executeUpdate();
	              System.out.println("更新一筆achievement紀錄是否成功=" + r);
	          }
	          //  印出資料新增成功的訊息
	          System.out.println("achievement資料更新成功") ;
	      } catch(SQLException e) {
	          System.err.println("更新achievement表格時發生SQL例外: " + e.getMessage());
	          e.printStackTrace();
	      } catch(IOException e) {
	          System.err.println("更新achievement表格時發生IO例外: " + e.getMessage());
	      } 
	      
	      
	      
	      
//	          // 讀取要寫入表格的圖片檔
//	    	  File imageFile = new File("WebContent/images/smallPic/kittyabcde12345678901234567890.jpg");
//	    	  long size = imageFile.length();
//	    	  InputStream is = new FileInputStream(imageFile);
//	    	  // 設定Image欄位
//	    	  pstmt1.setBlob(11, is, size);
//	    	  // 設定fileName欄位
//	    	  String fileName = imageFile.getName();
//	    	  // 調整檔名的字元數
//	    	  fileName = GlobalValues.adjustFileName(fileName, GlobalValues.IMAGE_FILENAME_LENGTH);
	      
	      
		
	}
	
}
