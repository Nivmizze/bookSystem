package com.njwangbo.po;

import java.io.Serializable;

public class CartItem implements Serializable
{
    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = 6320061079884892799L;
    private String cartItemId;//主键
    private int quantity;//数量
    private String bid;//图书id
    private String uid;//当前会员id
	private Book book;//一个小购物车对应一本书
	public String getCartItemId() {
		return cartItemId;
	}
	
    public Book getBook()
    {
        return book;
    }

    public void setBook(Book book)
    {
        this.book = book;
    }

    public void setCartItemId(String cartItemId) {
		this.cartItemId = cartItemId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	
    
    

}
