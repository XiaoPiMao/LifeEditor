package com.lifeeditor.invite_list;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lifeeditor.utility.GlobalValues;

public class getAllFriendFromDB {
	DataSource ds = null;
	public getAllFriendFromDB(){ //取得連線
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup(GlobalValues.DS_LOOKUP);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
public List<myFriendVO> selectFriend(Integer id) throws IOException{
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String queryString = "select * from friend where userID =" + id;
		List<myFriendVO> getall = new ArrayList<myFriendVO>();

//		
		try {
			conn = ds.getConnection();
			psmt = conn.prepareStatement(queryString);
			rs = psmt.executeQuery();
		
			while(rs.next()){
				myFriendVO myFriend = new myFriendVO();
				myFriend.setUserID(rs.getInt(1));
				myFriend.setFriendID(rs.getInt(2));
				myFriend.setFrdSince(rs.getDate(3));			

				getall.add(myFriend);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
					
		return getall;
		
	}
}
