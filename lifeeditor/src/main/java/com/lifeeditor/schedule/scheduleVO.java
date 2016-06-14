package com.lifeeditor.schedule;

import java.sql.Date;

public class scheduleVO {
	
	private Integer targetListID;
	private Integer userID;
	private String name;
	private String targerName;
	private Integer typeID;
	private String typeName;
	private Integer sectionID;
	private String secName;
	private Integer difficulty;
	private String intention;
	private Integer privacy;
	private Integer priority;
	private Integer remindTimes;
	private Integer tryType;
	private Integer punishment;
	private Integer status;
	private Date timeStart;
	private Date timeFinish;
	private Date downTime;
	
	public Integer getTargetListID() {
		return targetListID;
	}
	public void setTargetListID(Integer targetListID) {
		this.targetListID = targetListID;
	}
	public Integer getUserID() {
		return userID;
	}
	public void setUserID(Integer userID) {
		this.userID = userID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTargerName() {
		return targerName;
	}
	public void setTargerName(String targerName) {
		this.targerName = targerName;
	}
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
	public Integer getSectionID() {
		return sectionID;
	}
	public void setSectionID(Integer sectionID) {
		this.sectionID = sectionID;
	}
	public String getSecName() {
		return secName;
	}
	public void setSecName(String secName) {
		this.secName = secName;
	}
	public Integer getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(Integer difficulty) {
		this.difficulty = difficulty;
	}
	public String getIntention() {
		return intention;
	}
	public void setIntention(String intention) {
		this.intention = intention;
	}
	public Integer getPrivacy() {
		return privacy;
	}
	public void setPrivacy(Integer privacy) {
		this.privacy = privacy;
	}
	public Integer getPriority() {
		return priority;
	}
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	public Integer getRemindTimes() {
		return remindTimes;
	}
	public void setRemindTimes(Integer remindTimes) {
		this.remindTimes = remindTimes;
	}
	public Integer getTryType() {
		return tryType;
	}
	public void setTryType(Integer tryType) {
		this.tryType = tryType;
	}
	public Integer getPunishment() {
		return punishment;
	}
	public void setPunishment(Integer punishment) {
		this.punishment = punishment;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getTimeStart() {
		return timeStart;
	}
	public void setTimeStart(Date timeStart) {
		this.timeStart = timeStart;
	}
	public Date getTimeFinish() {
		return timeFinish;
	}
	public void setTimeFinish(Date timeFinish) {
		this.timeFinish = timeFinish;
	}
	public Date getDownTime() {
		return downTime;
	}
	public void setDownTime(Date downTime) {
		this.downTime = downTime;
	}
	
	
}
