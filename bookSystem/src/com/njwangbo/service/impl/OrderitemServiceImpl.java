package com.njwangbo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwangbo.mapper.OrderitemMapper;
import com.njwangbo.po.Orderitem;
import com.njwangbo.service.OrderitemService;
@Service
public class OrderitemServiceImpl implements OrderitemService {

	@Autowired
	private OrderitemMapper orderitemmapper;
	
	public List<Orderitem> showitembyoid(String oid) {
		return orderitemmapper.finditembyOid(oid);
	}

	public boolean addorderitem(Orderitem orderitem) {
		return orderitemmapper.additem(orderitem);
	}

}
