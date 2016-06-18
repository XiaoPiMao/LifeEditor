package com.lifeeditor.invite_list;

import java.io.ByteArrayOutputStream;
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
		
		String queryString = "select userID,account,lastName+firstName as name from user_spec where userID  not in " +
							 "(select receiver from invite_list  where inviter = '"+user+"' or receiver='"+user+"')";
		
		List<user_listVO> getall = new ArrayList<user_listVO>();
		try{
			conn = ds.getConnection();
			psmt = conn.prepareStatement(queryString);
			rs = psmt.executeQuery();
			
			while(rs.next()){		
				if(rs.getInt(1) != user){
					user_listVO userData = new user_listVO();
					userData.setUserid(rs.getInt(1));
					userData.setAccount(rs.getString(2));
					userData.setName(rs.getString(3));			

					getall.add(userData); 
				}
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
	
	public List<user_listVO> checkMyFriend(Integer user) throws SQLException, IOException{
		
		String queryString = "select inviter,account,(lastName+firstName) as name from invite_list " + 
							 "inner join user_spec on invite_list.inviter = user_spec.userID " +
							 "where receiver = "+user+" and accepted = 0";
		List<user_listVO> getall = new ArrayList<user_listVO>();
		try{
			
			conn = ds.getConnection();
			psmt = conn.prepareStatement(queryString);
			rs = psmt.executeQuery();
			while(rs.next()){
				user_listVO friend = new user_listVO();
				friend.setUserid(rs.getInt(1));
				friend.setAccount(rs.getString(2));
				friend.setName(rs.getString(3));

				getall.add(friend);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			conn.close();
			psmt.close();
			rs.close();
		}
		return getall;
	}
	
	public void deleteInviter(String user,String inviter){
		
		//String deleteString = "delete invite_list where inviter='"+inviter+"' and receiver = '"+user+"'";
		String deleteString = "delete invite_list where (inviter = '"+user+"' and receiver = '"+inviter+"') or (inviter = '"+inviter+"' and receiver = '"+user+"')";
		try{
			conn = ds.getConnection();
			psmt = conn.prepareStatement(deleteString);
			psmt.executeUpdate();			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				conn.close();
				psmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
	
	public void addFriendFromInviter(String user,String inviter){
		
		String updateString="update invite_list set accepted = 'true' where inviter='"+inviter+"' and receiver = '"+user+"'";
		
		try{
			conn = ds.getConnection();
			psmt = conn.prepareStatement(updateString);
			psmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				conn.close();
				psmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
					
		}
		addInviterToFriend(user,inviter); //增加好友
		addInviterToFriend(inviter,user);
	}
	public void addInviterToFriend(String user,String inviter){
		
		String addFriend = "insert into friend (userID,friendID,frdSince) values("+user+","+inviter+",GetDate())";
		
		try{
			conn = ds.getConnection();
			psmt = conn.prepareStatement(addFriend);
			psmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				conn.close();
				psmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}	
	}
	
	public List<user_listVO> showMyFriend(Integer data) throws IOException{
		
		String queryString = "select userID,account,lastName+firstName as name from user_spec where userID in (select friendID from friend where userID = '"+data+"')";
		List<user_listVO> getall = new ArrayList<user_listVO>();
		try{
			conn = ds.getConnection();
			psmt = conn.prepareStatement(queryString);
			rs = psmt.executeQuery();
			while(rs.next()){
				
				user_listVO user = new user_listVO();
				user.setUserid(rs.getInt(1));
				user.setAccount(rs.getString(2));
				user.setName(rs.getString(3));
				
				getall.add(user);
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				conn.close();
				psmt.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		return getall;
	}
	
	public void deleteFriend(String user,String inviter){
		
		String deleteString = "delete friend where (userID = '"+user+"'  and friendID = '"+inviter+"') or (userID = '"+inviter+"'  and friendID = '"+user+"')";
	
		try{
			conn = ds.getConnection();
			psmt = conn.prepareStatement(deleteString);
			psmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				conn.close();
				psmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}
	

}
