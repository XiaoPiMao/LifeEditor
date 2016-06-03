package com.lifeeditor.service;

import java.sql.Blob;
import java.util.List;

import com.lifeeditor.model.achievement.*;


public class AchievementService {

	private AchievementDAO_interface dao;
	
	public AchievementService() {
		dao = new AchievementHibernateDAO();
	}
	
	public AchievementVO addAchmt(String achName, String achDesc, Blob rewardPic){
		
		AchievementVO achVO = new AchievementVO();
		achVO.setAchName(achName);
		achVO.setAchDesc(achDesc);
		achVO.setRewardPic(rewardPic);
		dao.insert(achVO);	
		return achVO;
	}
	
	public AchievementVO updateAchmt(Integer achID, String achName, String achDesc, Blob rewardPic){
		
		AchievementVO achVO = new AchievementVO();
		achVO.setAchID(achID);
		achVO.setAchName(achName);
		achVO.setAchDesc(achDesc);
		achVO.setRewardPic(rewardPic);
		dao.update(achVO);
		return dao.findByPrimaryKey(achID);
	}	
	
	public void deleteAchmt(Integer achID) {
		dao.delete(achID);
	}

	public AchievementVO getOneEmp(Integer achID) {
		return dao.findByPrimaryKey(achID);
	}

	public List<AchievementVO> getAll() {
		return dao.getAll();
	}


	
}
