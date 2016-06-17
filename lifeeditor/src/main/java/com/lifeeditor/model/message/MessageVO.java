package com.lifeeditor.model.message;

import java.sql.Timestamp;

public class MessageVO {
	private Integer messageID;
	private Integer msgSender;
	private Integer msgReceiver;
	private Timestamp msgTime;
	private String content;
	public Integer getMessageID() {
		return messageID;
	}
	public void setMessageID(Integer messageID) {
		this.messageID = messageID;
	}
	public Integer getMsgSender() {
		return msgSender;
	}
	public void setMsgSender(Integer msgSender) {
		this.msgSender = msgSender;
	}
	public Integer getMsgReceiver() {
		return msgReceiver;
	}
	public void setMsgReceiver(Integer msgReceiver) {
		this.msgReceiver = msgReceiver;
	}
	public Timestamp getMsgTime() {
		return msgTime;
	}
	public void setMsgTime(Timestamp msgTime) {
		this.msgTime = msgTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
