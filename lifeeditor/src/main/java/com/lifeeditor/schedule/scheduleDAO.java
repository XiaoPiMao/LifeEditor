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
	
	public List<scheduleVO> getScheduleFromUser(String userID) throws SQLException{
		
		String queryString = "select user_spec.lastName + user_spec.firstName as name,target.trgName,type_list.typeName,"+
							 "sec_list.secName,target.intention,target.timeStart,target.timeFinish "+
							 "from target_list "+
							 "inner join target on target_list.targetID = target.targetID " +
							 "inner join sec_list on sec_list.secID = target.sectionID " +
							 "inner join user_spec on user_spec.userID = target_list.userID "+
							 "inner join type_list on type_list.typeID = target.typeID " +
							 "where targetListID = "+userID+"";
		
		List<scheduleVO> userData = new ArrayList<scheduleVO>();
		
		try {
			
			conn = ds.getConnection();
			psmt = conn.prepareStatement(queryString);
			rs = psmt.executeQuery();
			
			while(rs.next()){
				
				scheduleVO schedule = new scheduleVO();
				

				schedule.setName(rs.getString(1));
				schedule.setTargerName(rs.getString(2));
				schedule.setTypeName(rs.getString(3));
				schedule.setSecName(rs.getString(4));
				schedule.setIntention(rs.getString(5));
				schedule.setTimeStart(rs.getDate(6));
				schedule.setTimeFinish(rs.getDate(7));
				
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
		} finally{
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return showAll;
	}
}
