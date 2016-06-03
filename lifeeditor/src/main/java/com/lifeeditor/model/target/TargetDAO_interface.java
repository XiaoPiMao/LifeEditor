package com.lifeeditor.model.target;

import java.util.*;

public interface TargetDAO_interface {
	
	public void insert(TargetVO TrgVO);
	public void update(TargetVO TrgVO);
	public void delete(Integer targetID);
	public TargetVO findByPrimaryKey(Integer targetID);
	public List<TargetVO> getAll();
	public List<TargetVO> getAllofficial();
	public List<TargetVO> findByKeyword(String keyword);

}
