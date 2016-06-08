package com.lifeeditor.service;

import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;







import com.lifeeditor.model.ach_list.ach_listVO;
import com.lifeeditor.model.ach_list.ach_list_interface;
import com.lifeeditor.model.achievement.AchievementVO;
import com.lifeeditor.model.genkiBar_list.genkiBar_listDAO_interface;
import com.lifeeditor.model.genkiBar_list.genkiBar_listVO;
import com.lifeeditor.model.user_spec.user_specVO;

public class ach_listService {

	private ach_list_interface dao;

	public ach_listService() {
		//dao = new EmpHibernateDAO();
		//��1: ���Mmodel-config1-DriverManagerDataSource.xml�]�i�H��
		//��2: �����F�ϥ�Apache DBCP�s�u��,�H�����į�,�ҥH���U��model-config2-JndiObjectFactoryBean.xml����dataSource�]�w�O�ĥ�org.springframework.jndi.JndiObjectFactoryBean
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config2-JndiObjectFactoryBean.xml");
		dao =(ach_list_interface) context.getBean("ach_listDAO");
	}

	public ach_listVO addAchList(Integer userID,Integer achID) {
		
		ach_listVO ach_listVO = new ach_listVO();
		
		user_specVO user_specVO = new user_specVO();
		user_specVO.setUserID(userID);
		ach_listVO.setUser_specVO(user_specVO);
        AchievementVO  AchievementVO = new AchievementVO();
        AchievementVO.setAchID(achID);
        ach_listVO.setAchievementVO(AchievementVO);
		
		dao.insert(ach_listVO);

		return ach_listVO;
	}

	public void deAchList(Integer ach_listID) {
		
		dao.delete(ach_listID);
	}

	public List<ach_listVO> getAchName(Integer userID) {
		return dao.getAchName(userID);
	}
}
