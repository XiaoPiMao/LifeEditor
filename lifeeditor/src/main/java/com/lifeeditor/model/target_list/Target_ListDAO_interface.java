package com.lifeeditor.model.target_list;

public interface Target_ListDAO_interface {
	
	public Target_ListVO findByUserID(Integer userVO);
	public Target_ListVO findByTargetID(Integer trgVO);

}
