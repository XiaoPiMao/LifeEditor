package com.lifeeditor.model.target_spec;

import java.util.List;

public interface Target_specDAO_interface {
	public void insert(Target_specVO target_specVO);
	public void delete(Integer userID);
    public Target_specVO findByPrimaryKey(Integer userID);
    public List<Target_specVO> getAll();
    public List<Target_specVO> getAllByHotMan();
    

}
