package com.lifeeditor.sec_list.model;

import java.util.List;

public interface SecListDAO_interface {
	public List<SecListVO> findByTypeListID(Integer id);
}
