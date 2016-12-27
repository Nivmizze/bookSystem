package com.njwangbo.po;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Admin
{
    private String adminId;
    
    @NotNull(message="{user.name.null.errormsg}")
    @Size(min=2,max=12,message="{user.name.length.errormsg}")
    private String adminname;
    
    private String adminpwd;

    public String getAdminId()
    {
        return adminId;
    }

    public void setAdminId(String adminId)
    {
        this.adminId = adminId;
    }

    public String getAdminname()
    {
        return adminname;
    }

    public void setAdminname(String adminname)
    {
        this.adminname = adminname;
    }

    public String getAdminpwd()
    {
        return adminpwd;
    }

    public void setAdminpwd(String adminpwd)
    {
        this.adminpwd = adminpwd;
    }
    
    
}
