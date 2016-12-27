package com.njwangbo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class SecondInterceptor implements HandlerInterceptor
{
    
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
        throws Exception
    {
        System.out.println("SecondInterceptor  333333333333333333333");
    }
    
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
        throws Exception
    {
        System.out.println("SecondInterceptor  222222222222222222222");
    }
    
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
        throws Exception
    {
    	//获得当前请求的url
        String uri = request.getRequestURI();
        System.out.println("当前请求的路径："+uri);
        //登录的信息放在session中
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("admin");
        if(null == obj)
        {
            response.sendRedirect("/bookSystem/admin/login.action");
            return false;
        }
        return true;
    }
    
}
