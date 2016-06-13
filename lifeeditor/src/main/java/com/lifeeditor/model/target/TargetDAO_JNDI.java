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

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.lifeeditor.model.achievement.AchievementVO;
import com.lifeeditor.model.sec_list.SecListVO;
import com.lifeeditor.model.type_list.TypeListVO;
import com.lifeeditor.service.AchievementService;
import com.lifeeditor.service.SecListService;
import com.lifeeditor.service.TypeListService;


public class TargetDAO_JNDI implements TargetDAO_interface {
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
			"INSERT INTO target (trgName,typeID,sectionID,difficulty,intention,privacy,"
			+ "genkiBar,achID,priority,remindTimes,trgType,punishment,status,timeStart,timeFinish,doneTime) VALUES "
			+ "( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
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
			+ "timeFinish=? , doneTime=? where targetID = ?";
	
	public  static final String SEARCH_LIKE = " select * from target where trgType =1 and trgName like ?" ;

	public  static final String SHOW_OFFICIAL = "select t.trgName,ty.typeName,s.secName,t.intention,t.difficulty,t.timeFinish,t.typeID,t.sectionID,t.targetID" + 
												" from target t" +   
												" JOIN type_list ty ON ty.typeID = t.typeID" + 
												" JOIN sec_list s ON s.secID = t.sectionID" + 
												" where trgType =1 and timeFinish >= GETDATE()";
	
	public  static final String COUNT_NUMS_OF_TARGET_NAME = "SELECT COUNT(*) FROM target where trgName=? and trgType =2 ";
	
	public  static final String SHOW_ALL_CHALLENGE_NAME_FROM_USER = "SELECT trgName FROM target INNER JOIN target_list "+
	"ON target.targetID = target_list.targetID where userID = ? and trgType = 2 and timeFinish >= GETDATE()";

