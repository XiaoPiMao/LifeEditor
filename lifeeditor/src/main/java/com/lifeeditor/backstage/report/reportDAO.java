package com.lifeeditor.backstage.report;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lifeeditor.gobalService.GlobalService;

public class reportDAO  implements Serializable{
	
	private DataSource ds = null;
	private Connection conn = null;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;
	
	public reportDAO(){
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup(GlobalService.JNDI_DB_NAME);
		} catch (NamingException e) {			
			e.printStackTrace();
		}
	}
	
	public reportSexVO getSexData() throws SQLException{
	
		
		reportSexVO rSex = new reportSexVO();
				
		String selectSexData = "select count(gender) as boy, " +
								"(select count(gender) from user_spec where gender = 'F') as girl,"+
								"(select count(gender) from user_spec ) as total " +
								"from user_spec where gender = 'M'" ;
		
		try {
			
			conn = ds.getConnection();
			psmt = conn.prepareStatement(selectSexData);
			rs = psmt.executeQuery();
			while(rs.next()){
				rSex.setBoy((Integer)rs.getInt(1));
				rSex.setGirl((Integer)rs.getInt(2));
				rSex.setTotal((Integer)rs.getInt(3));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally{
			psmt.close();
			conn.close();
			rs.close();
		}
				
		return rSex;
	}
	
	public reportAgeVO getAgeData() throws SQLException{
		
		
		reportAgeVO rAge = new reportAgeVO();
		
		String selectAgeData = "select count(birthdate) as 'count'," + 
							   "(select count(birthdate) from user_spec where (DateDiff(Day,birthdate,getdate())/365) < 26) as 'teenager',"+
							   "(select count(birthdate) from user_spec where (DateDiff(Day,birthdate,getdate())/365) between 26 and 50) as 'middle',"+
							   "(select count(birthdate) from user_spec where (DateDiff(Day,birthdate,getdate())/365) between 51 and 75) as 'old',"+
							   "(select count(birthdate) from user_spec where (DateDiff(Day,birthdate,getdate())/365) > 76) as 'veryold'" +
							   "from user_spec";
		try{
			conn = ds.getConnection();
			psmt = conn.prepareStatement(selectAgeData);
			rs = psmt.executeQuery();
			while(rs.next()){
				rAge.setCount(rs.getInt(1));
				rAge.setTeenager(rs.getInt(2));
				rAge.setMiddle(rs.getInt(3));
				rAge.setOld(rs.getInt(4));
				rAge.setVeryold(rs.getInt(5));
			}
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}finally{
			psmt.close();
			conn.close();
			rs.close();
		}
		
		return rAge;
	}
}
