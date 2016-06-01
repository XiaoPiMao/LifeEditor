package com.lifeeditor.service;

import java.sql.Blob;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lifeeditor.model.sec_list.*;
import com.lifeeditor.model.type_list.TypeListDAO_interface;
import com.lifeeditor.model.type_list.TypeListVO;

public class SecListService {
	private SecListDAO_interface dao;

	public SecListService() {
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config2-JndiObjectFactoryBean.xml");
		dao =(SecListDAO_interface) context.getBean("SecListJNDIDAO");
		
	}
public SecListVO addSec(Integer typeID,String secName,Blob secPic) {
		
		SecListVO SecListVO = new SecListVO();
		
		SecListVO.setTypeID(typeID);
		SecListVO.setSecName(secName);
		SecListVO.setSecPic(secPic);

		dao.insert(SecListVO);

		return SecListVO;
	}
	public SecListVO updateSec(Integer secID,Integer typeID,String secName,Blob secPic) {
		
		SecListVO SecListVO = new SecListVO();
		
		SecListVO.setSecID(secID);
		SecListVO.setTypeID(typeID);
		SecListVO.setSecName(secName);
		SecListVO.setSecPic(secPic);

		dao.update(SecListVO);

		return SecListVO;
    }
	public SecListVO getOneUser(Integer secID) {
		return dao.findByPrimaryKey(secID);
	}
	
	
	public List<SecListVO> getByTypeID(Integer id) {
		return dao.findByTypeListID(id);
	}
}
