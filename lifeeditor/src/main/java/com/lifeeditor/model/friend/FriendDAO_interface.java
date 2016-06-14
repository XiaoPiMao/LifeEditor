package com.lifeeditor.model.friend;

import java.util.List;


import com.lifeeditor.model.user_spec.user_specVO;

public interface FriendDAO_interface {
	public List<user_specVO> findFriendsByUserID(Integer userID);
}
