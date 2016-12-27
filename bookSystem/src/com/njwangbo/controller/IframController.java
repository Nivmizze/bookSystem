package com.njwangbo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.njwangbo.po.Category;
import com.njwangbo.service.AdminService;
import com.njwangbo.service.CategoryService;

@Controller
@RequestMapping("/main")
public class IframController {

	
	@Autowired
    private CategoryService categoryService;
	
	 @RequestMapping("/ifram")
	    public String main(){
	        return "ifram/main";
	    }
	 @RequestMapping("/top")
	    public String top(){
	        return "ifram/top";
	    }
	 @RequestMapping("/body")
	    public String body(){
	        return "ifram/body";
	    }
	//展现left页面
	    @RequestMapping("/left")
	    public String showleft(HttpServletRequest request)
	    {
	    	HttpSession session=request.getSession();
	    	List<Category> list = categoryService.showAllCategory();
	    	System.out.println(list.size());
	    	session.setAttribute("categorys", list);
			//request.setAttribute("categorys", list);
	        return "ifram/left";
	    }
	 @RequestMapping("/search")
	    public String search(){
	        return "ifram/search";
	    }
	 @RequestMapping("/supersearch")
	    public String ssh(){
	        return "ifram/gj";
	    }
	 
	 
	 @RequestMapping("/adifram")
	    public String admain(){
	        return "adifram/admain";
	    }
	 @RequestMapping("/adtop")
	    public String adtop(){
	        return "adifram/adtop";
	    }
	 @RequestMapping("/adbody")
	    public String adbody(){
	        return "adifram/adbody";
	    }
	//展现left页面
	    @RequestMapping("/adLeft")
	    public String showLeft(HttpServletRequest request)
	    {
	    	HttpSession session=request.getSession();
	    	List<Category> list = categoryService.showAllCategory();
	    	System.out.println(list.size());
	    	session.setAttribute("categorys", list);
			//request.setAttribute("categorys", list);
	        return "adifram/adleft";
	    }
	 @RequestMapping("/adsearch")
	    public String adsearch(){
	        return "adifram/adsearch";
	    }
}
