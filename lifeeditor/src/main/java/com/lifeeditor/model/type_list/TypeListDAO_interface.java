package com.lifeeditor.model.type_list;

import java.util.List;

public interface TypeListDAO_interface {
	public void insert(TypeListVO TypeListVO);
    public void update(TypeListVO TypeListVO);   
    public TypeListVO findByPrimaryKey(Integer typeID);
	public List<TypeListVO> getAll();
}
