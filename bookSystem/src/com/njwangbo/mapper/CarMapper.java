package com.njwangbo.mapper;

import java.util.List;

import com.njwangbo.po.CartItem;
import com.njwangbo.vo.CartItemVo;

public interface CarMapper
{
    
    /** 
     *查询当前用户购物车所有的书籍
     * @param uid
     * @return
     * @see [类、类#方法、类#成员]
     */
    public List<CartItem> findBooksByUid(String uid);
    
    
    /** 
     * 根据购物车号删除
     * @param cartitemid
     * @see [类、类#方法、类#成员]
     */
    public void deleteOneCarById(String cartItemId);
    
    
    /** 
     * 批量删除购物车
     * @param cartItemVo
     * @see [类、类#方法、类#成员]
     */
    public void deleteBatch(CartItemVo cartItemVo);
    
    
    /** 
     * 根据购物车id修改购物车书的数量
     * @param cartItem
     * @see [类、类#方法、类#成员]
     */
    public void modifyQuantity(CartItem cartItem);
    
    /** 
     * 根据购物车id 显示订单提交页面的信息
     * @param cartitemid 购物车编号
     * @return 订单提交页面的信息
     * @see [类、类#方法、类#成员]
     */
    public CartItemVo selectCartItemVoOne(String cartItemId);
    
    
    /** 
     * 添加书籍到购物车
     * @param cartItemVo 该参数中包含bid(书号),quantity(页面传过来的书籍数量)以及uid(用户id)
     * @see [类、类#方法、类#成员]
     */
    public void insertBookIntoCar(CartItemVo cartItemVo);
    
    /** 
     * 根据bid和uid判断购物车中是否存在
     * @param cartItemVo
     * @return CartItem
     * @see [类、类#方法、类#成员]
     */
    public CartItem selectIsExist(CartItemVo cartItemVo);
}
