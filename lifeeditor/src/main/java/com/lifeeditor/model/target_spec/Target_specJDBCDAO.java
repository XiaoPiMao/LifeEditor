package com.lifeeditor.model.target_spec;

import java.util.*;
import java.sql.*;

import com.lifeeditor.utility.GlobalValues;
 
public class Target_specJDBCDAO implements Target_specDAO_interface {

	private static final String INSERT_STMT =
		      "INSERT INTO target_spec (userID,targetID,trgNote,trgPicPath) VALUES (?, ?, ?, ?)";
	private static final String GET_ALL_STMT =
		      "SELECT userID,targetID,trgNote,trgPicPath FROM target_spec order by userID";
	private static final String GET_ONE_STMT =
		      "SELECT userID,targetID,trgNote,trgPicPath FROM target_spec where userID=?";
	private static final String GET_ALLHOTMANS_STMT =
		      "SELECT target_spec.trgNote, target_spec.trgPicPath " +
                     "FROM target_spec INNER JOIN " +
                            "user_spec ON target_spec.userID = user_spec.userID " +
							"WHERE hotman=1 ";
	private static final String DELETE =
		      "DELETE FROM target_spec where userID = ?";

	@Override
	public void insert(Target_specVO target_specVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(GlobalValues.SQL_URL,GlobalValues.SQL_USER,GlobalValues.SQL_PWD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, target_specVO.getTargetID());
			pstmt.setString(2, target_specVO.getTrgNote());
			pstmt.setString(3, target_specVO.getTrgPicPath());
			
			pstmt.executeUpdate();
		}catch (SQLException se) {
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
	public void delete(Integer userID) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(GlobalValues.SQL_URL,GlobalValues.SQL_USER,GlobalValues.SQL_PWD);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, userID);

			pstmt.executeUpdate();

			// Handle any driver errors
		}catch (SQLException se) {
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
	public Target_specVO findByPrimaryKey(Integer userID) {

		Target_specVO target_specVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(GlobalValues.SQL_URL,GlobalValues.SQL_USER,GlobalValues.SQL_PWD);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, userID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				target_specVO = new Target_specVO();
				target_specVO.setUserID(rs.getInt("userID"));
				target_specVO.setUserID(rs.getInt("targetID"));
				target_specVO.setTrgNote(rs.getString("trgNote"));
				target_specVO.setTrgPicPath(rs.getString("trgPicPath"));
			}
		}  catch (SQLException se) {
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
		return target_specVO;
	}

	@Override
	public List<Target_specVO> getAll() {
		List<Target_specVO> list = new ArrayList<Target_specVO>();
		Target_specVO target_specVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(GlobalValues.SQL_URL,GlobalValues.SQL_USER,GlobalValues.SQL_PWD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				target_specVO = new Target_specVO();
				target_specVO.setUserID(rs.getInt("userID"));
				target_specVO.setTargetID(rs.getInt("targetID"));
				target_specVO.setTrgNote(rs.getString("trgNote"));
				target_specVO.setTrgPicPath(rs.getString("trgPicPath"));
				list.add(target_specVO); // Store the row in the list
			}
		}  catch (SQLException se) {
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
	public List<Target_specVO> getAllByHotMan() {
		List<Target_specVO> list = new ArrayList<Target_specVO>();
		Target_specVO target_specVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(GlobalValues.SQL_URL,GlobalValues.SQL_USER,GlobalValues.SQL_PWD);
			pstmt = con.prepareStatement(GET_ALLHOTMANS_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				target_specVO = new Target_specVO();
				target_specVO.setTrgNote(rs.getString("trgNote"));
				target_specVO.setTrgPicPath(rs.getString("trgPicPath"));
				list.add(target_specVO); // Store the row in the list
			}
		}  catch (SQLException se) {
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
//
	public static void main(String[] args) {

		Target_specJDBCDAO dao = new Target_specJDBCDAO();
//
//		// INSERT
//		Target_specVO target_specVO1 = new Target_specVO();
//		target_specVO1.setEname("�d�ç�1");
//		target_specVO1.setJob("MANAGER");
//		target_specVO1.setHiredate(java.sql.Date.valueOf("2005-01-01"));
//		target_specVO1.setSal(new Double(50000));
//
//		dao.insert(target_specVO1);

//		// Delete
//		dao.delete(7014);
//
//		// �d��
//		EmpVO empVO3 = dao.findByPrimaryKey(7001);
//		System.out.print(empVO3.getEmpno() + ",");
//		System.out.print(empVO3.getEname() + ",");
//		System.out.print(empVO3.getJob() + ",");
//		System.out.print(empVO3.getHiredate() + ",");
//		System.out.print(empVO3.getSal() + ",");
//		System.out.print(empVO3.getComm() + ",");
//		System.out.println(empVO3.getDeptno());
//		System.out.println("---------------------");
//
		List<Target_specVO> list = dao.getAll();
		for (Target_specVO aEmp : list) {
			System.out.print(aEmp.getUserID() + ",");
			System.out.print(aEmp.getTargetID() + ",");
			System.out.print(aEmp.getTrgNote() + ",");
			System.out.print(aEmp.getTrgPicPath() + ",");
			System.out.println();
			
		}
		
		List<Target_specVO> list1 = dao.getAllByHotMan();
		for (Target_specVO aEmp : list1) {
			System.out.print(aEmp.getTrgNote() + ",");
			System.out.print(aEmp.getTrgPicPath() + ",");
			System.out.println();
			
		}
	}

}