package com.lifeeditor.service;

import java.util.List;

import com.lifeeditor.model.friend.FriendDAO;
import com.lifeeditor.model.user_spec.user_specVO;


public class FriendService {
	private FriendDAO  dao;
	
	public FriendService() {
		dao = new FriendDAO();
	}
	
	public List<user_specVO> getFriendsByUserID(Integer userID) {
		return dao.findFriendsByUserID(userID);
	}
}
