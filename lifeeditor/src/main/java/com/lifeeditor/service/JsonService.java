package com.lifeeditor.service;

import java.util.List;

import com.google.gson.JsonObject;
import com.lifeeditor.model.user_spec.user_specVO;

public class JsonService {
	public static String getFriends(Integer userID) {
		JsonObject jFriends = new JsonObject();
		JsonObject jFriend = null;
		FriendService friendSvc = new FriendService();
		List<user_specVO> friends = friendSvc.getFriendsByUserID(userID);
		for(user_specVO friend : friends) {
			jFriend = new JsonObject();
			jFriend.addProperty("firstName", friend.getFirstName());
			jFriend.addProperty("lastName", friend.getLastName());
			jFriends.add(friend.getUserID().toString(), jFriend);
		}
		return jFriends.toString();
	}
}
