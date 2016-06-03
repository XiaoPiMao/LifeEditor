package com.lifeeditor.model.event;

import java.util.*;
import java.io.OutputStream;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lifeeditor.controller.event.*;

public  class eventDAO implements eventDAO_interface {

	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/LE01");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT =
		      "INSERT INTO event (typeID,secID,eventName,eventPic,orgName,orgAddr,eventTime,eventDesc) VALUES (?, ?, ?, ?, ?, ? , ?,?)";
	private static final String GET_ID_STMT="SELECT @@IDENTITY as 'ID'";
	private static final String GET_ALL_STMT =
		      "SELECT eventID,typeID,secID,eventName,eventPic,orgAddr,orgName,eventTime,eventDesc FROM event order by eventID";
	private static final String GET_ONE_STMT =
		      "SELECT eventID,typeID,secID,eventName,eventPic,orgAddr,orgName,eventTime,eventDesc FROM event where eventID = ?";
	private static final String DELETE =
		      "DELETE FROM event where eventID = ?";
	private static final String UPDATE =
		      "UPDATE event set typeID=?,secID=?,eventName=?, eventPic=?, orgAddr=?, orgName=?, eventTime=?, eventDesc=? where eventID = ?";
//	   ,[typeID]
//			      ,[secID]
//			      ,[eventName]
//			      ,[eventPic]
//			      ,[orgName]
//			      ,[orgAddr]
//			      ,[eventTime]
//			      ,[eventDesc]
	@Override
	public int insert(eventVO eventVO) {
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement idpstmt=null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
		
			pstmt.setInt(1, eventVO.getSecID());
			pstmt.setInt(2, eventVO.getTypeID());
			pstmt.setString(3, eventVO.getEventName());
			pstmt.setBlob(4, eventVO.getEventPic());
			pstmt.setString(5, eventVO.getOrgAddr());
			pstmt.setString(6, eventVO.getOrgName());
			pstmt.setDate(7, eventVO.getEventTime());
			pstmt.setString(8, eventVO.getEventDesc());
			
			pstmt.executeUpdate();
			idpstmt = con.prepareStatement(GET_ID_STMT);
			rs =idpstmt.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("ID");
				return id;
			}
		
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return 0;

	}

	
	@Override
	public void update(eventVO eventVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, eventVO.getTypeID());
			pstmt.setInt(2, eventVO.getSecID());
			pstmt.setString(3, eventVO.getEventName());
			pstmt.setBlob(4, eventVO.getEventPic());
			pstmt.setString(5, eventVO.getOrgAddr());
			pstmt.setString(6, eventVO.getOrgName());
			pstmt.setDate(7, eventVO.getEventTime());
			pstmt.setString(8, eventVO.getEventDesc());
			pstmt.setInt(9, eventVO.getEventID());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void delete(Integer eventID) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, eventID);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public eventVO findByPrimaryKey(Integer eventID) {

		eventVO eventVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, eventID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// eventVO 也稱為 Domain objects
				eventVO = new eventVO();
				eventVO.setEventID(rs.getInt("eventID"));
				eventVO.setTypeID(rs.getInt("typeID"));
				eventVO.setSecID(rs.getInt("secID"));
				eventVO.setEventName(rs.getString("eventName"));
				eventVO.setEventPic(rs.getBlob("eventPic"));
				eventVO.setOrgAddr(rs.getString("orgAddr"));
				eventVO.setOrgName(rs.getString("orgName"));
				eventVO.setEventTime(rs.getDate("eventTime"));
				eventVO.setEventDesc(rs.getString("eventDesc"));
				
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return eventVO;
	}

	@Override
	public List<eventVO> getAll() {
		List<eventVO> list = new ArrayList<eventVO>();
		eventVO eventVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// eventVO 也稱為 Domain objects
				eventVO = new eventVO();
				eventVO.setEventID(rs.getInt("eventID"));
				eventVO.setTypeID(rs.getInt("typeID"));
				eventVO.setSecID(rs.getInt("secID"));
				eventVO.setEventName(rs.getString("eventName"));
				eventVO.setEventPic( rs.getBlob("eventPic"));
				eventVO.setOrgAddr(rs.getString("orgAddr"));
			
				eventVO.setOrgName(rs.getString("orgName"));
				eventVO.setEventTime(rs.getDate("eventTime"));
				eventVO.setEventDesc(rs.getString("eventDesc"));
				list.add(eventVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}


	@Override
	public OutputStream readBlob() {
		// TODO Auto-generated method stub
		return null;
	}
}