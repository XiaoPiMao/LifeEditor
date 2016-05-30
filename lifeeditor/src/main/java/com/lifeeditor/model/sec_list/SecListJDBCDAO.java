package com.lifeeditor.model.sec_list;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.lifeeditor.utility.GlobalValues;

public class SecListJDBCDAO implements SecListDAO_interface{
	private static final String BY_TYPEID_STMT = "SELECT * FROM sec_list WHERE typeID = ?";

	@Override
	public List<SecListVO> findByTypeListID(Integer id) {
		Connection conn = null;
		List<SecListVO> secs = new ArrayList<>();
		SecListVO sec = null;
		try{
			conn = DriverManager.getConnection(GlobalValues.SQL_URL,GlobalValues.SQL_USER,GlobalValues.SQL_PWD);
			PreparedStatement pstmt = conn.prepareStatement(BY_TYPEID_STMT);
			pstmt.setInt(1,id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				sec = new SecListVO();
				sec.setSecID(rs.getInt("secID"));
				sec.setSecName(rs.getString("secName"));
				sec.setTypeID(rs.getInt("typeID"));
				sec.setSecPic(rs.getBlob("secPic"));
				secs.add(sec);
			}
			
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

	public static void main(String[] args) {
		SecListJDBCDAO dao = new SecListJDBCDAO();
		List<SecListVO> secs = dao.findByTypeListID(3);
		for(SecListVO sec : secs) {
			System.out.println(sec.getSecID());
			System.out.println(sec.getTypeID());
			System.out.println(sec.getSecName());
		}
	}

}
