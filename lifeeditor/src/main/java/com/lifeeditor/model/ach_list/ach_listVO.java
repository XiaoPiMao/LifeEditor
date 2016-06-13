package com.lifeeditor.model.ach_list;
import com.lifeeditor.model.user_spec.*;
import com.lifeeditor.model.achievement.*;

public class ach_listVO implements java.io.Serializable{
	private Integer ach_listID;
	private user_specVO user_specVO;    
	private AchievementVO AchievementVO;
	
	public Integer getAch_listID() {
		return ach_listID;
	}
	public void setAch_listID(Integer ach_listID) {
		this.ach_listID = ach_listID;
	}
	public user_specVO getUser_specVO() {
		return user_specVO;
	}
	public void setUser_specVO(user_specVO user_specVO) {
		this.user_specVO = user_specVO;
	}
	public AchievementVO getAchievementVO() {
		return AchievementVO;
	}
	public void setAchievementVO(AchievementVO achievementVO) {
		AchievementVO = achievementVO;
	}   
	
	
	

}	