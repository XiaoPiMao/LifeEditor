package com.lifeeditor.model.target_spec;

import java.util.List;

public interface Target_specDAO_interface {
	public int insert_simple(Target_specVO target_specVO);
	public void delete(Integer userID);
    public List<Target_specVO> findByUser(Integer userID);
    public Target_specVO findByTargetID(Integer TargetID);
    public   List<Target_specVO>  getNote(Integer userID , Integer targetID);
    public List<Target_specVO> getAll();
    public List<Target_specVO> getAllByHotMan();
	public void updateeNote(Target_specVO target_specVO);
	public	int insert_will_change_status(Target_specVO target_specVO);
	public Target_specVO updateAll(Target_specVO target_specVO);
	public Target_specVO updateNote(Target_specVO target_specVO);
	public Target_specVO findByPrimaryKey(Integer trgSpecID);
	public List<Target_specVO> getAllTrgSpec();
	public List<Target_specVO> getByUser(Integer userID);
	public int addSpec(Target_specVO target_specVO);

}
