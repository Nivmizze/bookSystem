package com.njwangbo.mapper;

import java.util.List;

import com.njwangbo.po.Order;
import com.njwangbo.vo.OrderVo;

public interface OrderMapper
{
	
    /**
     * 用户所有订单
     * @param uid
     * @return
     */
    public List<Order> findAllOrder(String uid);
    
    /**
     * 带分页
     * @param uid
     * @param startRow
     * @param pageSize
     * @return
     */
    public List<Order> findOrderByUid(String uid,int startRow,int pageSize);
    
    /**
     * 订单详情
     * @param oid
     * @return
     */
    public List<Order> findAllOrderinfo(String oid);
    
    /**1-3
     * 修改订单状态
     * --冗余
     * @param order
     * @return
     */
    public boolean updateOrderStatus(Order order);
    
    public boolean updateOrderStatuscancel(Order order);
    
    public boolean updateOrderStatusGet(Order order);
    
    /**
     * 添加订单
     * @param order
     * @return
     */
    public boolean addorder(Order order);
    
    public List<Order> finAllOrders();
    
    
    /**
     * 订单状态
     * @param order
     * @return
     */
    public boolean updateadOrderStatus(Order order);
    
    
    //int status,int startRow,int pageSize
    public List<Order> findOrderBystatus(Order order);
   
}
