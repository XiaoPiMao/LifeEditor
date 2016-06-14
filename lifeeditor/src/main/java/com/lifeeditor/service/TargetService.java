package com.lifeeditor.service;

import java.sql.Date;
import java.util.List;

import com.lifeeditor.model.sec_list.SecListVO;
import com.lifeeditor.model.target.*;
import com.lifeeditor.model.type_list.TypeListVO;



public class TargetService {

	private TargetDAO_interface dao;
	
	public TargetService (){
		dao = new TargetDAO_JNDI();
	}
	
	public int addTrg(TargetVO trg) {
		return dao.insert(trg);
	}
	
	public TargetVO addTrg(String trgName,Integer typeID,Integer sectionID,Integer difficulty,
			String intention,Integer privacy,Integer genkiBar,Integer achID,Integer priority,
			Integer remindTimes,Integer trgType,Integer punishment,Integer status,Date timeStart,Date timeFinish,Date doneTime
			){
		
		TargetVO TrgVO = new TargetVO();
		TrgVO.setTrgName(trgName);
		
		TypeListVO typeListVO= new TypeListVO();
		typeListVO.setTypeID(typeID);
		TrgVO.setTypeVO(typeListVO);
		
		SecListVO secListVO= new SecListVO();
		secListVO.setSecID(sectionID);
		TrgVO.setSectionVO(secListVO);
			
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

		TypeListVO typeListVO= new TypeListVO();
		typeListVO.setTypeID(typeID);
		TrgVO.setTypeVO(typeListVO);
		
		SecListVO secListVO= new SecListVO();
		secListVO.setSecID(sectionID);
		TrgVO.setSectionVO(secListVO);
		
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
	
	public void updateTargetStatus(Integer status,Integer targetID){
		TargetVO target =dao.findByPrimaryKey(targetID);
		target.setStatus(status);
		 dao.update(target);
	}

	public List<TargetVO> getAll() {
		return dao.getAll();
	}

	public List<TargetVO> getAllofficial() {
		return dao.getAllofficial();
	}
	
	public List<TargetVO> findKey(String keyword) {
		return dao.findByKeyword(keyword);
	}

	
	public void copyTrg(Integer targetID,Integer userID){
		
		TargetVO TrgVO = dao.findByPrimaryKey(targetID);
		TrgVO.setTrgType(2);
		targetID= dao.insert(TrgVO);
		new Target_List_Service().addTrgList(userID, targetID);
        
		return;
	}
	
	public int countNumsOfTargetName(String keyword){
		return dao.countNumsOfTargetName(keyword);	
	}
	
	public int countRateOfTargetName(String keyword){
		return dao.countRateOfTargetName(keyword);
	}
	
	
	public List<TargetVO> getAllChallengeNameFromUser(Integer userID){
		return dao.getAllChallengeNameFromUser(userID);
	}
	
	
}
