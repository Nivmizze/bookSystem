package com.njwangbo.po;

import java.io.Serializable;

public class Category implements Serializable
{
    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = 7687099023964018670L;
    private String cid;//主键
    private String cname;//图书分类名称
    private String pid;//外键，相对本表的cid，表示父分类id。
    private String des;//分类描述
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
   
    

}
