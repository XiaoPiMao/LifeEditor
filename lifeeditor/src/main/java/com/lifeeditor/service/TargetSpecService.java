package com.lifeeditor.service;

import java.util.List;

import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.model.target_spec.*;
import com.lifeeditor.model.user_spec.user_specVO;

public class TargetSpecService {
	private Target_specDAO_interface dao = null;
	
	public TargetSpecService() {
		this.dao = new Target_specJDBCDAO();
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
}
