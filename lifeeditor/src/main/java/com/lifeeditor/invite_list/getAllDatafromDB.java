package com.lifeeditor.invite_list;


import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.xml.bind.DatatypeConverter;

import org.apache.commons.io.IOUtils;
import com.lifeeditor.utility.GlobalValues;

public class getAllDatafromDB {
	
	DataSource ds = null;
	public getAllDatafromDB(){ //取得連線
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup(GlobalValues.DS_LOOKUP);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public List<user_listVO> selectFriend() throws IOException{
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String queryString = "select userID,account,lastName+firstName as name,picture  from user_spec  ";
		List<user_listVO> getall = new ArrayList();

//		
		try {
			conn = ds.getConnection();
			psmt = conn.prepareStatement(queryString);
			rs = psmt.executeQuery();
		
			while(rs.next()){
				user_listVO user = new user_listVO();
				user.setUserid(rs.getInt(1));
				user.setAccount(rs.getString(2));
				user.setName(rs.getString(3));			
				InputStream in = rs.getBinaryStream(4);			

				byte[] data = IOUtils.toByteArray(in);;
				String photo =  DatatypeConverter.printBase64Binary(data);
				user.setPicture(photo);
				getall.add(user);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
					
		return getall;
		
	}
}
