package com.lifeeditor.model.comments;
import com.lifeeditor.model.user_spec.*;


public class commentsVO implements java.io.Serializable{
	private Integer commentID;
	private Integer targetID;
	private String comment;
	private user_specVO user_specVO;
	public Integer getCommentID() {
		return commentID;
	}
	public void setCommentID(Integer commentID) {
		this.commentID = commentID;
	}
	public Integer getTargetID() {
		return targetID;
	}
	public void setTargetID(Integer targetID) {
		this.targetID = targetID;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public user_specVO getUser_specVO() {
		return user_specVO;
	}
	public void setUser_specVO(user_specVO user_specVO) {
		this.user_specVO = user_specVO;
	}
	
	
}	