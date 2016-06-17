package com.lifeeditor.model.event;

import java.io.OutputStream;
import java.util.List;



public interface eventDAO_interface {
	public int insert(eventVO eventVO);
    public void update(eventVO eventVO);
    public void delete(Integer eventID);
    public eventVO  findByPrimaryKey(Integer eventID);
    public List<eventVO> getAll();
    public OutputStream readBlob();
}
