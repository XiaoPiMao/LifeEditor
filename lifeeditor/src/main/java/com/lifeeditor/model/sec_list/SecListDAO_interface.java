package com.lifeeditor.model.sec_list;

import java.util.List;

public interface SecListDAO_interface {
	public List<SecListVO> findByTypeListID(Integer id);
}
