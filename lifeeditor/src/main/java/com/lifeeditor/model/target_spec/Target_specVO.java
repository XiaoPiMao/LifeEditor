package com.lifeeditor.model.target_spec;


import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.model.user_spec.user_specVO;

public class Target_specVO implements java.io.Serializable{
	private user_specVO userVO;
	private TargetVO targetVO;
	private String trgNote;
	private String trgPicPath;
	private Integer target_specID;
	
	public user_specVO getUserVO() {
		return userVO;
	}
	public void setUserVO(user_specVO userVO) {
		this.userVO = userVO;
	}
	public TargetVO getTargetVO() {
		return targetVO;
	}
	public void setTargetVO(TargetVO targetVO) {
		this.targetVO = targetVO;
	}
	public String getTrgNote() {
		return trgNote;
	}
	public void setTrgNote(String trgNote) {
		this.trgNote = trgNote;
	}
	public String getTrgPicPath() {
		return trgPicPath;
	}
	public void setTrgPicPath(String trgPicPath) {
		trgPicPath = trgPicPath;
	}
	public Integer getTarget_specID() {
		return target_specID;
	}
	public void setTarget_specID(Integer target_specID) {
		this.target_specID = target_specID;
	}

	
	
	
}
