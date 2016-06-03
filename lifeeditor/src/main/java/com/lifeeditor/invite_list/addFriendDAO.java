package com.lifeeditor.invite_list;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lifeeditor.utility.GlobalValues;

public class addFriendDAO {
	
	DataSource ds = null;
	
	public addFriendDAO(){
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup(GlobalValues.DS_LOOKUP);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void insert(Integer user,String friend) throws SQLException{
		
		Connection conn = null;
		PreparedStatement psmt = null;
		String insertString = "insert into invite_list(inviter,receiver,accepted) values(?,?,?)";
		try{
			conn = ds.getConnection();
			psmt = conn.prepareStatement(insertString);
			psmt.setInt(1,user);
			psmt.setString(2,friend);
			psmt.setBoolean(3,false);
			psmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			conn.close();
			psmt.close();
		}
		
	}
	
	public ArrayList<Integer> select(Integer user) throws SQLException{
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String selectString = "select receiver from invite_list  where inviter =" + user;
		ArrayList<Integer> arr = new ArrayList<Integer>();
		try{
			conn = ds.getConnection();
			psmt = conn.prepareStatement(selectString);
			rs = psmt.executeQuery();
			while(rs.next()){
				arr.add(rs.getInt("receiver"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			conn.close();
			psmt.close();
		}

		return arr;
		
	}

}
