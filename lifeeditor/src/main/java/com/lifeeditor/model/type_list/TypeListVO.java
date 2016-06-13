package com.lifeeditor.model.type_list;

import java.sql.Blob;

import com.google.gson.annotations.Expose;

public class TypeListVO {
	@Expose
	private Integer typeID;
	@Expose
	private String typeName ;
	private Blob typePic;
	public Integer getTypeID() {
		return typeID;
	}
	public void setTypeID(Integer typeID) {
		this.typeID = typeID;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public Blob getTypePic() {
		return typePic;
	}
	public void setTypePic(Blob typePic) {
		this.typePic = typePic;
	}
}
