package com.lifeeditor.service;

import java.sql.Blob;
import java.sql.Date;
import java.util.List;

import com.lifeeditor.model.achievement.AchievementVO;
import com.lifeeditor.model.target.*;

public class TargetService {

	private TargetDAO_interface dao;
	
	public TargetService (){
		dao = new TargetDAO_JNDI();
	}
	
	public TargetVO addTrg(String trgName,Integer typeID,Integer sectionID,Integer difficulty,
			String intention,Integer privacy,Integer genkiBar,Integer achID,Integer priority,
			Integer remindTimes,Integer trgType,Integer punishment,Integer status,Date timeStart,Date timeFinish,Date doneTime
			){
		
		TargetVO TrgVO = new TargetVO();
		TrgVO.setTrgName(trgName);
		TrgVO.setTypeID(typeID);
		TrgVO.setSectionID(sectionID);
		TrgVO.setDifficulty(difficulty);
		TrgVO.setIntention(intention);
		TrgVO.setPrivacy(privacy);
		TrgVO.setGenkiBar(genkiBar);
		AchievementService achSvc = new AchievementService();
		TrgVO.setAchVO(achSvc.getOneAchmt(achID));
		TrgVO.setPriority(priority);
		TrgVO.setRemindTimes(remindTimes);
		TrgVO.setTrgType(trgType);
		TrgVO.setPunishment(punishment);
		TrgVO.setStatus(status);
		TrgVO.setTimeStart(timeStart);
		TrgVO.setTimeFinish(timeFinish);
		TrgVO.setDoneTime(doneTime);
		dao.insert(TrgVO);	
		return TrgVO;
	}
	
	
	public TargetVO updateTrg(Integer targetID,String trgName,Integer typeID,Integer sectionID,Integer difficulty,
			String intention,Integer privacy,Integer genkiBar,Integer achID,Integer priority,
			Integer remindTimes,Integer trgType,Integer punishment,Integer status,Date timeStart,Date timeFinish,Date doneTime){
		
		TargetVO TrgVO = new TargetVO();
		TrgVO.setTargetID(targetID);
		TrgVO.setTrgName(trgName);
		TrgVO.setTypeID(typeID);
		TrgVO.setSectionID(sectionID);
		TrgVO.setDifficulty(difficulty);
		TrgVO.setIntention(intention);
		TrgVO.setPrivacy(privacy);
		TrgVO.setGenkiBar(genkiBar);
		AchievementService achSvc = new AchievementService();
		TrgVO.setAchVO(achSvc.getOneAchmt(achID));
		TrgVO.setPriority(priority);
		TrgVO.setRemindTimes(remindTimes);
		TrgVO.setTrgType(trgType);
		TrgVO.setPunishment(punishment);
		TrgVO.setStatus(status);
		TrgVO.setTimeStart(timeStart);
		TrgVO.setTimeFinish(timeFinish);
		TrgVO.setDoneTime(doneTime);
		dao.update(TrgVO);
		return dao.findByPrimaryKey(targetID);
	}
	
	public void deleteTrg(Integer targetID) {
		dao.delete(targetID);
	}

	public TargetVO getOneTrg(Integer targetID) {
		return dao.findByPrimaryKey(targetID);
	}

	public List<TargetVO> getAll() {
		return dao.getAll();
	}

	public List<TargetVO> findKey(String keyword) {
		return dao.findByKeyword(keyword);
	}

	
}
