package com.lifeeditor.model.event;

import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;
public class eventVO implements java.io.Serializable{
    private Integer eventID;//資料庫產生的流水號
	private Integer typeID;//類別ID
	private Integer secID;//項目ID
	private	String eventName;//參考活動名稱
	private Blob eventPic;//與活動有關的照片
	private String orgName;//類別名稱
    private String orgAddr;//地址
    private java.sql.Timestamp eventTime;//時間
    private String eventDesc;//活動描述
 
	public Integer getTypeID() {
		return typeID;
	}
	public void setTypeID(Integer typeID) {
		this.typeID = typeID;
	}
	public Integer getSecID() {
		return secID;
	}
	public void setSecID(Integer secID) {
		this.secID = secID;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public Blob getEventPic() {
		return eventPic;
	}
	public void setEventPic(Blob eventPic) {
		this.eventPic = eventPic;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getOrgAddr() {
		return orgAddr;
	}
	public void setOrgAddr(String orgAddr) {
		this.orgAddr = orgAddr;
	}
	public Timestamp getEventTime( ) {
		return eventTime;
	}
	public void setEventTime( Timestamp eventTime ) {
		this.eventTime = eventTime;
	}
	public String getEventDesc() {
		return eventDesc;
	}
	public void setEventDesc(String eventDesc) {
		this.eventDesc = eventDesc;
	}
	public Integer getEventID() {
		return eventID;
	}
	public void setEventID(Integer eventID) {
		this.eventID = eventID;
	}

	
	
	
	
	
	
	
	
	
	
//	
	
	
	
}
