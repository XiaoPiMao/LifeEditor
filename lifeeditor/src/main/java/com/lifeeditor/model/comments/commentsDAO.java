package com.lifeeditor.model.comments;

import java.io.Serializable;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;









@Transactional(readOnly = true)
public class commentsDAO implements commentsDAO_interface{
	
	private static final String GET_COMMENTNAME = "from commentsVO where targetID=?";
	
	

	
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

	

}