	@SuppressWarnings("resource")
	@Override
	public int insert(TargetVO TrgVO) {

		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			
			pstmt.setString(1, TrgVO.getTrgName());
			pstmt.setInt(2, TrgVO.getTypeVO().getTypeID());
			pstmt.setInt(3, TrgVO.getSectionVO().getSecID());
			pstmt.setInt(4, TrgVO.getDifficulty());
			pstmt.setString(5, TrgVO.getIntention());
			if(TrgVO.getPrivacy() != null) 
				pstmt.setInt(6, TrgVO.getPrivacy());
			else
				pstmt.setNull(6, java.sql.Types.INTEGER);
			
			if(TrgVO.getGenkiBar() != null) 
				pstmt.setInt(7, TrgVO.getGenkiBar());
			else
				pstmt.setNull(7, java.sql.Types.INTEGER);
			
			AchievementVO achVO = TrgVO.getAchVO();
			if(achVO.getAchID() != null) 
				pstmt.setInt(8, achVO.getAchID());
			else
				pstmt.setNull(8, java.sql.Types.INTEGER);
			
			if(TrgVO.getPriority() != null) 
				pstmt.setInt(9, TrgVO.getPriority());
			else
				pstmt.setNull(9, java.sql.Types.INTEGER);
			
			if(TrgVO.getRemindTimes() != null) 
				pstmt.setInt(10, TrgVO.getRemindTimes());
			else
				pstmt.setNull(10, java.sql.Types.INTEGER);
			
			pstmt.setInt(11, TrgVO.getTrgType());
			
			if(TrgVO.getPunishment() != null) 
				pstmt.setInt(12, TrgVO.getPunishment());
			else
				pstmt.setNull(12, java.sql.Types.INTEGER);
			
			if(TrgVO.getStatus() != null) 
				pstmt.setInt(13, TrgVO.getStatus());
			else
				pstmt.setNull(13, java.sql.Types.INTEGER);

			pstmt.setDate(14, TrgVO.getTimeStart());
			pstmt.setDate(15, TrgVO.getTimeFinish());
			
			pstmt.setDate(16, TrgVO.getDoneTime());
//			if(TrgVO.getDoneTime() != null) 
//				pstmt.setDate(16, TrgVO.getDoneTime());
//			else
//				pstmt.setNull(16, java.sql.Types.DATE);
	
			pstmt.executeUpdate();
			
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
	public void update(TargetVO TrgVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, TrgVO.getTrgName());
			pstmt.setInt(2, TrgVO.getTypeVO().getTypeID());
			pstmt.setInt(3, TrgVO.getSectionVO().getSecID());
			pstmt.setInt(4, TrgVO.getDifficulty());
			pstmt.setString(5, TrgVO.getIntention());
			
			if(TrgVO.getPrivacy() != null) 
				pstmt.setInt(6, TrgVO.getPrivacy());
			else
				pstmt.setNull(6, java.sql.Types.INTEGER);
			
			if(TrgVO.getGenkiBar() != null) 
				pstmt.setInt(7, TrgVO.getGenkiBar());
			else
				pstmt.setNull(7, java.sql.Types.INTEGER);
			
			AchievementVO achVO = TrgVO.getAchVO();
			if(achVO.getAchID() != null) 
				pstmt.setInt(8, achVO.getAchID());
			else
				pstmt.setNull(8, java.sql.Types.INTEGER);
			
			if(TrgVO.getPriority() != null) 
				pstmt.setInt(9, TrgVO.getPriority());
			else
				pstmt.setNull(9, java.sql.Types.INTEGER);
			
			if(TrgVO.getRemindTimes() != null) 
				pstmt.setInt(10, TrgVO.getRemindTimes());
			else
				pstmt.setNull(10, java.sql.Types.INTEGER);
			
			pstmt.setInt(11, TrgVO.getTrgType());
			
			if(TrgVO.getPunishment() != null) 
				pstmt.setInt(12, TrgVO.getPunishment());
			else
				pstmt.setNull(12, java.sql.Types.INTEGER);
			
			if(TrgVO.getStatus() != null) 
				pstmt.setInt(13, TrgVO.getStatus());
			else
				pstmt.setNull(13, java.sql.Types.INTEGER);

			pstmt.setDate(14, TrgVO.getTimeStart());
			pstmt.setDate(15, TrgVO.getTimeFinish());
			
			pstmt.setDate(16, TrgVO.getDoneTime());
			
			
//			pstmt.setInt(6, TrgVO.getPrivacy());
//			pstmt.setInt(7, TrgVO.getGenkiBar());
//			AchievementVO achVO = TrgVO.getAchVO();
//			pstmt.setInt(8, achVO.getAchID());
//			pstmt.setInt(9, TrgVO.getPriority());
//			pstmt.setInt(10, TrgVO.getRemindTimes());
//			pstmt.setInt(11, TrgVO.getTrgType());
//			pstmt.setInt(12, TrgVO.getPunishment());
//			pstmt.setInt(13, TrgVO.getStatus());
//			pstmt.setDate(14, TrgVO.getTimeStart());
//			pstmt.setDate(15, TrgVO.getTimeFinish());
//			pstmt.setDate(16, TrgVO.getDoneTime());
			pstmt.setInt(17, TrgVO.getTargetID());
			
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
	public void delete(Integer targetID) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setInt(1, targetID);
			
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
			AchievementService achSvc = new AchievementService();
		
			if(rs.next()) {
				TypeListVO typeListVO= new TypeListVO();
				SecListVO secListVO= new SecListVO();
				
				TrgVO.setTargetID(rs.getInt("targetID"));
				TrgVO.setTrgName(rs.getString("trgName"));
				typeListVO.setTypeID(rs.getInt("typeID"));
				TrgVO.setTypeVO(typeListVO);
				secListVO.setSecID(rs.getInt("sectionID"));
				TrgVO.setSectionVO(secListVO);
				TrgVO.setDifficulty(rs.getInt("difficulty"));
				TrgVO.setIntention(rs.getString("intention"));
				TrgVO.setPrivacy(rs.getInt("privacy"));
				TrgVO.setGenkiBar(rs.getInt("genkiBar"));
				TrgVO.setAchVO(achSvc.getOneAchmt(rs.getInt("achID")));
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
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			AchievementService achSvc = new AchievementService();
		
			while(rs.next()) {
				
				TargetVO Trg = new TargetVO();
				Trg.setTargetID(rs.getInt("targetID"));
				Trg.setTrgName(rs.getString("trgName"));	
				Trg.setTypeVO(new TypeListService().getOneUser(rs.getInt("typeID")));
				Trg.setSectionVO(new SecListService().getOneUser(rs.getInt("sectionID")));  
				Trg.setDifficulty(rs.getInt("difficulty"));
				Trg.setIntention(rs.getString("intention"));
				Trg.setPrivacy(rs.getInt("privacy"));
				Trg.setGenkiBar(rs.getInt("genkiBar"));
				Trg.setAchVO(achSvc.getOneAchmt(rs.getInt("achID")));
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

	
	@Override
	public List<TargetVO> getAllofficial() {
		List<TargetVO> list = new ArrayList<TargetVO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(SHOW_OFFICIAL);
			rs = pstmt.executeQuery();
			AchievementService achSvc = new AchievementService();
			TargetVO Trg = null;
			TypeListVO type = null;
			SecListVO sec = null;
			while(rs.next()) {
				Trg = new TargetVO();
				type = new TypeListVO();
				sec = new SecListVO();
				Trg.setTargetID(rs.getInt("targetID"));
				Trg.setTrgName(rs.getString("trgName"));
				type.setTypeID(rs.getInt("typeID"));
				type.setTypeName(rs.getString("typeName"));
				Trg.setTypeVO(type);
				sec.setSecID(rs.getInt("sectionID"));
				sec.setSecName(rs.getString("secName"));
				Trg.setSectionVO(sec);  
				Trg.setDifficulty(rs.getInt("difficulty"));
				Trg.setIntention(rs.getString("intention"));
				Trg.setTimeFinish(rs.getDate("timeFinish"));
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
	
	
	
	@Override
	public List<TargetVO> findByKeyword(String keyword) {
		
		List<TargetVO> list = new ArrayList<TargetVO>();
		TargetVO TrgVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SEARCH_LIKE);
			
			pstmt.setString(1, "%" + keyword + "%");
			
			rs = pstmt.executeQuery();
			AchievementService achSvc = new AchievementService();
			
			while(rs.next()) {
				TrgVO = new TargetVO();
//				TypeListVO typeListVO = new TypeListVO();
//				SecListVO secListVO = new SecListVO();
				
				TrgVO.setTargetID(rs.getInt("targetID"));
				TrgVO.setTrgName(rs.getString("trgName"));
//				typeListVO.setTypeID(rs.getInt("typeID"));
//				TrgVO.setTypeVO(typeListVO);
//				secListVO.setSecID(rs.getInt("secID"));
//				TrgVO.setSectionVO(secListVO);
				
				TrgVO.setTypeVO(new TypeListService().getOneUser(rs.getInt("typeID")));
				TrgVO.setSectionVO(new SecListService().getOneUser(rs.getInt("sectionID")));  
				
				TrgVO.setDifficulty(rs.getInt("difficulty"));
				TrgVO.setIntention(rs.getString("intention"));
				TrgVO.setPrivacy(rs.getInt("privacy"));
				TrgVO.setGenkiBar(rs.getInt("genkiBar"));
				TrgVO.setAchVO(achSvc.getOneAchmt(rs.getInt("achID")));
				TrgVO.setPriority(rs.getInt("priority"));
				TrgVO.setRemindTimes(rs.getInt("remindTimes"));
				TrgVO.setTrgType(rs.getInt("trgType"));
				TrgVO.setPunishment(rs.getInt("punishment"));
				TrgVO.setStatus(rs.getInt("status"));
				TrgVO.setTimeStart(rs.getDate("timeStart"));
				TrgVO.setTimeFinish(rs.getDate("timeFinish"));
				TrgVO.setDoneTime(rs.getDate("doneTime"));
				list.add(TrgVO);
				
				
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
	public int countNumsOfTargetName(String keyword) {

		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(COUNT_NUMS_OF_TARGET_NAME);
			
			pstmt.setString(1, keyword);
			rs = pstmt.executeQuery();
	
		
			if(rs.next()) {
				result = rs.getInt(1); 
				
					
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
		return result;
		
	}
	
	
	
	@Override
	public List<TargetVO> getAllChallengeNameFromUser(Integer userID) {

		List<TargetVO> list = new ArrayList<TargetVO>();
		TargetVO TrgVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SHOW_ALL_CHALLENGE_NAME_FROM_USER);	
			pstmt.setInt(1, userID);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TrgVO = new TargetVO();
				TrgVO.setTrgName(rs.getString("trgName"));
				list.add(TrgVO);
						
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
