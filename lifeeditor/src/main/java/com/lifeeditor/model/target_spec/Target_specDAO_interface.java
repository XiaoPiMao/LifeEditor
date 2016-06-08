package com.lifeeditor.model.target_spec;

import java.util.List;

public interface Target_specDAO_interface {
	public int insert_simple(Target_specVO target_specVO);
	public void delete(Integer userID);
    public Target_specVO findByPrimaryKey(Integer userID);
    public List<Target_specVO> getAll();
    public List<Target_specVO> getAllByHotMan();
	public void update(Target_specVO target_specVO);
	public	int insert_will_change_status(Target_specVO target_specVO);
    

}
