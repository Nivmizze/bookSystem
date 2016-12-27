package com.njwangbo.po;

import java.io.Serializable;

public class Book implements Serializable
{
 private String bid;//主键
    
    private String bname;//书名
    
    private String author;//作者
    
    private double price;//定价
    
    private double currPrice;//当前价
    
    private double discount;//折扣
    
    private String press;//出版社
    
    private String publishtime;//出版时间
    
    private int edition;//版次
    
    private int pageNum;//页数
    
    private int wordNum;//字数
    
    private String printtime;//印刷时间
    
    private int booksize;//开本
    
    private String paper;//纸质
    
    private String cid;//所属分类
    
    private String image_w;//大图路径
    
    private String image_b;//小图路径
    
    private String orderBy;//序号
    
    private int num;
    
    private int bstatus;
    
    public int getBstatus() {
		return bstatus;
	}

	public void setBstatus(int bstatus) {
		this.bstatus = bstatus;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getBid()
    {
        return bid;
    }

    public void setBid(String bid)
    {
        this.bid = bid;
    }

    public String getBname()
    {
        return bname;
    }

    public void setBname(String bname)
    {
        this.bname = bname;
    }

    public String getAuthor()
    {
        return author;
    }

    public void setAuthor(String author)
    {
        this.author = author;
    }

    public double getPrice()
    {
        return price;
    }

    public void setPrice(double price)
    {
        this.price = price;
    }

    public double getCurrPrice()
    {
        return currPrice;
    }

    public void setCurrPrice(double currPrice)
    {
        this.currPrice = currPrice;
    }

    public double getDiscount()
    {
        return discount;
    }

    public void setDiscount(double discount)
    {
        this.discount = discount;
    }

    public String getPress()
    {
        return press;
    }

    public void setPress(String press)
    {
        this.press = press;
    }

    public String getPublishtime()
    {
        return publishtime;
    }

    public void setPublishtime(String publishtime)
    {
        this.publishtime = publishtime;
    }

    public int getEdition()
    {
        return edition;
    }

    public void setEdition(int edition)
    {
        this.edition = edition;
    }

    public int getPageNum()
    {
        return pageNum;
    }

    public void setPageNum(int pageNum)
    {
        this.pageNum = pageNum;
    }

    public int getWordNum()
    {
        return wordNum;
    }

    public void setWordNum(int wordNum)
    {
        this.wordNum = wordNum;
    }

    public String getPrinttime()
    {
        return printtime;
    }

    public void setPrinttime(String printtime)
    {
        this.printtime = printtime;
    }

    public int getBooksize()
    {
        return booksize;
    }

    public void setBooksize(int booksize)
    {
        this.booksize = booksize;
    }

    public String getPaper()
    {
        return paper;
    }

    public void setPaper(String paper)
    {
        this.paper = paper;
    }

    public String getCid()
    {
        return cid;
    }

    public void setCid(String cid)
    {
        this.cid = cid;
    }

    public String getImage_w() {
		return image_w;
	}

	public void setImage_w(String imageW) {
		image_w = imageW;
	}

	public String getImage_b() {
		return image_b;
	}

	public void setImage_b(String imageB) {
		image_b = imageB;
	}

	public String getOrderBy()
    {
        return orderBy;
    }

    public void setOrderBy(String orderBy)
    {
        this.orderBy = orderBy;
    }

   
}
