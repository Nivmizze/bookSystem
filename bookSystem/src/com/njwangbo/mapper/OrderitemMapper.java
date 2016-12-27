package com.njwangbo.mapper;

import java.util.List;

import com.njwangbo.po.Orderitem;

public interface OrderitemMapper {

	public List<Orderitem> finditembyOid(String oid);
	
	public boolean additem(Orderitem Orderitem);
}
