package com.njwangbo.mapper;

import java.util.List;

import com.njwangbo.po.User;
import com.njwangbo.vo.UserVo;

public interface UserMapper
{
    public List<User> showbyinfo(User user);
    
    public List<User> showbyname(String loginname);
    
    public void adduser(User user);
    
    public boolean updatepwd(UserVo uservo);
}
