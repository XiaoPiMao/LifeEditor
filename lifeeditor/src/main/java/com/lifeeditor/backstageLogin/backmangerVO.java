package com.lifeeditor.backstageLogin;

import java.sql.Blob;

public class backmangerVO { //後台管理員VO
	
	private String account;
	private String pswd;
	private Blob picture;
	
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPswd() {
		return pswd;
	}
	public void setPswd(String pswd) {
		this.pswd = pswd;
	}
	public Blob getPicture() {
		return picture;
	}
	public void setPicture(Blob picture) {
		this.picture = picture;
	}
	
}
