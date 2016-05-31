package com.lifeeditor.service;

import java.util.List;

import com.lifeeditor.model.sec_list.*;

public class SecListService {
	private SecListDAO_interface dao = null;
	public SecListService() {
		this.dao = new SecListJNDIDAO();
	}
	
	public List<SecListVO> getByTypeID(Integer id) {
		return dao.findByTypeListID(id);
	}
}
