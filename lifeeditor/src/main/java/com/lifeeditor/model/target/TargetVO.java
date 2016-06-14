package com.lifeeditor.model.target;

import java.sql.Date;

import com.google.gson.annotations.Expose;
import com.lifeeditor.model.achievement.AchievementVO;
import com.lifeeditor.model.sec_list.SecListVO;
import com.lifeeditor.model.type_list.TypeListVO;

public class TargetVO implements java.io.Serializable {
	 
	private static final long serialVersionUID = 1L;
	@Expose
	private Integer targetID;
	@Expose
	private String trgName;
	@Expose
	private TypeListVO typeVO;
	@Expose
	private SecListVO sectionVO;
	@Expose
	private Integer difficulty;	
	@Expose
	private String intention;
	@Expose
	private Integer privacy;
	@Expose
	private Integer genkiBar;
	private AchievementVO achVO;
	@Expose
	private Integer priority ;
	@Expose
	private Integer remindTimes;
	@Expose
	private Integer trgType;
	@Expose
	private Integer punishment;
	@Expose
	private Integer status;
	@Expose
	private Date timeStart;
	@Expose
	private Date timeFinish;
	@Expose
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
	public TypeListVO getTypeVO() {
		return typeVO;
	}
	public void setTypeVO(TypeListVO typeVO) {
		this.typeVO = typeVO;
	}
	public SecListVO getSectionVO() {
		return sectionVO;
	}
	public void setSectionVO(SecListVO sectionVO) {
		this.sectionVO = sectionVO;
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
	public AchievementVO getAchVO() {
		return achVO;
	}
	public void setAchVO(AchievementVO achVO) {
		this.achVO = achVO;
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
