package com.njwangbo.service;

import java.util.List;

import com.njwangbo.po.CartItem;
import com.njwangbo.vo.CartItemVo;


public interface CarService
{
  //查询当前用户购物车所有的书籍
    public List<CartItem> showBooksByUid(String uid);
    
  //根据购物车号删除
    public void deleteOneCarById(String cartItemId);
    
  //批量删除购物车
    public void deleteBatch(CartItemVo cartItemVo);
    
  //根据购物车id修改购物车书的数量
    public void updateQuantity(CartItem cartItem);
    
    /** 
     * 根据购物车编号显示订单提交页面的信息
     * @param cartitemid 购物车信息
     * @return 订单提交页面的信息
     * @see [类、类#方法、类#成员]
     */
    public CartItemVo showCarItemVoByCaritemid(String cartItemId);
    
    // 添加书籍到购物车
    public void addBookIntoCar(CartItemVo cartItemVo);
}
