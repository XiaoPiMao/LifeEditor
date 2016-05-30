package com.lifeeditor.model.target;

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

import com.lifeeditor.model.achievement.AchievementHibernateDAO;
import com.lifeeditor.utility.GlobalValues;


public class TargetDAO_JNDI implements TargetDAO_interface {

	private static DataSource ds = null;
	static {
		
		try {
			Context ctx = new InitialContext();
			ds= (DataSource) ctx.lookup("java:comp/env/jdbc/LE01");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public  static final String INSERT_STMT = 
			"INSERT INTO target (trgName,typeID,sectionID,difficulty,intention,privacy,"
			+ "genkiBar,achID,priority,remindTimes,trgType,punishment,status,timeStart,timeFinish,doneTime) VALUES "
			+ "( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,)";
	
	public  static final String GET_ALL_STMT = 
			"SELECT targetID,trgName,typeID,sectionID,difficulty,intention,privacy,"
			+ "genkiBar,achID,priority,remindTimes,trgType,punishment,status,timeStart,timeFinish,doneTime "
			+ "FROM target order by targetID";
	public  static final String GET_ONE_STMT = 
			"SELECT targetID,trgName,typeID,sectionID,difficulty,intention,privacy,"
			+ "genkiBar,achID,priority,remindTimes,trgType,punishment,status,timeStart,timeFinish,doneTime "
			+ "FROM target where targetID = ?";
	public  static final String DELETE = 
			"DELETE FROM target where targetID = ?";
	public  static final String UPDATE = 
			"UPDATE target set trgName=?, typeID=?, sectionID=? , difficulty=? , intention=? , privacy=? , "
			+ "genkiBar=? , achID=? , priority=? , remindTimes=? , trgType=? , punishment=? , status=? , timeStart=? , "
			+ "timeFinish=? , doneTime=? where target = ?";
	


	@Override
	public void insert(TargetVO TrgVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1, TrgVO.getTargetID());
			pstmt.setString(2, TrgVO.getTrgName());
			pstmt.setInt(3, TrgVO.getTypeID());
			pstmt.setInt(4, TrgVO.getSectionID());
			pstmt.setInt(5, TrgVO.getDifficulty());
			pstmt.setString(6, TrgVO.getIntention());
			pstmt.setInt(7, TrgVO.getPrivacy());
			pstmt.setInt(8, TrgVO.getGenkiBar());
			pstmt.setInt(9, TrgVO.getAchID());
			pstmt.setInt(10, TrgVO.getPriority());
			pstmt.setInt(11, TrgVO.getRemindTimes());
			pstmt.setInt(12, TrgVO.getTrgType());
			pstmt.setInt(13, TrgVO.getPunishment());
			pstmt.setInt(14, TrgVO.getStatus());
			pstmt.setDate(15, TrgVO.getTimeStart());
			pstmt.setDate(16, TrgVO.getTimeFinish());
			pstmt.setDate(17, TrgVO.getDoneTime());
			
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
	public void update(TargetVO TrgVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setInt(1, TrgVO.getTargetID());
			pstmt.setString(2, TrgVO.getTrgName());
			pstmt.setInt(3, TrgVO.getTypeID());
			pstmt.setInt(4, TrgVO.getSectionID());
			pstmt.setInt(5, TrgVO.getDifficulty());
			pstmt.setString(6, TrgVO.getIntention());
			pstmt.setInt(7, TrgVO.getPrivacy());
			pstmt.setInt(8, TrgVO.getGenkiBar());
			pstmt.setInt(9, TrgVO.getAchID());
			pstmt.setInt(10, TrgVO.getPriority());
			pstmt.setInt(11, TrgVO.getRemindTimes());
			pstmt.setInt(12, TrgVO.getTrgType());
			pstmt.setInt(13, TrgVO.getPunishment());
			pstmt.setInt(14, TrgVO.getStatus());
			pstmt.setDate(15, TrgVO.getTimeStart());
			pstmt.setDate(16, TrgVO.getTimeFinish());
			pstmt.setDate(17, TrgVO.getDoneTime());
			
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
	public void delete(Integer pokedex) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setInt(1, pokedex);
			
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
	public TargetVO findByPrimaryKey(Integer targetID) {
		
		TargetVO TrgVO = new TargetVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setInt(1, targetID);
			
			rs = pstmt.executeQuery();
			
		
			if(rs.next()) {
				
				TrgVO.setTargetID(rs.getInt("targetID"));
				TrgVO.setTrgName(rs.getString("trgName"));
				TrgVO.setTypeID(rs.getInt("typeID"));
				TrgVO.setSectionID(rs.getInt("sectionID"));
				TrgVO.setDifficulty(rs.getInt("difficulty"));
				TrgVO.setIntention(rs.getString("intention"));
				TrgVO.setPrivacy(rs.getInt("privacy"));
				TrgVO.setGenkiBar(rs.getInt("genkiBar"));
				TrgVO.setAchID(rs.getInt("achID"));
				TrgVO.setPriority(rs.getInt("priority"));
				TrgVO.setRemindTimes(rs.getInt("remindTimes"));
				TrgVO.setTrgType(rs.getInt("trgType"));
				TrgVO.setPunishment(rs.getInt("punishment"));
				TrgVO.setStatus(rs.getInt("status"));
				TrgVO.setTimeStart(rs.getDate("timeStart"));
				TrgVO.setTimeFinish(rs.getDate("timeFinish"));
				TrgVO.setDoneTime(rs.getDate("doneTime"));
					
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
		return TrgVO;
		
	}

	@Override
	public List<TargetVO> getAll() {
		
		List<TargetVO> list = new ArrayList<TargetVO>();
		TargetVO TrgVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
		
		
			while(rs.next()) {
				TargetVO Trg = new TargetVO();
				Trg.setTargetID(rs.getInt("targetID"));
				Trg.setTrgName(rs.getString("trgName"));
				Trg.setTypeID(rs.getInt("typeID"));
				Trg.setSectionID(rs.getInt("sectionID"));
				Trg.setDifficulty(rs.getInt("difficulty"));
				Trg.setIntention(rs.getString("intention"));
				Trg.setPrivacy(rs.getInt("privacy"));
				Trg.setGenkiBar(rs.getInt("genkiBar"));
				Trg.setAchID(rs.getInt("achID"));
				Trg.setPriority(rs.getInt("priority"));
				Trg.setRemindTimes(rs.getInt("remindTimes"));
				Trg.setTrgType(rs.getInt("trgType"));
				Trg.setPunishment(rs.getInt("punishment"));
				Trg.setStatus(rs.getInt("status"));
				Trg.setTimeStart(rs.getDate("timeStart"));
				Trg.setTimeFinish(rs.getDate("timeFinish"));
				Trg.setDoneTime(rs.getDate("doneTime"));
				list.add(Trg);
				
				
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
	
}
