package com.lifeeditor.service;

import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;





import com.lifeeditor.model.genkiBar_list.genkiBar_listDAO_interface;
import com.lifeeditor.model.genkiBar_list.genkiBar_listVO;
import com.lifeeditor.model.user_spec.user_specVO;

public class genkiBar_listService {

	private genkiBar_listDAO_interface dao;

	public genkiBar_listService() {
		//dao = new EmpHibernateDAO();
		//��1: ���Mmodel-config1-DriverManagerDataSource.xml�]�i�H��
		//��2: �����F�ϥ�Apache DBCP�s�u��,�H�����į�,�ҥH���U��model-config2-JndiObjectFactoryBean.xml����dataSource�]�w�O�ĥ�org.springframework.jndi.JndiObjectFactoryBean
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config2-JndiObjectFactoryBean.xml");
		dao =(genkiBar_listDAO_interface) context.getBean("genkiBar_listDAO");
	}

	public genkiBar_listVO genki(Integer targetID,Integer userID) {
		
		genkiBar_listVO genkiBar_listVO = new genkiBar_listVO();
		genkiBar_listVO.setTargetID(targetID);
		user_specVO user_specVO = new user_specVO();
		user_specVO.setUserID(userID);
		genkiBar_listVO.setUser_specVO(user_specVO);

		dao.insert(genkiBar_listVO);

		return genkiBar_listVO;
	}

	public void degenki(Integer genkiBarID) {
		
		dao.delete(genkiBarID);
	}
	
	
	public void degenki(Integer targetID,Integer userID) {
		dao.delete(targetID, userID);
	}

	public List<genkiBar_listVO> getGenkiName(Integer targetID) {
		return dao.getGenkiName(targetID);
	}
	
	public List<genkiBar_listVO> haveGenki(Integer localID,Integer trgID) {
		return dao.haveGenki(localID, trgID);
	}
	
	public List<user_specVO> whoGenki(Integer targetID) {
		return dao.whoGenki(targetID);
	}
}
