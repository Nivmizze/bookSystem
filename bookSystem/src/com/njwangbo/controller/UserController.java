package com.njwangbo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.njwangbo.po.User;
import com.njwangbo.service.UserService;
import com.njwangbo.util.Md5Util;
import com.njwangbo.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController
{
    @Autowired
    private UserService userservice;

    @RequestMapping("/welcome")
    public String login(){
        return "user/login";
    }    
    /*@RequestMapping("/gopwd")
    public String changepwd(){
    	return "user/pwd";
    }*/
   
    @RequestMapping("/goregist")
    public String goRegist(Model model){
    	String ran=UUID.randomUUID().toString();
    	System.out.println(ran);
    	String []uid1=ran.split("-");
    		String uid=uid1[0];
    		model.addAttribute("uid",uid);
            System.out.println(uid);
        return "user/regist";
    }
    @RequestMapping("/userlogin")
    public String userlogin(User user,Model model,HttpServletRequest request){
       HttpSession session=request.getSession();
       List<User>list=userservice.showbyinfo(user);
       String loginname=user.getLoginname();
       String loginpass =user.getLoginpass();
       if(list.size()>0){
       User loginuser=list.get(0);
       System.out.println(loginname);
       session.setAttribute("loginname", loginname);
       session.setAttribute("loginuser", loginuser);
       session.setAttribute("loginpass", loginpass);
       }
       
       String vCode=(String)session.getAttribute("vCode");
       String v=request.getParameter("verifyCode");
       if(v.equalsIgnoreCase(vCode)){
    	   if(list!=null&&!list.isEmpty()){
    		   User user1=list.get(0);
    		   String uid=user1.getUid();
    		   session.setAttribute("uid", uid);
    		   session.setAttribute("vcodeerror", "");
    		   
    		   session.setAttribute("vcodeerror1", "");
    		   session.setAttribute("loginerror", "");
    	 	System.out.println(uid);
    	 	return "redirect:/main/ifram.action";
    	   }else{
    		   session.setAttribute("vcodeerror", "*帐号密码错误");
    		   return "redirect:/user/welcome.action";
    	   }
       }else{
    	   session.setAttribute("vcodeerror", "*验证码错误");
		   return "redirect:/user/welcome.action";
       }
    }
    @RequestMapping("/userregist")
    public String userRegister(User user,Model model,HttpServletRequest request){
    	HttpSession session=request.getSession();
    	 String vCode=(String)session.getAttribute("vCode");
         String v=request.getParameter("verifyCode");
         if(v.equalsIgnoreCase(vCode)){
        	 userservice.adduser(user);
         }
         else{
        	 
        	 return "redirect:/user/goregist.action";
         }
    	
       
       
       
       return "user/login";
    }
    
   /* @RequestMapping("changepwd")
    public String changepwd(UserVo uservo,HttpServletRequest request){
    	
    	HttpSession session=request.getSession();
    	//登录密码
    	String Loginpass = (String)session.getAttribute("loginpass");
    	//页面原密码
        String loginpass = request.getParameter("loginpass");
    	String verifyCode = request.getParameter("verifyCode");
    	String vCode=(String)session.getAttribute("vCode");
    	System.err.println("修改======================="+Loginpass+loginpass+vCode+verifyCode);
    	if(loginpass.equals(Loginpass)){
    		if(verifyCode.equalsIgnoreCase(vCode)){
    			userservice.updatepwd(uservo);
    			session.setAttribute("loginuser", null);
    			session.setAttribute("loginname", "");
	    		return "redirect:/user/welcome.action";
    		}
    		else{
    			//验证码
    			session.setAttribute("vcodeerror1", "验证码输入有误");
    			return "redirect:/user/gopwd.action";
    		}
    	}else{
    	  session.setAttribute("loginerror", "原密码输入有误");
    	  return "redirect:/user/gopwd.action";
    	}
    }*/
 // 修改密码
    @RequestMapping("/gopwd")
    public String updatpassword()
    {
        return "user/updatepassword";
    }
    
    // 修改密码操作
    @RequestMapping("/surepassword")
    public String surepassword(HttpServletRequest request, UserVo uservo)
    {
        HttpSession session = request.getSession();
        // 原始密码
        String password = request.getParameter("password");
        System.out.println("原始密码" + password);
        
        // 新密码
        String newpassword = request.getParameter("loginpass");
        System.out.println("新密码" + newpassword);
        
        // 数据库取得密码
        User u = (User)session.getAttribute("loginuser");
        String loginpass = u.getLoginpass();
        
        System.out.println("asdad" + loginpass);
        if (loginpass != null && loginpass.equals(password))
        {
            UserVo us = new UserVo();
            // 设置新的密码
            us.setNewpass(newpassword);
            us.setLoginpass(password);
            // 更新密码
            boolean flag = userservice.updatepwd(us);
            if (flag)
            {
                session.removeAttribute("loginuser");
                session.setAttribute("newpassword", newpassword);
                return "redirect:/user/welcome.action";
            }
            else
            {
                session.setAttribute("pwdError", "密码修改失败");
                return "redirect:updatepassword.action";
            }
        }
        else
        {
            session.setAttribute("pwdError", "原密码不正确");
            return "redirect:updatepassword.action";
        }
    }
    
    // 验证码比较
    @RequestMapping("/ajaxvcode")
    public void ajaxvc(HttpServletRequest request, HttpServletResponse response, String vv)
        throws IOException
    {
        
        String verycodea = (String)request.getSession().getAttribute("vCode");
        PrintWriter out = response.getWriter();
        if (vv.equalsIgnoreCase(verycodea))
        {
            out.print("1");
        }
        else
        {
            out.print("2");
        }
        out.flush();
        out.close();
    }
    
    // 页面上的原密码和登录时的密码比较,ajax写的
    @RequestMapping("/ypwd")
    public void ypwd(HttpServletRequest request, User user, HttpServletResponse response, String pp)
        throws IOException
    {
        HttpSession session = request.getSession();
        // 数据库取得密码
        User u = (User)session.getAttribute("loginuser");
        String loginpass = u.getLoginpass();
        System.out.println("数据库密码"+loginpass);
        //给页面上获得的那个密码加密
        PrintWriter out = response.getWriter();
        if (pp != null && pp.equals(loginpass))
        {
            out.print("1");
        }
        else
        {
            out.print("2");
        }
        out.flush();
        out.close();
    }
    
    @RequestMapping("/ajaxusername")
    public void ajaxusername(String loginname,HttpServletRequest request,User user,HttpServletResponse response) throws IOException
    {
        //从数据取的用户名
      List<User> list=   userservice.showbyname(loginname);
      System.out.println("**************************");
      PrintWriter out = response.getWriter();
      if(list !=null)
      {
          //用户名已经存在
          out.print("2");
      }
      else{
          //用户名不存在
          out.print("1");
      }
      out.flush();
      out.close();
    }
}
