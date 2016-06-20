package com.lifeeditor.model.sec_list;

import java.sql.Blob;

import com.google.gson.annotations.Expose;

public class SecListVO {
	@Expose
	private Integer secID;
	@Expose
	private Integer typeID;
	@Expose
	private String secName;
	private Blob secPic;
	public Integer getSecID() {
		return secID;
	}
	public void setSecID(Integer secID) {
		this.secID = secID;
	}
	public Integer getTypeID() {
		return typeID;
	}
	public void setTypeID(Integer typeID) {
		this.typeID = typeID;
	}
	public String getSecName() {
		return secName;
	}
	public void setSecName(String secName) {
		this.secName = secName;
	}
	public Blob getSecPic() {
		return secPic;
	}
	public void setSecPic(Blob secPic) {
		this.secPic = secPic;
	}
	
	
}
