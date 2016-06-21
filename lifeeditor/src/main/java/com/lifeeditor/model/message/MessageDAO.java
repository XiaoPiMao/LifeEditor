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
	
	private static final String GET_MSG = 
			"SELECT s.messageID,s.msgSender,s.msgReceiver,s.content FROM "+
			"(SELECT TOP 10 * FROM message "+
			"WHERE (msgSender = ? AND msgReceiver = ?) OR (msgSender = ? AND msgReceiver = ?) "+
			"ORDER BY messageID DESC)s "+
			"ORDER BY messageID";
	private static final String GET_MSG_ID = 
			"SELECT s.messageID,s.msgSender,s.msgReceiver,s.content FROM "+
			"(SELECT TOP 10 * FROM message "+
			"WHERE (messageID < ?) AND  ((msgSender = ? AND msgReceiver = ?) OR (msgSender = ? AND msgReceiver = ?) ) "+
			"ORDER BY messageID DESC)s "+
			"ORDER BY messageID";
	private static final String INSERT = "INSERT INTO message VALUES(?,?,GETDATE(),?)";
	
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup(GlobalValues.DS_LOOKUP);
		}catch (NamingException ne) {
			ne.printStackTrace();
		}
	}

	
	
	@Override
	public List<MessageVO> getMessages(Integer msgSender,Integer msgReceiver) {
		Connection conn = null;
		List<MessageVO> messages = new ArrayList<>();
		try {
			conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(GET_MSG);
			pstmt.setInt(1, msgSender);
			pstmt.setInt(2, msgReceiver);
			pstmt.setInt(3, msgReceiver);
			pstmt.setInt(4, msgSender);
			
			ResultSet rs = pstmt.executeQuery();
			MessageVO msg = null;
			while(rs.next()) {
				msg = new MessageVO();
				msg.setMessageID(rs.getInt("messageID"));
				msg.setMsgSender(rs.getInt("msgSender"));
				msg.setMsgReceiver(rs.getInt("msgReceiver"));
				msg.setContent(rs.getString("content"));
				messages.add(msg);
			}
			
			
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
	public List<MessageVO> getMessages(Integer msgSender,Integer msgReceiver,Integer messageID) {
		Connection conn = null;
		List<MessageVO> messages = new ArrayList<>();
		try {
			conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(GET_MSG_ID);
			pstmt.setInt(1, messageID);
			pstmt.setInt(2, msgSender);
			pstmt.setInt(3, msgReceiver);
			pstmt.setInt(4, msgReceiver);
			pstmt.setInt(5, msgSender);
			
			ResultSet rs = pstmt.executeQuery();
			MessageVO msg = null;
			while(rs.next()) {
				msg = new MessageVO();
				msg.setMessageID(rs.getInt("messageID"));
				msg.setMsgSender(rs.getInt("msgSender"));
				msg.setMsgReceiver(rs.getInt("msgReceiver"));
				msg.setContent(rs.getString("content"));
				messages.add(msg);
			}
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
	public void insertMessage(Integer msgSender, Integer msgReceiver,
			String content) {
		Connection conn = null;
		try {
			conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(INSERT);
			pstmt.setInt(1, msgSender);
			pstmt.setInt(2, msgReceiver);
			pstmt.setString(3, content);
			pstmt.executeUpdate();
			
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
	}
}
