package com.lifeeditor.invite_list;

import java.sql.Date;

public class myFriendVO {
	private Integer userID;
	private Integer friendID;
	private Date frdSince;
	public Integer getUserID() {
		return userID;
	}
	public void setUserID(Integer userID) {
		this.userID = userID;
	}
	public Integer getFriendID() {
		return friendID;
	}
	public void setFriendID(Integer friendID) {
		this.friendID = friendID;
	}
	public Date getFrdSince() {
		return frdSince;
	}
	public void setFrdSince(Date frdSince) {
		this.frdSince = frdSince;
	}
	
}
