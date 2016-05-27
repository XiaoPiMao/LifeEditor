package com.lifeeditor.model.target;

import java.sql.Date;

public class TargetVO implements java.io.Serializable {
	
	private Integer targetID;
	private String trgName;
	private Integer typeID;
	private Integer sectionID;
	private Integer difficulty;	
	private String intention;
	private Integer privacy;
	private Integer genkiBar;
	private Integer achID;
	private Integer priority ;
	private Integer remindTimes;
	private Integer trgType;
	private Integer punishment;
	private Integer status;
	private Date timeStart;
	private Date timeFinish;
	private Date doneTime ;
	
	
	public Integer getTargetID() {
		return targetID;
	}
	public void setTargetID(Integer targetID) {
		this.targetID = targetID;
	}
	public String getTrgName() {
		return trgName;
	}
	public void setTrgName(String trgName) {
		this.trgName = trgName;
	}
	public Integer getTypeID() {
		return typeID;
	}
	public void setTypeID(Integer typeID) {
		this.typeID = typeID;
	}
	public Integer getSectionID() {
		return sectionID;
	}
	public void setSectionID(Integer sectionID) {
		this.sectionID = sectionID;
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
	public Integer getGenkiBar() {
		return genkiBar;
	}
	public void setGenkiBar(Integer genkiBar) {
		this.genkiBar = genkiBar;
	}
	public Integer getAchID() {
		return achID;
	}
	public void setAchID(Integer achID) {
		this.achID = achID;
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
	public Integer getTrgType() {
		return trgType;
	}
	public void setTrgType(Integer trgType) {
		this.trgType = trgType;
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
	public Date getDoneTime() {
		return doneTime;
	}
	public void setDoneTime(Date doneTime) {
		this.doneTime = doneTime;
	}

	
	
	
}
