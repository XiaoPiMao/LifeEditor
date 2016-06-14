package com.lifeeditor.model.type_list;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.sql.DataSource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.utility.GlobalValues;

public class TypeListJNDIDAO implements TypeListDAO_interface{
	private static DataSource ds = null;
	private HibernateTemplate hibernateTemplate;    
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
        this.hibernateTemplate = hibernateTemplate;
    }
	
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup(GlobalValues.DS_LOOKUP);
		}catch (NamingException ne) {
			ne.printStackTrace();
		}
	}
	
	private static final String GET_ALL_STMT = "SELECT * FROM type_list";

	
	
	@Override
	public List<TypeListVO> getAll() {
		Connection conn = null;
		List<TypeListVO> types = new ArrayList<>();
		TypeListVO type = null;
		TypeListVO tempType = null;
		try {
			conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(GET_ALL_STMT);
			ResultSet rs = pstmt.executeQuery();
			Boolean first = true;
			while(rs.next()) {
				 type = new TypeListVO();
				 type.setTypeID(rs.getInt("typeID"));
				 type.setTypeName(rs.getString("typeName"));
				 type.setTypePic(rs.getBlob("typePic"));
				 if(first) {
					 first = false;
					 tempType = type;
				 }else {
					 types.add(type);
				 }
			}
			types.add(tempType);//自訂要放到最後一個
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

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(TypeListVO TypeListVO) {
		hibernateTemplate.saveOrUpdate(TypeListVO);	
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(TypeListVO TypeListVO) {
		hibernateTemplate.saveOrUpdate(TypeListVO);	
	}

	@Override
	public TypeListVO findByPrimaryKey(Integer typeID) {
		TypeListVO TypeListVO = (TypeListVO) hibernateTemplate.get(TypeListVO.class, typeID);
		return TypeListVO;
	}
}