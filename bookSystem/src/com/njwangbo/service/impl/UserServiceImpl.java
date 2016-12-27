package com.njwangbo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwangbo.mapper.UserMapper;
import com.njwangbo.po.User;
import com.njwangbo.service.UserService;
import com.njwangbo.vo.UserVo;
@Service
public class UserServiceImpl implements UserService
{
    @Autowired
    private UserMapper usermapper;
    
    public List<User> showbyinfo(User user)
    {
        return usermapper.showbyinfo(user);
    }

    public void adduser(User user)
    {
        usermapper.adduser(user);
    }

	public boolean updatepwd(UserVo uservo) {
        return usermapper.updatepwd(uservo);		
	}

	public List<User> showbyname(String loginname) {
		return usermapper.showbyname(loginname);
	}
    
}
