package com.lifeeditor.sec_list.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lifeeditor.utility.GlobalValues;

public class SecListJNDIDAO implements SecListDAO_interface{
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup(GlobalValues.DS_LOOKUP);
		} catch (NamingException ne) {
			ne.printStackTrace();
		}
	}
	
	
	private static final String BY_TYPEID_STMT = "SELECT * FROM sec_list WHERE typeID = ?";

	@Override
	public List<SecListVO> findByTypeListID(Integer id) {
		Connection conn = null;
		List<SecListVO> secs = new ArrayList<>();
		SecListVO sec = null;
		SecListVO tempSec = null;
		try{
			conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(BY_TYPEID_STMT);
			pstmt.setInt(1,id);
			ResultSet rs = pstmt.executeQuery();
			Boolean first = true;
			
			while(rs.next()) {
				sec = new SecListVO();
				sec.setSecID(rs.getInt("secID"));
				sec.setSecName(rs.getString("secName"));
				sec.setTypeID(rs.getInt("typeID"));
				sec.setSecPic(rs.getBlob("secPic"));
				if(first) {
					tempSec = sec;
					first = false;
				}else {
					secs.add(sec);
				}
			}
			secs.add(tempSec);
			
		}catch(SQLException se) {
			se.printStackTrace();
		}finally {
			if(conn != null) {
				try {
					conn.close();
				}catch(SQLException se) {
					se.printStackTrace();
				}
			}
		}
		return secs;
	}
}
