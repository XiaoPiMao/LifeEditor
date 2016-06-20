package com.lifeeditor.model.comments;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lifeeditor.model.user_spec.user_specVO;
import com.lifeeditor.utility.GlobalValues;


@Transactional(readOnly = true)
public class commentsDAO implements commentsDAO_interface{
	
	private static final String GET_COMMENTNAME = "from commentsVO where targetID=?";
	private static final String GET_COMMENT_BY_USER= "SELECT v.targetID,v.userID,v.comment,u.firstName,u.lastName from user_spec u JOIN"+
														" (SELECT TOP 5 c.targetID,c.userID,c.comment FROM comments c"+
																" JOIN(SELECT targetID FROM target_list WHERE userID = ?)ut ON"+
																" c.targetID = ut.targetID"+
																" ORDER BY c.commentID DESC) v" +
															" ON u.userID = v.userID";
	
	private static final String GET_COMMENT_BY_TARGET = 
			 "SELECT u.userID,u.firstName,u.lastName,s.comment FROM user_spec u JOIN "+
			 "(SELECT userID,comment,commentID FROM comments WHERE targetID = ? ) s "+
			 "ON u.userID = s.userID ORDER BY s.commentID DESC";
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup(GlobalValues.DS_LOOKUP);
		} catch (NamingException ne) {
			ne.printStackTrace();
		}
	}

	
	private HibernateTemplate hibernateTemplate;    
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
        this.hibernateTemplate = hibernateTemplate;
    }

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(commentsVO commentsVO) {
		hibernateTemplate.saveOrUpdate(commentsVO);
		
	}
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(commentsVO commentsVO) {
		hibernateTemplate.saveOrUpdate(commentsVO);
		
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(commentsVO commentsVO) {
		hibernateTemplate.delete(commentsVO);
		
	}
	@Override
	public List<commentsVO> getCommentName(Integer targetID) {
		System.out.println(hibernateTemplate);
		List<commentsVO> list = null;
		list = hibernateTemplate.find(GET_COMMENTNAME, targetID);
		return list;
	}

	@Override
	public List<commentsVO> getCommentByUser(Integer userID) {
		Connection conn = null;
		List<commentsVO> list = new ArrayList<>();
		commentsVO comment = null;
		try {
			conn = ds.getConnection();
			PreparedStatement pstmt= conn.prepareStatement(GET_COMMENT_BY_USER);
			pstmt.setInt(1, userID);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				comment = new commentsVO();
				comment.setComment(rs.getString("comment"));
				comment.setTargetID(rs.getInt("targetID"));
				user_specVO user = new user_specVO();
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setUserID(rs.getInt("userID"));
				comment.setUser_specVO(user);
				list.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return list;
	}
	
	
	
	@Override
	public List<commentsVO> getCommentByTarget(Integer targetID) {
		Connection conn = null;
		List<commentsVO> list = new ArrayList<>();
		commentsVO comment = null;
		try {
			conn = ds.getConnection();
			PreparedStatement pstmt= conn.prepareStatement(GET_COMMENT_BY_TARGET);
			pstmt.setInt(1, targetID);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				comment = new commentsVO();
				comment.setComment(rs.getString("comment"));
				user_specVO user = new user_specVO();
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setUserID(rs.getInt("userID"));
				comment.setUser_specVO(user);
				list.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return list;
	}

	

}
