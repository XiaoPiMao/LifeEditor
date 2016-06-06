package com.lifeeditor.model.target_list;

import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.model.user_spec.user_specVO;

public class Target_ListVO implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private user_specVO userVO;
	private TargetVO trgVO;
	
	
	public user_specVO getUserVO() {
		return userVO;
	}
	public void setUserVO(user_specVO userVO) {
		this.userVO = userVO;
	}
	public TargetVO getTrgVO() {
		return trgVO;
	}
	public void setTrgVO(TargetVO trgVO) {
		this.trgVO = trgVO;
	}

	
}
