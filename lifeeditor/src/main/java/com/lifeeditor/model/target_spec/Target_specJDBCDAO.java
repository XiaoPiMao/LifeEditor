package com.lifeeditor.model.target_spec;

import java.util.*;
import java.sql.*;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.model.type_list.TypeListDAO_interface;
import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.service.TargetService;
import com.lifeeditor.service.user_specService;
import com.lifeeditor.utility.GlobalValues;
 
public class Target_specJDBCDAO implements Target_specDAO_interface {

	private static final String INSERT_STMT =
		      "INSERT INTO target_spec (userID,targetID,trgNote,trgPicPath) VALUES (?, ?, ?, ?)";
	private static final String GET_ALL_STMT =
		      "SELECT userID,targetID,trgNote,trgPicPath FROM target_spec order by userID";
	private static final String GET_ONE_STMT =
		      "SELECT userID,targetID,trgNote,trgPicPath FROM target_spec where userID=?";
	private static final String GET_ALLHOTMANS_STMT =
		      "SELECT target.doneTime,target.trgName, target_spec.userID, target_spec.trgNote, target_spec.trgPicPath, user_spec.lastName,user_spec.firstName " +
                     "FROM target INNER JOIN " +
                            "target_spec ON target.targetID = target_spec.targetID INNER JOIN " +
                            "user_spec ON target_spec.userID = user_spec.userID " +
							"WHERE hotman=1 ";
	
	private static final String DELETE =
		      "DELETE FROM target_spec where userID = ?";

	private static final String GET_ALL_TargetID = "from Target_spec  order by Target_specID";
	
	private HibernateTemplate hibernateTemplate;    
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
        this.hibernateTemplate = hibernateTemplate;
    }
	
	
	
	@Override
	public void insert(Target_specVO target_specVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(GlobalValues.SQL_URL,GlobalValues.SQL_USER,GlobalValues.SQL_PWD);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1,target_specVO.getUserVO().getUserID());
			pstmt.setInt(2, target_specVO.getTargetVO().getTargetID());
			pstmt.setString(3, target_specVO.getTrgNote());
			pstmt.setString(4, target_specVO.getTrgPicPath());
			
			
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
				user_specService userSvc = new user_specService();
				target_specVO.setUserVO(userSvc.getOneUser(rs.getInt("userID")));
				TargetService trgSvc = new TargetService();
				target_specVO.setTargetVO(trgSvc.getOneTrg(rs.getInt("targetID")));
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
				user_specService userSvc = new user_specService();
				target_specVO.setUserVO(userSvc.getOneUser(rs.getInt("userID")));
				TargetService trgSvc = new TargetService();
				target_specVO.setTargetVO(trgSvc.getOneTrg(rs.getInt("targetID")));
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
	
	
	/* (non-Javadoc)
	 * @see com.lifeeditor.model.target_spec.Target_specDAO_interface#getAllByHotMan()
	 */
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
				user_specVO user = new user_specVO();
				user.setUserID(rs.getInt("userID"));
				user.setLastName(rs.getString("lastName"));
				user.setFirstName(rs.getString("firstName"));
				target_specVO.setUserVO(user);
				TargetVO trg = new TargetVO();
				trg.setTrgName(rs.getString("trgName"));
				trg.setDoneTime(rs.getDate("doneTime"));
				target_specVO.setTargetVO(trg);
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
	public Target_specVO findByTargetID(Integer TargetID) {
		
		Target_specVO vo =  new Target_specVO();
		vo =	(Target_specVO) hibernateTemplate.find("from Target_specVO t where t.targetVO.targetID = ?", TargetID).get(0);
		//System.out.println("findByTargetID :" + vo.getTrgPicPath());
		return vo;
	}
	@Override   
	public List<Target_specVO> getNote(Integer userID, Integer targetID) {
		List<Target_specVO> list = null;
		list = hibernateTemplate.find("from Target_specVO t where t.targetVO.targetID = ? and t.userVO.userID = ?",targetID ,userID);
		return list;
	}
	
	
//
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config1-DriverManagerDataSource.xml");
		Target_specJDBCDAO dao = (Target_specJDBCDAO )context.getBean("Target_specJDBCDAO");
//		Target_specJDBCDAO dao= new Target_specJDBCDAO();
		 Target_specVO zz=dao.findByTargetID(25); 
		 System.out.println("zzzzzzzzzzzzzz=============="+zz);
		
		
//		Target_specJDBCDAO dao = new Target_specJDBCDAO();
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
////
//		List<Target_specVO> list = dao.getAll();
//		for (Target_specVO aEmp : list) {
//			
//			System.out.print(aEmp.getTargetVO() + ",");
//			System.out.print(aEmp.getTrgNote() + ",");
//			System.out.print(aEmp.getTrgPicPath() + ",");
//			System.out.println();
//			
//		}
//		
//		List<Target_specVO> list1 = dao.getAllByHotMan();
//		for (Target_specVO aEmp : list1) {
//			System.out.print(aEmp.getTrgNote() + ",");
//			System.out.print(aEmp.getTrgPicPath() + ",");
//			System.out.println();
//			
//		}
//		 System.out.println(dao.findByTargetID(25).getTrgSpecID());
//		 System.out.println(dao.findByTargetID(25));
	}



	

	
	  






}