package com.lifeeditor.model.target_list;

import java.util.List;

import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.model.user_spec.user_specVO;

public interface Target_ListDAO_interface {
	
	public void insert (Target_ListVO trg_listVO);
	public void delete(Target_ListVO trg_listVO);
	public void delete(Integer targetID);
	public List<Target_ListVO> findByUserID(Integer userID);
	public Target_ListVO findByTargetID(Integer targetID);
	public List<Target_ListVO> getAllByUser();
	public List<Target_ListVO> getAllByTarget();
	public List<Target_ListVO> getAll();

}
