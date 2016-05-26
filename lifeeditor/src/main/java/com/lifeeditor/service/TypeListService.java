package com.lifeeditor.service;

import java.util.List;

import com.lifeeditor.type_list.model.*;

public class TypeListService {
	private TypeListDAO_interface dao = null;
	public TypeListService() {
		this.dao = new TypeListJNDIDAO();
	}
	
	public List<TypeListVO> getAll() {
		return dao.getAll();
	}
}
