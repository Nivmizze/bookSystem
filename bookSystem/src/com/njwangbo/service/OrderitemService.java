package com.njwangbo.service;

import java.util.List;

import com.njwangbo.po.Orderitem;

public interface OrderitemService {

	public List<Orderitem> showitembyoid(String oid);
	
	public boolean addorderitem(Orderitem orderitem);
}
