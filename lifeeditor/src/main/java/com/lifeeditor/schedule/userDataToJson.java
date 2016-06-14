package com.lifeeditor.schedule;

import java.util.List;

public class userDataToJson {
	
	public String chkUserData(List<scheduleVO> user){
		System.out.println("CheckUserData");
		for(int i = 0;i<=user.size();i++){
			System.out.println(user.get(i).getTargetListID());
		}
		
		return null;				
	}
}
