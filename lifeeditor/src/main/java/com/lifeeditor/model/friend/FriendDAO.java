package com.lifeeditor.model.friend;

import java.io.IOException;
import java.io.InputStream;
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
import javax.xml.bind.DatatypeConverter;

import org.apache.commons.io.IOUtils;

import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.utility.GlobalValues;

public class FriendDAO implements FriendDAO_interface{
	
	DataSource ds = null;
	
	
	public FriendDAO(){
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup(GlobalValues.DS_LOOKUP);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public List<user_specVO> findFriendsByUserID(Integer userID) {
		String query = "select f.friendID,u.firstName,u.lastName from user_spec u" + 
				" join (select friendID from friend where userid = 75) f" + 
				" on u.userID = f.friendID"; 
		Connection conn = null;
		
		List<user_specVO> friends = new ArrayList<>(); 
		try {
			conn = ds.getConnection();
			PreparedStatement psmt = conn.prepareStatement(query);
			ResultSet rs = psmt.executeQuery();
			user_specVO friend = null;
			while(rs.next()) {
				friend = new user_specVO();
				friend.setUserID(rs.getInt("friendID"));
				friend.setFirstName(rs.getNString("firstName"));
				friend.setLastName(rs.getNString("lastName"));
				friends.add(friend);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return friends;
	}
}
