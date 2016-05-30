package com.lifeeditor.backstage.report;

import java.util.Date;

public class reportSexVO {
	
	private Integer boy ;
	private Integer girl;
	private Integer total;
	
	
	public reportSexVO(){
		//預設建構子
	}
	public reportSexVO(Integer b,Integer g,Integer t){
		this.boy = b;
		this.girl = g;
		this.total = t;
	}
	public Integer getBoy() {
		return boy;
	}
	public void setBoy(Integer boy) {
		this.boy = boy;
	}
	public Integer getGirl() {
		return girl;
	}
	public void setGirl(Integer girl) {
		this.girl = girl;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	
}
