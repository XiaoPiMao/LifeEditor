package com.lifeeditor.service;

import java.util.List;

import com.lifeeditor.model.target_spec.*;

public class TargetSpecService {
	private Target_specDAO_interface dao = null;
	
	public TargetSpecService() {
		this.dao = new Target_specJDBCDAO();
	}
	
	public List<Target_specVO> getAll() {
		return dao.getAll();
	}
	
	public List<Target_specVO> getAllByHotMan() {
		return dao.getAllByHotMan();
	}
}
