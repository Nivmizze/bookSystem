package com.njwangbo.service;

import java.util.List;

import com.njwangbo.po.Order;
import com.njwangbo.vo.OrderVo;

public interface OrderService
{
   public List<Order>  showAllOrders(String uid);
   
   public List<Order> showOrderByUid(String uid,int startRow,int pageSize);
   
   public List<Order>  showAllOrdersinfo(String oid);
   
   public boolean updatestatus(Order order);
   
   public boolean updatestatuscancel(Order order);
   
   public boolean updatestatusget(Order order);
   
   public boolean addorder(Order order);
   
   public List <Order> showOderbystatus(Order order);
   
   public List <Order> showAllOrderss();
   
   
   public boolean  updateadstatus (Order order);
   
   
   
  /* public void deleteBatch(StudentVo studentVo);
   
   public void updateBatch(StudentVo studentVo);
   
   public List<Classes> showAllClasses();
   
   public void addStudent(Student s);*/
}
