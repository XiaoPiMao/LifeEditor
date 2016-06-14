package com.lifeeditor.schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lifeeditor.utility.GlobalValues;

public class scheduleDAO {
	
	DataSource ds = null;
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	public scheduleDAO(){
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup(GlobalValues.DS_LOOKUP);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<scheduleVO> getScheduleFromUser(Integer userID) throws SQLException{
		
		String queryString = "select targetListID,target_list.userID,user_spec.lastName + user_spec.firstName as name,target.trgName,target.typeID,type_list.typeName,"+
							 "target.sectionID,sec_list.secName,target.difficulty,target.intention,target.privacy,target.priority,"+
							 "target.remindTimes,target.trgType,target.punishment,target.status,target.timeStart,target.timeFinish,target.doneTime "+
							 "from target_list "+ 
							 "inner join target on target_list.targetID = target.targetID "+
							 "inner join sec_list on sec_list.secID = target.sectionID "+
							 "inner join user_spec on user_spec.userID = target_list.userID "+
							 "inner join type_list on type_list.typeID = target.typeID "+
							 "where target_list.userID = "+userID+"";
		
		List<scheduleVO> userData = new ArrayList<scheduleVO>();
		
		try {
			
			conn = ds.getConnection();
			psmt = conn.prepareStatement(queryString);
			rs = psmt.executeQuery();
			
			while(rs.next()){
				
				scheduleVO schedule = new scheduleVO();
				
				schedule.setTargetListID(rs.getInt(1));
				schedule.setUserID(rs.getInt(2));
				schedule.setName(rs.getString(3));
				schedule.setTargerName(rs.getString(4));
				schedule.setTypeID(rs.getInt(5));
				schedule.setTypeName(rs.getString(6));
				schedule.setSectionID(rs.getInt(7));
				schedule.setSecName(rs.getString(8));
				schedule.setDifficulty(rs.getInt(9));
				schedule.setIntention(rs.getString(10));
				schedule.setPrivacy(rs.getInt(11));
				schedule.setPriority(rs.getInt(12));
				schedule.setRemindTimes(rs.getInt(13));
				schedule.setTryType(rs.getInt(14));
				schedule.setPunishment(rs.getInt(15));
				schedule.setStatus(rs.getInt(16));
				schedule.setTimeStart(rs.getDate(17));
				schedule.setTimeFinish(rs.getDate(18));
				schedule.setDownTime(rs.getDate(19));
				
				userData.add(schedule);
				
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			conn.close();
			psmt.close();
			rs.close();
		}
		return userData;		
	}
	
	public List<showScheduleVO> showSchedule(Integer userID){
		
		String queryString = "select targetListID,target.trgName,target.priority,"+
							 "target.timeStart,target.timeFinish " +
							 "from target_list "+
							 "inner join target on target_list.targetID = target.targetID "+
							 "where target_list.userID = "+userID+"";
		
		List<showScheduleVO> showAll = new ArrayList<showScheduleVO>();
		
		try {
			
			
			conn = ds.getConnection();
			psmt = conn.prepareStatement(queryString);
			rs = psmt.executeQuery();
			
			while(rs.next()){
				
				showScheduleVO show = new showScheduleVO();
				
				show.setid(rs.getInt(1));
				show.settitle(rs.getString(2));
				Integer setcolor = rs.getInt(3);
				if(setcolor.equals(1)){
					show.setcolor("#FF3333");
				}else if(setcolor.equals(2)){
					show.setcolor("#0066FF");
				}else if(setcolor.equals(3)){
					show.setcolor("#FFBB00");
				}
				java.util.Date day = rs.getDate(4);
				//System.out.println(day.getTime());
				show.setstart(day);
				show.setend(rs.getDate(5));
				show.settextColor("White");
				
				showAll.add(show);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return showAll;
	}
}
