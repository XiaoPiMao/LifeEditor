package com.lifeeditor.target.model;

import java.util.*;

public interface TargetDAO_interface {
	
	public void insert(TargetVO TrgVO);
	public void update(TargetVO TrgVO);
	public void delete(Integer targetID);
	public TargetVO findByPrimaryKey(Integer targetID);
	public List<TargetVO> getAll();

}
