package com.lifeeditor.model.ach_list;

import java.util.List;

import com.lifeeditor.model.user_spec.user_specVO;



public interface ach_list_interface {
	public void insert(ach_listVO ach_listVO);
    public void delete(Integer ach_listID);
    public List<ach_listVO> getAchName(Integer userID);
    

}
