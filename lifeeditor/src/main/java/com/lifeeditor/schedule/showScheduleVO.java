package com.lifeeditor.schedule;

import java.util.Date;



public class showScheduleVO {
	
	private Integer id;
	private String title;
	private Date start;
	private Date end;
	private String color;
	private String textColor ;
	
	
	
	public Date getend() {
		return end;
	}
	public void setend(Date end) {
		this.end = end;
	}
	public Integer getid() {
		return id;
	}
	public void setid(Integer id) {
		this.id = id;
	}
	public String gettitle() {
		return title;
	}
	public void settitle(String title) {
		this.title = title;
	}
	public Date getstart() {
		return start;
	}
	public void setstart(Date start) {
		this.start = start;
	}
	public String getcolor() {
		return color;
	}
	public void setcolor(String color) {
		this.color = color;
	}
	public String gettextColor() {
		return textColor;
	}
	public void settextColor(String textColor) {
		this.textColor = textColor;
	}
	
	
}
