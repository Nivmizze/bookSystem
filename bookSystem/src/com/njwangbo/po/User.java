package com.njwangbo.po;

import java.io.Serializable;

public class User implements Serializable
{
 /**
     * serialVersionUID
     */
    private static final long serialVersionUID = -2471734282159957334L;

private String uid;
 
 private String loginname;
 
 private String loginpass;
 
 private String email;

public String getUid()
{
    return uid;
}

public void setUid(String uid)
{
    this.uid = uid;
}

public String getLoginname()
{
    return loginname;
}

public void setLoginname(String loginname)
{
    this.loginname = loginname;
}

public String getLoginpass()
{
    return loginpass;
}

public void setLoginpass(String loginpass)
{
    this.loginpass = loginpass;
}

public String getEmail()
{
    return email;
}

public void setEmail(String email)
{
    this.email = email;
}
}
