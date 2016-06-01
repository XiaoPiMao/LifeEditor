package com.lifeeditor.model.sec_list;

import java.util.List;



public interface SecListDAO_interface {
	public List<SecListVO> findByTypeListID(Integer id);
	public void insert(SecListVO SecListVO);
    public void update(SecListVO SecListVO);   
    public SecListVO findByPrimaryKey(Integer secID);
	
}
