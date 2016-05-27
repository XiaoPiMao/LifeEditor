package com.lifeeditor.achievement.model;

import java.util.List;

import com.lifeeditor.achievement.model.AchievementVO;

public interface AchievementDAO_interface {

	public void insert (AchievementVO achVO);
	public void update (AchievementVO achVO);
	public void delete (AchievementVO achVO);
	public void delete(Integer achID);
    public AchievementVO findByPrimaryKey(Integer achID);
    public List<AchievementVO> getAll();
}
