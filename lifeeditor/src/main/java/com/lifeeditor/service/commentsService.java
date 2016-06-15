package com.lifeeditor.service;

import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;






import com.lifeeditor.model.comments.commentsDAO_interface;
import com.lifeeditor.model.comments.commentsVO;
import com.lifeeditor.model.genkiBar_list.genkiBar_listDAO_interface;
import com.lifeeditor.model.genkiBar_list.genkiBar_listVO;
import com.lifeeditor.model.user_spec.user_specVO;

public class commentsService {

	private commentsDAO_interface dao;

	public commentsService() {
		//dao = new EmpHibernateDAO();
		//��1: ���Mmodel-config1-DriverManagerDataSource.xml�]�i�H��
		//��2: �����F�ϥ�Apache DBCP�s�u��,�H�����į�,�ҥH���U��model-config2-JndiObjectFactoryBean.xml����dataSource�]�w�O�ĥ�org.springframework.jndi.JndiObjectFactoryBean
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config2-JndiObjectFactoryBean.xml");
		dao =(commentsDAO_interface) context.getBean("commentsDAO");
	}

	public commentsVO addComment(Integer targetID,Integer userID,String comment) {
		
		commentsVO commentsVO = new commentsVO();
		commentsVO.setTargetID(targetID);
		user_specVO user_specVO = new user_specVO();
		user_specVO.setUserID(userID);
		commentsVO.setUser_specVO(user_specVO);
		commentsVO.setComment(comment);

		dao.insert(commentsVO);

		return commentsVO;
	}

	public void edComment(Integer commentID,Integer targetID,Integer userID,String comment) {
		commentsVO commentsVO = new commentsVO();
		commentsVO.setCommentID(commentID);
		commentsVO.setTargetID(targetID);
		user_specVO user_specVO = new user_specVO();
		user_specVO.setUserID(userID);
		commentsVO.setUser_specVO(user_specVO);
		commentsVO.setComment(comment);

		dao.update(commentsVO);
	}
	public void deComment(Integer targetID,Integer userID){
		commentsVO commentsVO = new commentsVO();
		commentsVO.setTargetID(targetID);
		user_specVO user_specVO = new user_specVO();
		user_specVO.setUserID(userID);
		commentsVO.setUser_specVO(user_specVO);

		dao.delete(commentsVO);
	}

	public List<commentsVO> getCommentName(Integer targetID) {
		return dao.getCommentName(targetID);
	}
	
	public List<commentsVO> getCommentByUser(Integer userID) {
		return dao.getCommentByUser(userID);
	}
}
