package com.lifeeditor.type_list.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.lifeeditor.utility.GlobalValues;

public class TypeListJDBCDAO implements TypeListDAO_interface{
	private static final String GET_ALL_STMT = "SELECT * FROM type_list";

	@Override
	public List<TypeListVO> getAll() {
		Connection conn = null;
		List<TypeListVO> types = new ArrayList<>();
		TypeListVO type = null;
		try {
			conn = DriverManager.getConnection(GlobalValues.SQL_URL,GlobalValues.SQL_USER,GlobalValues.SQL_PWD);
			PreparedStatement pstmt = conn.prepareStatement(GET_ALL_STMT);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				 type = new TypeListVO();
				 type.setTypeID(rs.getInt("typeID"));
				 type.setTypeName(rs.getString("typeName"));
				 type.setTypePic(rs.getBlob("typePic"));
				 types.add(type);
			}
		}catch(SQLException se) { 
			se.printStackTrace();
		}finally {
			if(conn!= null) {
				try {
					conn.close();
				}catch(SQLException se) {
					se.printStackTrace();
				}
			}
		}
		return types;
	}
	
	public static void main(String[] args) {
		TypeListJDBCDAO dao = new TypeListJDBCDAO();
		List<TypeListVO> types = dao.getAll();
		for(TypeListVO type : types) {
			System.out.println(type.getTypeID());
			System.out.println(type.getTypeName());
		}
	}

}
