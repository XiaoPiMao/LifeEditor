package com.lifeeditor.model.target;

import java.util.*;

import com.lifeeditor.model.target_list.Target_ListVO;

public interface TargetDAO_interface {
	
	public int insert(TargetVO TrgVO);
	public void update(TargetVO TrgVO);
	public void delete(Integer targetID);
	public TargetVO findByPrimaryKey(Integer targetID);
	public List<TargetVO> getAll();
	public List<TargetVO> getAllofficial();
	public List<TargetVO> findByKeyword(String keyword);
	public int countNumsOfTargetName(String keyword);
	public int countRateOfTargetName(String keyword);
	public List<Target_ListVO> getFromKeyWordSearch(String keyword);
	public Target_ListVO getRandomTarget();
	public List<TargetVO> getAllChallengeNameFromUser(Integer userID);
	public void check(Integer targetID);
	public void complete(Integer targetID);
	
	
}
