package com.njwangbo.mapper;

import java.util.List;

import com.njwangbo.po.Admin;

public interface AdminMapper
{
    public List<Admin> selectAdminByNameAndPwd(Admin admin);
}
