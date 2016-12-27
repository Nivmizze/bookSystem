package com.njwangbo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwangbo.mapper.OrderMapper;
import com.njwangbo.po.Order;
import com.njwangbo.service.OrderService;
import com.njwangbo.vo.OrderVo;


@Service
public class OrderServiceImpl implements OrderService
{
    @Autowired
    private OrderMapper orderMapper;

    public List<Order> showAllOrders(String uid)
    {
        return orderMapper.findAllOrder(uid);
    }

    public List<Order> showOrderByUid(String uid,int startRow,int pageSize)
    {
        return orderMapper.findOrderByUid(uid, startRow, pageSize);
    }

	public List<Order> showAllOrdersinfo(String oid) {
		return orderMapper.findAllOrderinfo(oid);
	}

	public boolean updatestatus(Order order) {
		return orderMapper.updateOrderStatus(order);
	}

	public boolean addorder(Order order){
		return orderMapper.addorder(order);
	}
	
	public boolean updatestatuscancel(Order order) {
		return orderMapper.updateOrderStatuscancel(order);
	}
	
	public boolean updatestatusget(Order order) {
		return orderMapper.updateOrderStatusGet(order);
	}
    

//	后台
	public List<Order> showOderbystatus(Order order) {
		
		return orderMapper.findOrderBystatus(order);
	}

	public List<Order> showAllOrderss() {
		
		return orderMapper.finAllOrders();
	}

	public boolean updateadstatus(Order order) {
		// TODO Auto-generated method stub
		return orderMapper.updateadOrderStatus(order);
	}

}
