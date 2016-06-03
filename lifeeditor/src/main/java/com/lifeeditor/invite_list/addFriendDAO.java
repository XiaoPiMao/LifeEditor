package com.lifeeditor.invite_list;

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

import com.lifeeditor.utility.GlobalValues;

public class addFriendDAO {
	
	DataSource ds = null;
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
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
			rs.close();
		}
		return arr;		
	}
	public List<user_listVO> selectFriend(Integer user) throws SQLException{
		
		String queryString = "select userID,account,lastName+firstName as name,picture from user_spec where userID  not in " +
							 "(select receiver from invite_list  where inviter = "+user+")";
		
		List<user_listVO> getall = new ArrayList<user_listVO>();
		try{
			conn = ds.getConnection();
			psmt = conn.prepareStatement(queryString);
			rs = psmt.executeQuery();
			
			while(rs.next()){
				user_listVO userData = new user_listVO();
				userData.setUserid(rs.getInt(1));
				userData.setAccount(rs.getString(2));
				userData.setName(rs.getString(3));			
				InputStream in = rs.getBinaryStream(4);			

				byte[] data = IOUtils.toByteArray(in);
				String photo =  DatatypeConverter.printBase64Binary(data);
				userData.setPicture(photo);
				getall.add(userData); 
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			conn.close();
			psmt.close();
			rs.close();
		}
		
		return getall;	
	}
}
