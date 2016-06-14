package com.lifeeditor.model.achievement;

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

import org.springframework.orm.hibernate3.HibernateTemplate;

public class AchievementDAO_JNDI implements AchievementDAO_interface{
	@SuppressWarnings("unused")
	private HibernateTemplate hibernateTemplate;    
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
        this.hibernateTemplate = hibernateTemplate;
    }

	
	private static DataSource ds = null;
	static {
		
		try {
			Context ctx = new InitialContext();
			ds= (DataSource) ctx.lookup("java:comp/env/jdbc/LE01");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	public static final String GET_IDENTITY = "select @@IDENTITY AS 'result'";
	
	public  static final String INSERT_STMT = 
			"INSERT INTO achievement (achName,achDesc,rewardPic) VALUES ( ?, ?, ?) ";
	
	public  static final String UPDATE = 
			"UPDATE achievement set achName=?, achDesc=?, rewardPic=? where achID = ?";
	
	private static final String DELETE_ACH = "delete from achievement where achID = ?";
	
	private static final String GET_ALL_STMT = " select * from achievement order by achID";
	
	public  static final String GET_ONE_STMT = 
			"SELECT achID,achName,achDesc,rewardPic FROM achievement where achID = ?";

	public  static final String SEARCH_LIKE = " select * from achievement where achName like ?" ;

	public  static final String GET_PICTURE = "SELECT rewardPic FROM achievement where achID = ?";
	
	@SuppressWarnings("resource")
	@Override
	public int insert(AchievementVO achVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, achVO.getAchName());
			pstmt.setString(2, achVO.getAchDesc());
			pstmt.setBlob(3, achVO.getRewardPic());
			pstmt.executeUpdate();
		
			//***************利用SQL特殊指令"select @@IDENTITY AS 'result'"在Insert完成的當下，立刻取得該筆新增的ID***********//
			pstmt = con.prepareStatement(GET_IDENTITY);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			throw new RuntimeException("發生錯誤" + e.getMessage());
		}finally{
			if(pstmt != null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}if(con != null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return result;
	}
		
		

	@Override
	public void update(AchievementVO achVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, achVO.getAchName());
			pstmt.setString(2, achVO.getAchDesc());
			pstmt.setBlob(3, achVO.getRewardPic());
			pstmt.setInt(4, achVO.getAchID());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new RuntimeException("發生錯誤" + e.getMessage());
		}finally{
			if(pstmt != null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}if(con != null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void delete(AchievementVO achVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_ACH);
			
			pstmt.setInt(1, achVO.getAchID());
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			throw new RuntimeException("發生錯誤" + e.getMessage());
		}finally{
			if(pstmt != null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}if(con != null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public void delete(Integer achID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_ACH);
			
			pstmt.setInt(1, achID);
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			throw new RuntimeException("發生錯誤" + e.getMessage());
		}finally{
			if(pstmt != null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}if(con != null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public AchievementVO findByPrimaryKey(Integer achID) {
		AchievementVO AchVO = new AchievementVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setInt(1, achID);
			
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				AchVO.setAchID(rs.getInt("achID"));
				AchVO.setAchName(rs.getString("achName"));
				AchVO.setAchDesc(rs.getString("achDesc"));
				AchVO.setRewardPic(rs.getBlob("rewardPic"));
				
				
			}	
			
		} catch (SQLException e) {
			throw new RuntimeException("發生錯誤" + e.getMessage());
		}finally{
			if(rs != null){
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(pstmt != null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(con != null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return AchVO;
		
	}

	@Override
	public List<AchievementVO> getAll() {
		List<AchievementVO> list = new ArrayList<AchievementVO>();
		AchievementVO achVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				achVO = new AchievementVO();
				achVO.setAchID(rs.getInt("achID"));
				achVO.setAchName(rs.getString("achName"));
				achVO.setAchDesc(rs.getString("achDesc"));
				achVO.setRewardPic(rs.getBlob("rewardPic"));
	
				list.add(achVO);
				
				
			}	
			
		} catch (SQLException e) {
			throw new RuntimeException("發生錯誤" + e.getMessage());
		}finally{
			if(rs != null){
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(pstmt != null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(con != null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}



	@Override
	public List<AchievementVO> findByKeyword(String keyword) {
		
		List<AchievementVO> list =  new ArrayList<AchievementVO>();
		AchievementVO AchmtVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(SEARCH_LIKE);
			
			pstmt.setString(1, "%" + keyword + "%");	
			rs = pstmt.executeQuery();
	
			while(rs.next()) {
				AchmtVO = new AchievementVO();
				AchmtVO.setAchID(rs.getInt("achID"));
				AchmtVO.setAchName(rs.getString("achName"));
				AchmtVO.setAchDesc(rs.getString("achDesc"));
				//AchmtVO.setRewardPic(rs.getBlob("rewardPic"));
				list.add(AchmtVO);
			}
			
		}catch (SQLException e) {
			throw new RuntimeException("發生錯誤" + e.getMessage());
		}finally{
			if(rs != null){
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(pstmt != null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(con != null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	

	
	}

	@Override
	public AchievementVO findPicture(Integer achID) {
		AchievementVO AchVO = new AchievementVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_PICTURE);
			
			pstmt.setInt(1, achID);
			
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				AchVO.setRewardPic(rs.getBlob("rewardPic"));
	
			}	
			
		} catch (SQLException e) {
			throw new RuntimeException("發生錯誤" + e.getMessage());
		}finally{
			if(rs != null){
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(pstmt != null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(con != null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return AchVO;
		
	}
	
}
