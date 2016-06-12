package com.lifeeditor.model.achievement;

import java.util.List;

import com.lifeeditor.model.achievement.AchievementVO;
import com.lifeeditor.model.target.TargetVO;

public interface AchievementDAO_interface {

	public int insert (AchievementVO achVO);
	public void update (AchievementVO achVO);
	public void delete (AchievementVO achVO);
	public void delete(Integer achID);
    public AchievementVO findByPrimaryKey(Integer achID);
    public List<AchievementVO> getAll();
	public List<AchievementVO> findByKeyword(String keyword2);
    public AchievementVO findPicture(Integer achID);   
}
