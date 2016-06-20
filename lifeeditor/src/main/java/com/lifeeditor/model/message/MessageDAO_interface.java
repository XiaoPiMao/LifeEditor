package com.lifeeditor.model.message;

import java.util.List;

public interface MessageDAO_interface {
	public List<MessageVO> getMessages();
	public List<MessageVO> getMessages(int messageID);
}
