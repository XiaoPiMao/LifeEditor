package com.lifeeditor.backstageLogin;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.xml.bind.DatatypeConverter;

import com.lifeeditor.gobalService.GlobalService;

public class loginServiceDB {
	
	DataSource ds = null;
	
	public loginServiceDB(){
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup(GlobalService.JNDI_DB_NAME);
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	
	public backmangerVO chkpassword(String account,String pswd) throws IOException{
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		backmangerVO backmem = new backmangerVO();
		
		try {
			conn = ds.getConnection();
			String queryString = "select * from manager where account = '"+account+"' and pswd = '"+pswd+"'";
			psmt = conn.prepareStatement(queryString);
			rs = psmt.executeQuery();
			while(rs.next()){			
				backmem.setAccount(rs.getString(1));
				backmem.setPswd(rs.getString(2));
				backmem.setPicture(rs.getBlob(3));			
			}
			
		} catch (SQLException e) {			
			System.out.println(e.getMessage());
		}
		
		
		return backmem;
	}
}
