package com.njwangbo.vo;

public class CartItemVo
{
    private int[] choose;
    
    
    
    private  String bid;//图书编号
    private String uid;//登陆的会员号
    
    public String getUid()
    {
        return uid;
    }

    public void setUid(String uid)
    {
        this.uid = uid;
    }

    public String getBid()
    {
        return bid;
    }

    public void setBid(String bid)
    {
        this.bid = bid;
    }

    private String bname;//图书名称
    
    private double currPrice;//图书当前价格
    
    private int quantity;//购买数量
    
    private String cartItemId;//购物车编号
    
    private String image_b;//图书小图路径

    public String getImage_b()
    {
        return image_b;
    }

    public void setImage_b(String imageB)
    {
        image_b = imageB;
    }

    public String getCartItemId() {
		return cartItemId;
	}

	public void setCartItemId(String cartItemId) {
		this.cartItemId = cartItemId;
	}

	public String getBname()
    {
        return bname;
    }

    public void setBname(String bname)
    {
        this.bname = bname;
    }

    public double getCurrPrice() {
		return currPrice;
	}

	public void setCurrPrice(double currPrice) {
		this.currPrice = currPrice;
	}

	public int getQuantity()
    {
        return quantity;
    }

    public void setQuantity(int quantity)
    {
        this.quantity = quantity;
    }

    public int[] getChoose()
    {
        return choose;
    }

    public void setChoose(int[] choose)
    {
        this.choose = choose;
    }
    
    
}
