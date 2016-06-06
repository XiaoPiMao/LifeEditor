package com.lifeeditor.service;

import java.util.List;

import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.model.target_list.Target_ListDAO_interface;
import com.lifeeditor.model.target_list.Target_ListHibernateDAO;
import com.lifeeditor.model.target_list.Target_ListVO;
import com.lifeeditor.model.user_spec.user_specVO;


public class Target_List_Service {

	private Target_ListDAO_interface dao;
	
	public Target_List_Service(){
		dao = new Target_ListHibernateDAO();
	}
	
	
	public Target_ListVO addTrgList(Integer userID, Integer targetID){
		
		Target_ListVO trg_listVO = new Target_ListVO();
		
		user_specVO user_specVO = new user_specVO();
		user_specVO.setUserID(userID);
		trg_listVO.setUserVO(user_specVO);
		
		TargetVO targetVO = new TargetVO();
		targetVO.setTargetID(targetID);
		trg_listVO.setTrgVO(targetVO);
		dao.insert(trg_listVO);
		return trg_listVO;
	}
	
	public void delete(Target_ListVO trg_listVO){
		dao.delete(trg_listVO);
	}
	
	public void delete(Integer targetID) {
		dao.delete(targetID);
	}
	
	public List<Target_ListVO> findByUserID(Integer userID) {
		return dao.findByUserID(userID);
	}
	
	public Target_ListVO findByTargetID(Integer targetID){
		return dao.findByTargetID(targetID);
	}
	
	public List<Target_ListVO> getAllByUser(){
		return dao.getAllByUser();
	}

	public List<Target_ListVO> getAllByTarget() {
		return dao.getAllByTarget();
	}
	
	public List<Target_ListVO> getAll() {
		return dao.getAll();
	}
	
}
