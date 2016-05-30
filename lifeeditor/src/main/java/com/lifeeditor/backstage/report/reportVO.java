package com.lifeeditor.backstage.report;

import java.util.Date;

public class reportVO {
	
	private Integer boy ;
	private Integer girl;
	private Integer total;
	private Integer teenager ;
	private Integer middle;
	private Integer old;
	private Integer veryold;
	private Integer count;
	private Date today = new Date();
	
	public reportVO(){
		
	}
	public reportVO(reportSexVO sex,reportAgeVO age){
		this.boy = sex.getBoy();
		this.girl = sex.getGirl();
		this.total = sex.getTotal();
		this.teenager = age.getTeenager();
		this.middle = age.getMiddle();
		this.old = age.getOld();
		this.veryold = age.getVeryold();
		this.count = age.getCount();
	}
	
}
