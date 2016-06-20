package com.lifeeditor.model.genkiBar_list;

import java.util.List;

import com.lifeeditor.model.user_spec.user_specVO;



public interface genkiBar_listDAO_interface {
	public void insert(genkiBar_listVO genkiBar_listVO);
    public void delete(Integer genkiBarID);
    public List<genkiBar_listVO> getGenkiName(Integer targetID);
    public List<genkiBar_listVO> haveGenki(Integer localID,Integer trgID);
    public List<user_specVO>whoGenki(Integer targetID);
    public void delete(Integer targetID,Integer userID);
}
