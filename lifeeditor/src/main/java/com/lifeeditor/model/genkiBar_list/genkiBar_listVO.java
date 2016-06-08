package com.lifeeditor.model.genkiBar_list;
import com.lifeeditor.model.user_spec.*;


public class genkiBar_listVO implements java.io.Serializable{
	private Integer genkiBarID;
	private Integer targetID;
	private user_specVO user_specVO;
	public Integer getGenkiBarID() {
		return genkiBarID;
	}
	public void setGenkiBarID(Integer genkiBarID) {
		this.genkiBarID = genkiBarID;
	}
	public Integer getTargetID() {
		return targetID;
	}
	public void setTargetID(Integer targetID) {
		this.targetID = targetID;
	}
	public user_specVO getUser_specVO() {
		return user_specVO;
	}
	public void setUser_specVO(user_specVO user_specVO) {
		this.user_specVO = user_specVO;
	}

	
}	