package com.lifeeditor.schedule;

import java.sql.Date;

public class scheduleVO {
	

	private String name;
	private String targerName;
	private String typeName;
	private String secName;
	private String intention;
	private Date timeStart;
	private Date timeFinish;
	

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

	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getSecName() {
		return secName;
	}
	public void setSecName(String secName) {
		this.secName = secName;
	}

	public String getIntention() {
		return intention;
	}
	public void setIntention(String intention) {
		this.intention = intention;
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
		
}
