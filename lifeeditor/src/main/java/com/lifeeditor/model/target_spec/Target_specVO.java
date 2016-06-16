package com.lifeeditor.model.target_spec;


import com.google.gson.annotations.Expose;
import com.lifeeditor.model.target.TargetVO;
import com.lifeeditor.model.user_spec.user_specVO;

public class Target_specVO implements java.io.Serializable{
	
	private Integer trgSpecID; 
	private user_specVO userVO;
	private TargetVO targetVO;
	private Integer UserID;
	private Integer TargetID;

	@Expose
	private String trgNote;
	private String trgPicPath;
	
	
	@Expose
	private String TrgPicPath;
	public Integer getTrgSpecID() {
		return trgSpecID;
	}
	public void setTrgSpecID(Integer trgSpecID) {
		this.trgSpecID = trgSpecID;
	}
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
		this.trgPicPath = trgPicPath;
	}
	public Integer getTargetID() {
		return TargetID;
	}
	public void setTargetID(Integer targetID) {
		TargetID = targetID;
	}
	public Integer getUserID() {
		return UserID;
	}
	public void setUserID(Integer userID) {
		UserID = userID;
	}

	
	
	
	
	
}
