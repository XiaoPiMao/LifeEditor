package com.lifeeditor.service;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lifeeditor.model.event.eventVO;
import com.lifeeditor.model.target_spec.*;

public class TargetSpecService {
	private Target_specDAO_interface dao = null;
	
	public TargetSpecService() {
			ApplicationContext context = new ClassPathXmlApplicationContext("model-config2-JndiObjectFactoryBean.xml");
			dao =(Target_specJDBCDAO) context.getBean("Target_specJDBCDAO");
	}
	
	public Target_specVO getOneTrgSpec(Integer TargetID) {
		return dao.findByTargetID(TargetID);
	}
	
	
	public List<Target_specVO>  getNote(Integer userID , Integer targetID){	 
		 return dao.getNote(userID, targetID);
		 
	}
	
	public List<Target_specVO> getAll() {
		return dao.getAll();
	}
	
//	public void insert(Target_specVO target_specVO);
//	public void update(Target_specVO target_specVO);
	public int addTargetSpec(Integer userID, Integer targetID, String userTarget_desc, String trgPicPath ) {
		Target_specVO Target_specVO= new Target_specVO();
		Target_specVO.setTargetID(targetID);
		Target_specVO.setUserID(userID);
		Target_specVO.setTrgNote(userTarget_desc);
		Target_specVO.setTrgPicPath(trgPicPath);
		
		return dao.addSpec(Target_specVO);
				
	}

	public Target_specVO updateTargetSpecTrgAll(Integer Target_specID,String userTarget_desc, String trgPicPath) {

		Target_specVO Target_specVO= new Target_specVO();
		Target_specVO.setTrgSpecID(Target_specID);
		Target_specVO.getTargetVO().setTargetID(Target_specVO.getTargetVO().getTargetID());
		Target_specVO.getUserVO().setUserID(Target_specVO.getUserVO().getUserID());
		Target_specVO.setTrgNote(userTarget_desc);
		Target_specVO.setTrgPicPath(trgPicPath);
		
		return dao.updateAll(Target_specVO);
	}
	public Target_specVO updateTargetSpecNote(Integer Target_specID,String userTarget_desc) {

		Target_specVO Target_specVO= new Target_specVO();
		Target_specVO.setTrgSpecID(Target_specID);
		Target_specVO.getTargetVO().setTargetID(Target_specVO.getTargetVO().getTargetID());
		Target_specVO.getUserVO().setUserID(Target_specVO.getUserVO().getUserID());
		Target_specVO.setTrgPicPath(userTarget_desc);
		Target_specVO.setTrgPicPath(Target_specVO.getTrgPicPath());
		dao.updateeNote(Target_specVO);
		return dao.updateNote(Target_specVO);
	}

	
	public List<Target_specVO> getAllByHotMan() {
		return dao.getAllByHotMan();
	}

	public int delete(Integer userID) {
		return userID;
	}
	public Target_specVO findByPrimaryKey(Integer userID) {
		return ((TargetSpecService) dao).findByPrimaryKey(userID);
	}
	public Target_specVO addTargetSpec_changeStatus(Integer userID, Integer targetID, String userTarget_desc, String trgPicPath ) {
		Target_specVO Target_specVO= new Target_specVO();
		Target_specVO.setTargetID(targetID);
		Target_specVO.setUserID(userID);
		Target_specVO.setTrgNote(userTarget_desc);
		Target_specVO.setTrgPicPath(trgPicPath);
		Target_specVO.setTrgSpecID(dao.insert_will_change_status(Target_specVO));
		return Target_specVO;
		
	}
	
	public Target_specVO getOneTrgSpecByKey(Integer trgSpecID) {
		return dao.findByPrimaryKey(trgSpecID);
	}
	public List<Target_specVO> getAll1() {
		
		return dao.getAllTrgSpec();
	}
	
	public List<Target_specVO> getByUser(Integer userID) {
		return dao.getByUser(userID);
	}
	
}
