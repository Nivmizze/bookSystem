package com.njwangbo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwangbo.mapper.AdminMapper;
import com.njwangbo.po.Admin;
import com.njwangbo.service.AdminService;
@Service
public class AdminServiceImpl implements AdminService
{   
    @Autowired
    private AdminMapper am;
    public List<Admin> findAdminByNameAndPwd(Admin admin)
    {
        
        return am.selectAdminByNameAndPwd(admin);
    }
    
}
