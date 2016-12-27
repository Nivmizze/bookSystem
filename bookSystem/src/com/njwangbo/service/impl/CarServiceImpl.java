package com.njwangbo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwangbo.mapper.CarMapper;
import com.njwangbo.po.CartItem;
import com.njwangbo.service.CarService;
import com.njwangbo.vo.CartItemVo;

@Service
public class CarServiceImpl implements CarService
{
    @Autowired
    private CarMapper carMapper;
    
    public List<CartItem> showBooksByUid(String uid)
    {
        return carMapper.findBooksByUid(uid);
        
    }
    
    public void deleteOneCarById(String cartItemId)
    {
        carMapper.deleteOneCarById(cartItemId);
    }
    
    public void deleteBatch(CartItemVo cartItemVo)
    {
        carMapper.deleteBatch(cartItemVo);
    }
    
    // 按减号时减一本书
    public void updateQuantity(CartItem cartItem)
    {
        
        carMapper.modifyQuantity(cartItem);
        
    }

    public CartItemVo showCarItemVoByCaritemid(String cartItemId)
    {
        
        return carMapper.selectCartItemVoOne(cartItemId);
    }

    /**
     * 根据bid和uid查看购物车是否有这本书,如果有,直接修改该购物车的数量(将原来的数量加上页面传来的书籍数量),
     *        如果没有添加一个新的购物车来存储
     * @param cartItemVo 该参数中包含bid(书号),quantity(页面传过来的书籍数量)以及uid(用户id)
     * @see com.njwangbo.service.CarService#addBookIntoCar(com.njwangbo.vo.CartItemVo)
     */
    public void addBookIntoCar(CartItemVo cartItemVo)
    {
        
        CartItem cartItem = carMapper.selectIsExist(cartItemVo);
        if(null!=cartItem)//购物车有,修改数量(查询出数据库中的数量,将quantity与数据库中的数量相加,在提交到数据库)
        {
            //页面中的数量
            int quantity = cartItemVo.getQuantity();
            //数据库中的数量
            int carQuantity = cartItem.getQuantity();
            quantity=quantity+carQuantity;
            cartItem.setQuantity(quantity);
            carMapper.modifyQuantity(cartItem);
            
        }else{
            
            carMapper.insertBookIntoCar(cartItemVo);
        }
    }
    
}
