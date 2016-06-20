package com.lifeeditor.model.message;

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

import com.lifeeditor.utility.GlobalValues;

public class MessageDAO implements MessageDAO_interface{
	private static DataSource ds = null;
	
	private static final String GET_MSG = "";
	private static final String GET_MSG_ID = "";
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup(GlobalValues.DS_LOOKUP);
		}catch (NamingException ne) {
			ne.printStackTrace();
		}
	}

	
	
	@Override
	public List<MessageVO> getMessages() {
		Connection conn = null;
		List<MessageVO> messages = new ArrayList<>();
		try {
			conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(GET_MSG);
			ResultSet rs = pstmt.executeQuery();
		} catch(SQLException e) {
			System.out.println("SQLException");
		} finally {
			if(conn != null) {
				try {
					conn.close();
				}catch(SQLException e) {
					System.out.println("SQLException");
				}
			}
		}
		return messages;
	}

	@Override
	public List<MessageVO> getMessages(int messageID) {
		Connection conn = null;
		List<MessageVO> messages = new ArrayList<>();
		try {
			conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(GET_MSG_ID);
			pstmt.setInt(1, messageID);
			ResultSet rs = pstmt.executeQuery();
		} catch(SQLException e) {
			System.out.println("SQLException");
		} finally {
			if(conn != null) {
				try {
					conn.close();
				}catch(SQLException e) {
					System.out.println("SQLException");
				}
			}
		}
		return messages;
	}
}
