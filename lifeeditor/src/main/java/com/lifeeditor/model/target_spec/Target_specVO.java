package com.lifeeditor.model.target_spec;

import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;

public class Target_specVO implements java.io.Serializable{
	private Integer userID;
	private Integer targetID;
	private String trgNote;
	private String TrgPicPath;
	
	public Integer getUserID() {
		return userID;
	}
	public void setUserID(Integer userID) {
		this.userID = userID;
	}
	public Integer getTargetID() {
		return targetID;
	}
	public void setTargetID(Integer targetID) {
		this.targetID = targetID;
	}
	public String getTrgNote() {
		return trgNote;
	}
	public void setTrgNote(String trgNote) {
		this.trgNote = trgNote;
	}
	public String getTrgPicPath() {
		return TrgPicPath;
	}
	public void setTrgPicPath(String trgPicPath) {
		TrgPicPath = trgPicPath;
	}

	
	
	
}
