package com.lifeeditor.model.message;

import java.util.List;

public interface MessageDAO_interface {
	public List<MessageVO> getMessages(Integer msgSender,Integer msgReceiver);
	public List<MessageVO> getMessages(Integer msgSender,Integer msgReceiver,Integer messageID);
	public void insertMessage(Integer msgSender,Integer msgReceiver,String content);
}
