package com.lifeeditor.chatroom;

public class Message {

    private String type;
	private Integer msgSender;
    private Integer msgReceiver;
    private String content;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
    
    
	

    
}
