package oceanKuan;

import java.sql.*;
import java.io.*;

public class BLOBDemo {
	public static void main(String[] args) {
		Connection conn = null;
		java.sql.Date d1 = new java.sql.Date(Timestamp.valueOf("2012-05-01 00:00:00").getTime());
		try {     
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=LE01";
			conn = DriverManager.getConnection(connUrl, "sa", "password");
			
         	String qryStmt = "SELECT * FROM event ";
//			PreparedStatement stmt = conn.prepareStatement(qryStmt);
//			ResultSet rs = stmt.executeQuery();
			
//			if (rs.next()) {
//				String deleteStmt = "DELETE FROM event WHERE eventID = ?"; 
//				stmt = conn.prepareStatement(deleteStmt);
//				stmt.setString(1, inFile);
//				stmt.executeUpdate();
//				System.out.println("Delete blob is successful!");
//			}
			
			File f = new File("C:\\LocalRepository\\lifeeditor\\src\\main\\webapp\\images\\images.jpg");
			FileInputStream fis = new FileInputStream(f);
			String insertStmt = "INSERT INTO event VALUES(?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = conn.prepareStatement(insertStmt);
			stmt = conn.prepareStatement(insertStmt);
			
			stmt.setInt(1,2);
			stmt.setInt(2,10);
			stmt.setString(3,"事件名稱");
			stmt.setBinaryStream(4, fis);
			stmt.setString(5, "主辦單位");
			stmt.setString(6,"地址");
			stmt.setDate(7,d1);
			stmt.setString(8,"描述");
			
			stmt.executeUpdate();
			System.out.println("Insert blob is successful!");
	

	       stmt = conn.prepareStatement(qryStmt);
			ResultSet rs = stmt.executeQuery();
			
			if (rs.next()) {
				
//				FileOutputStream fos = new FileOutputStream("d:\\bird.jpg");
//				Blob b = rs.getBlob("eventPic");
//				byte[] data = b.getBytes(4, (int)b.length());
//				fos.write(data);
//				fos.close();
//				System.out.println("File output is successful!");
				
			} // end of if (rs.next()) 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null)
				try {
					conn.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
		}
	}// end of main()
}// end of class BLOBDemo 
