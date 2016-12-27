package com.njwangbo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.njwangbo.po.Admin;
import com.njwangbo.service.AdminService;


@Controller
@RequestMapping("/admin")
public class AdminController
{   
    @Autowired
    private AdminService as;
    
    @RequestMapping("/login")
    public String adminlogin(){
        return "admin/adminlogin";
    }
    
    @RequestMapping("/loginpanduan")
    public String selectAdmin(@ModelAttribute("admin")Admin admin,Model model,HttpServletRequest request){
    	HttpSession session=request.getSession();
        List<Admin> list = as.findAdminByNameAndPwd(admin);
        String error = "帐号或密码输入错误，请重新输入！";
        if(list.isEmpty()){
            model.addAttribute("error", error);
            return "admin/adminlogin";
        }
        String name=list.get(0).getAdminname();
    	session.setAttribute("adname", name);
    	session.setAttribute("admin", admin);
        return "redirect:/main/adifram.action";
    }
    
    
}
