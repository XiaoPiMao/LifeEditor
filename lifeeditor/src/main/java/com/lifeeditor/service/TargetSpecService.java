package com.lifeeditor.service;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lifeeditor.model.sec_list.SecListDAO_interface;
import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.model.target_spec.*;
import com.lifeeditor.model.user_spec.user_specVO;

public class TargetSpecService {
	private Target_specDAO_interface dao = null;
	
	public TargetSpecService() {
			ApplicationContext context = new ClassPathXmlApplicationContext("model-config2-JndiObjectFactoryBean.xml");
			dao =(Target_specJDBCDAO) context.getBean("Target_specJDBCDAO");
	}
	
	public Target_specVO getOneTrgSpec(Integer TargetID) {
		return dao.findByTargetID(TargetID);
	}
	
	public List<Target_specVO> getAll() {
		return dao.getAll();
	}
	
	public List<Target_specVO> getAllByHotMan() {
		return dao.getAllByHotMan();
	}
	
	public List<Target_specVO> getByUser(Integer userID) {
		return dao.findByUser(userID);
	}
}
