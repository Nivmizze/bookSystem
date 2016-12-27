package com.njwangbo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AccessInterceptor implements HandlerInterceptor
{
    
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
        throws Exception
    {
        
    }
    
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
        throws Exception
    {
        
    }
    
    //拦截请求
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
        throws Exception
    {
        //获得当前请求的url
        String uri = request.getRequestURI();
        System.out.println("当前请求的路径："+uri);
        //登录的信息放在session中
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("loginuser");
        if(null == obj)
        {
            response.sendRedirect("/bookSystem/user/welcome.action");
            return false;
        }
        return true;
    }
    
}
