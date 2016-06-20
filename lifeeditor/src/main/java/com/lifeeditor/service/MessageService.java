package com.lifeeditor.service;

import java.util.List;

import com.lifeeditor.model.message.MessageDAO;
import com.lifeeditor.model.message.MessageDAO_interface;
import com.lifeeditor.model.message.MessageVO;


public class MessageService {
	private MessageDAO_interface dao;
	
	public MessageService() {
		this.dao = new MessageDAO();
	}
	
	
	public List<MessageVO> getMessages(Integer msgSender,Integer msgReceiver) {
		return dao.getMessages(msgSender, msgReceiver);
	};
	
	public List<MessageVO> getMessages(Integer msgSender,Integer msgReceiver,Integer messageID) {
		return dao.getMessages(msgSender, msgReceiver, messageID);
	}
	
	public void insertMessage(Integer msgSender,Integer msgReceiver,String content) {
		dao.insertMessage(msgSender, msgReceiver, content);
	}
}
