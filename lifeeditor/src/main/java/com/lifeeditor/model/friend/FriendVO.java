package com.lifeeditor.model.friend;

import java.sql.Date;

import com.lifeeditor.model.user_spec.user_specVO;

public class FriendVO {
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
