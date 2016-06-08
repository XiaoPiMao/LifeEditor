package com.lifeeditor.service;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.List;

import com.lifeeditor.model.event.eventVO;
import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.model.target_spec.*;
import com.lifeeditor.model.user_spec.user_specVO;

public class TargetSpecService {
	private Target_specDAO_interface dao = null;
	
	public TargetSpecService() {
		this.dao = new Target_specJDBCDAO();
	}
	
	public List<Target_specVO> getAll() {
		return dao.getAll();
	}
	
//	public void insert(Target_specVO target_specVO);
//	public void update(Target_specVO target_specVO);
	public Target_specVO addTargetSpec(Integer userID, Integer targetID, String userTarget_desc, String trgPicPath ) {

		Target_specVO Target_specVO= new Target_specVO();
		Target_specVO.getTargetVO().setTargetID(targetID);
		Target_specVO.getUserVO().setUserID(userID);
		
		Target_specVO.setTrgPicPath(userTarget_desc);
		Target_specVO.setTrgPicPath(trgPicPath);
		Target_specVO.getTargetVO().setTargetID(dao.insert_simple(Target_specVO));
				

		return Target_specVO;
	}

	public Target_specVO updateTargetSpec(Integer Target_specID,String userTarget_desc, String trgPicPath) {

		Target_specVO Target_specVO= new Target_specVO();
		Target_specVO.setTarget_specID(Target_specID);
		Target_specVO.getTargetVO().setTargetID(Target_specVO.getTargetVO().getTargetID());
		Target_specVO.getUserVO().setUserID(Target_specVO.getUserVO().getUserID());
		Target_specVO.setTrgPicPath(userTarget_desc);
		Target_specVO.setTrgPicPath(trgPicPath);
		dao.update(Target_specVO);
		return dao.findByPrimaryKey(Target_specID);
	}

	public List<Target_specVO> getAllByHotMan() {
		return dao.getAllByHotMan();
	}

	public int delete(Integer userID) {
		return userID;
	}
	public Target_specVO findByPrimaryKey(Integer userID) {
		return dao.findByPrimaryKey(userID);
	}
	public Target_specVO addTargetSpec_changeStatus(Integer userID, Integer targetID, String userTarget_desc, String trgPicPath ) {

		Target_specVO Target_specVO= new Target_specVO();
		Target_specVO.getTargetVO().setTargetID(targetID);
		Target_specVO.getUserVO().setUserID(userID);
		
		Target_specVO.setTrgPicPath(userTarget_desc);
		Target_specVO.setTrgPicPath(trgPicPath);
		Target_specVO.getTargetVO().setTargetID(dao.insert_simple(Target_specVO));
				

		return Target_specVO;
	}
}
