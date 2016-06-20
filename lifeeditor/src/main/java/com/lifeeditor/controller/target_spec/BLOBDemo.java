package com.lifeeditor.controller.target_spec;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import java.util.Date;
import java.util.Properties;
import java.io.*;

import javax.imageio.stream.ImageOutputStream;
import javax.sql.rowset.serial.SerialBlob;

public class BLOBDemo {
	@SuppressWarnings("resource")
	public static void main(String[] args) {
		Connection conn = null;
		java.sql.Date d1 = new java.sql.Date(Timestamp.valueOf("2012-05-01 00:00:00").getTime());
//		try {     
//			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=LE01";
//			conn = DriverManager.getConnection(connUrl, "sa", "password");
//	
//         	String qryStmt = "SELECT trgPicPath FROM target_spec where trgSpecID=? ";
//			PreparedStatement stmt = conn.prepareStatement(qryStmt);
//			ResultSet rs = stmt.executeQuery();
//         	
//			if (rs.next()) {
//				String deleteStmt = "DELETE FROM event WHERE eventID = ?"; 
//				stmt = conn.prepareStatement(deleteStmt);
//				stmt.setString(1, inFile);
//				stmt.executeUpdate();
//				System.out.println("Delete blob is successful!");
//			}
//         	String current = new java.io.File( "." ).getCanonicalPath();
//	        System.out.println("Current dir:"+current);
//	 String currentDir = System.getProperty("user.dir");
//	        System.out.println("Current dir using System:" +currentDir);
//	        String path="\\src\\main\\webapp\\images\\AAFFFA.jpg";
//			String bb=current+path;
         	Date  time=new Date(System.currentTimeMillis());
			System.out.println(time);}
			
//		FileInputStream fis = new FileInputStream(f);
//			String insertStmt = "INSERT INTO target_spec VALUES(?,?,?,?)";
//			PreparedStatement stmt = conn.prepareStatement(insertStmt);
//			stmt = conn.prepareStatement(insertStmt);
//			
//			stmt.setInt(1,1);
//			stmt.setInt(2,1);
//			stmt.setString(3,"事件名稱");
//			stmt.setString(4, bb);
//			
//			
//			stmt.executeUpdate();
//			System.out.println("Insert blob is successful!");
//	
//			PreparedStatement  dstmt = conn.prepareStatement(qryStmt);
//			dstmt.setInt(1, 9);
//
//			 ResultSet rs = dstmt.executeQuery();
//			
//			
//			if (rs.next()) {
////				 current = new java.io.File( "." ).getCanonicalPath();
//				 String b=rs.getString("trgPicPath");
//		        File file=new File(bb);//存入檔案的路徑
//				FileOutputStream fos = new FileOutputStream(file);
//				File fileg=new File(b);
//				InputStream f= new FileInputStream(fileg);
//				byte[] bbb = readFully(f);
////			    Path currentRelativePath = Paths.get("target_spec_Pic");
////			    String s = currentRelativePath.toAbsolutePath().toString();
//				fileg.length();
//				Blob Pic = new SerialBlob(bbb);
//				Pic.getBytes(1, (int) Pic.length());
////				byte[] aaa=new byte[(int) fileg.length()];
////			    FileWriter out = new java.io.FileWriter("C:\\Users\\Student\\Desktop\\心情桌面\\e7704777.jpg" );
////			    String      text = new java.lang.String( b.getBytes(1, (int) b.length()), "UTF-8");
//			    fos.write(Pic.getBytes(1, (int) Pic.length()),0,(int) Pic.length());
//			    System.out.println(fos);
//			    fos.flush();
//			    fos.close();
				
			    
				





//	FileOutputStream os = new FileOutputStream("C:/UploadedFiles");
//	os.write(b);
//	  
//	File destFolder = new File("C:/UploadedFiles");
//	File fNew2 = new File(destFolder,is);
//	  
				
//			} // end of if (rs.next()) 
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			if (conn != null)
//				try {
//					conn.close();
//				} catch(SQLException e) {
//					e.printStackTrace();
//				}
//		}
//	
//	
//	
//	}
	
private static byte[] readFully(InputStream in) {
		
		byte[] buffer = new byte[8192];
		int bytesRead;
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		try {
			while ((bytesRead = in.read(buffer)) != -1) {
				output.write(buffer, 0, bytesRead);
			}
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		return output.toByteArray();

	}

	// end of main()
}// end of class BLOBDemo 
