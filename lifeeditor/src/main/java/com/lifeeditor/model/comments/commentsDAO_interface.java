package com.lifeeditor.model.comments;

import java.util.List;

import com.lifeeditor.model.user_spec.user_specVO;



public interface commentsDAO_interface {
	public void insert(commentsVO commentsVO);
	public void update(commentsVO commentsVO);
    public void delete(commentsVO commentsVO);
    public List<commentsVO> getCommentName(Integer targetID);
    public List<commentsVO> getCommentByUser(Integer userID);

}
