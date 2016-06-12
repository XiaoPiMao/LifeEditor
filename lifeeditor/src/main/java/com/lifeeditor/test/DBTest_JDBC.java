package com.lifeeditor.test;

import java.sql.*;


import com.lifeeditor.utility.GlobalValues;


public class DBTest_JDBC {

	public static void main(String[] args) {
		Connection conn = null;
		try{
			Class.forName(GlobalValues.SQL_DRIVER);
			conn = DriverManager.getConnection(GlobalValues.SQL_URL,GlobalValues.SQL_USER,GlobalValues.SQL_PWD);
			PreparedStatement pstmt = conn.prepareStatement("SELECT firstName FROM user_spec");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getString(1));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if(conn != null) {
				try {
					conn.close();
				}catch(SQLException SQLE) {
					SQLE.printStackTrace();
				}
			}
		}

	}

}
