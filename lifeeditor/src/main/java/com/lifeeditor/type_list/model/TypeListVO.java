package com.lifeeditor.type_list.model;

import java.sql.Blob;

public class TypeListVO {
	private Integer typeID;
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
