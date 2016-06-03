package com.lifeeditor.service;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lifeeditor.model.type_list.*;
import com.lifeeditor.model.user_spec.user_specVO;


public class TypeListService {
	private TypeListDAO_interface dao;

	public TypeListService() {
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config2-JndiObjectFactoryBean.xml");
		dao =(TypeListDAO_interface) context.getBean("TypeListJNDIDAO");
	}
	public TypeListVO addType(String typeName,Blob typePic) {
		
		TypeListVO TypeListVO = new TypeListVO();
		
		TypeListVO.setTypeName(typeName);
		TypeListVO.setTypePic(typePic);

		dao.insert(TypeListVO);

		return TypeListVO;
	}
	public TypeListVO updateType(Integer typeID,String typeName,Blob typePic) {
		
		TypeListVO TypeListVO = new TypeListVO();
		
		TypeListVO.setTypeID(typeID);
		TypeListVO.setTypeName(typeName);
		TypeListVO.setTypePic(typePic);

		dao.update(TypeListVO);

		return TypeListVO;
    }
	public TypeListVO getOneUser(Integer typeID) {
		return dao.findByPrimaryKey(typeID);
	}
	public List<TypeListVO> getAll() {
		return dao.getAll();
	}
}
