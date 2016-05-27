package com.lifeeditor.achievement.model;

import java.sql.Blob;

public class AchievementVO implements java.io.Serializable {

	private Integer achID;
	private String achName;
	private String achDesc;
	private Blob rewardPic;
	
	public Integer getAchID() {
		return achID;
	}
	public void setAchID(Integer achID) {
		this.achID = achID;
	}
	public String getAchName() {
		return achName;
	}
	public void setAchName(String achName) {
		this.achName = achName;
	}
	public String getAchDesc() {
		return achDesc;
	}
	public void setAchDesc(String achDesc) {
		this.achDesc = achDesc;
	}
	public Blob getRewardPic() {
		return rewardPic;
	}
	public void setRewardPic(Blob rewardPic) {
		this.rewardPic = rewardPic;
	}
	
	
}


