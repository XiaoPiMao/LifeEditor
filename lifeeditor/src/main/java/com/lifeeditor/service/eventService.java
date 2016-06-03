package com.lifeeditor.service;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import com.lifeeditor.model.event.eventDAO;
import com.lifeeditor.model.event.eventDAO_interface;
import com.lifeeditor.model.event.eventVO;

public class eventService {
	private eventDAO_interface dao;

	public eventService() {
		dao = new eventDAO();
	}

	public eventVO addevent( String eventName,Blob eventPic, String orgName,String orgAddr,java.sql.Date eventTime,String eventDesc) {

		eventVO eventVO = new eventVO();
		
		eventVO.setTypeID(2);
		eventVO.setSecID(10);		
		eventVO.setEventName(eventName);
		eventVO.setEventPic(eventPic);
		eventVO.setOrgName(orgName);
		eventVO.setOrgAddr(orgAddr);
		eventVO.setEventTime(eventTime);
		eventVO.setEventDesc(eventDesc);
		
		eventVO.setEventID(dao.insert(eventVO));
				

		return eventVO;
	}

	//預留給 Struts 2 用的
//	public void addevent(eventVO eventVO) {
//		dao.insert(eventVO);
//	}
//	
	public eventVO updateevent(Integer eventID,Integer typeID,Integer secID,String eventName, java.sql.Blob eventPic,
			 String orgName,String orgAddr,java.sql.Date eventTime,String eventDesc) {

		eventVO eventVO = new eventVO();

		eventVO.setEventID(eventID);
		eventVO.setTypeID(typeID);
		eventVO.setSecID(secID);
		
		eventVO.setEventName(eventName);
		eventVO.setEventPic(eventPic);
		eventVO.setOrgAddr(orgAddr);
		eventVO.setOrgName(orgName);
		eventVO.setEventTime(eventTime);
		eventVO.setEventDesc(eventDesc);
		dao.update(eventVO);

		return dao.findByPrimaryKey(eventID);
	}
	
	//預留給 Struts 2 用的
	public void updateevent(eventVO eventVO) {
		dao.update(eventVO);
	}

	public void deleteevent(Integer eventno) {
		dao.delete(eventno);
	}

	public eventVO getOneevent(Integer eventID) {
		return dao.findByPrimaryKey(eventID);
	}

	public List<eventVO> getAll() {
	     
		
		
		
		
		return dao.getAll();
	}
}


