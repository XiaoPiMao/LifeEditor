package com.lifeeditor.model.user_spec;

import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;

public class user_specVO implements java.io.Serializable{
	private Integer userID;
	private String account;
	private String pswd;
	private String lastName;
	private String firstName;
	private String gender;
	private Date birthdate;
	private String email;
	private String address;
	private String phone;
	private Integer genkiBarTol;
	private Integer level;
	private Blob picture;
	private Timestamp regTime;
	private Integer hotMan;
	private Integer suspendType;
	
	public Integer getUserID() {
		return userID;
	}
	public void setUserID(Integer userID) {
		this.userID = userID;
	}
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
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getGenkiBarTol() {
		return genkiBarTol;
	}
	public void setGenkiBarTol(Integer genkiBarTol) {
		this.genkiBarTol = genkiBarTol;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public Blob getPicture() {
		return picture;
	}
	public void setPicture(Blob picture) {
		this.picture = picture;
	}
	public Timestamp getRegTime() {
		return regTime;
	}
	public void setRegTime(Timestamp regTime) {
		this.regTime = regTime;
	}
	public Integer getHotMan() {
		return hotMan;
	}
	public void setHotMan(Integer hotMan) {
		this.hotMan = hotMan;
	}
	public Integer getSuspendType() {
		return suspendType;
	}
	public void setSuspendType(Integer suspendType) {
		this.suspendType = suspendType;
	}	
}
