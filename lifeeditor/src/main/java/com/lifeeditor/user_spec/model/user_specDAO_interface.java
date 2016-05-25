package com.lifeeditor.user_spec.model;

import java.util.List;

public interface user_specDAO_interface {
	public void insert(user_specVO user_specVO);
    public void update(user_specVO user_specVO);   
    public user_specVO findByPrimaryKey(Integer user_specID);
    public List<user_specVO> getAll();
    public List<user_specVO> getAllByHotMan();

}
