package com.lifeeditor.test;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBTest_JNDI {
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/LE01");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String SELECT_STMT = "SELECT firstName FROM user_spec";
	
	public List<String> getall() {

		List<String> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_STMT);

			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String  a= rs.getString("firstName");
				list.add(a);
			}
			
			return list;
		
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
		
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

}
