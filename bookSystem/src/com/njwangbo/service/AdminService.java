package com.njwangbo.service;

import java.util.List;

import com.njwangbo.po.Admin;

public interface AdminService
{
    public List<Admin> findAdminByNameAndPwd(Admin admin);
   
}
