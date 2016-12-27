package com.njwangbo.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.njwangbo.po.Book;
import com.njwangbo.po.Category;
import com.njwangbo.service.BookService;
import com.njwangbo.service.CategoryService;

@Controller
@RequestMapping("/category")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;
	@Autowired
	private BookService bookService;
	
	/** 
	 * 显示所有分类
	 * @param model
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	@RequestMapping("/category")
	public String showAllCategory(Model model)
	{
		List<Category> list = categoryService.showAllCategory();	
		model.addAttribute("categorys", list);
		return "category/category";
	}
	
	/** 
	 * 跳转到添加一级分类页面
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	@RequestMapping("/showaddcategorya")
	public String showaddCategorya()
	{
		return "category/addcategorya";
	}
	
	/** 
	 * 添加一级分类
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	@RequestMapping("/addcategorya")
	public String addCategorya(Category c)
	{
		String ran=UUID.randomUUID().toString();
    	String []cid1=ran.split("-");
    	String cid=cid1[0];
    	c.setCid(cid);
		categoryService.addCategorya(c);
		return "redirect:category.action";
	}
	
	/** 
	 * 跳转到添加二级分类页面
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	@RequestMapping("/showaddcategoryb")
	public String showaddCategoryb(Model model)
	{
		List<Category> list = categoryService.showAllCategory();	
		model.addAttribute("categorys", list);
		return "category/addcategoryb";
	}
	
	/** 
	 * 添加二级分类
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	@RequestMapping("/addcategoryb")
	public String addCategoryb(Category c)
	{
		String ran=UUID.randomUUID().toString();
    	String []cid1=ran.split("-");
    	String cid=cid1[0];
    	c.setCid(cid);
		categoryService.addCategoryb(c);
		return "redirect:category.action";
	}
	
	/** 
	 * 删除类别
	 * @param cid
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	@RequestMapping("/deletecategory")
	public String deleteCategory(String cid,HttpServletRequest request)
	{
		List<Category> list = categoryService.showCategoryByPid(cid);
		List<Book> blist = bookService.showBookByCid(cid);
		HttpSession session = request.getSession();
		if(null != list && !list.isEmpty())
		{
			session.setAttribute("defaila", "该一级分类下包含二级分类");
			return "redirect:category.action";
		}
		if(null != blist && !blist.isEmpty())
		{
			session.setAttribute("defailb", "该二级分类下包含图书");
			return "redirect:category.action";
		}
		else
		{
			categoryService.deleteCategory(cid);
			return "redirect:category.action";
		}
		
		
	}
	
	/** 
	 * 修改一级类别
	 * @param c
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	@RequestMapping("/updatecategorya")
	public String updateCategorya(Category c)
	{
		categoryService.updateCategorya(c);
		return "redirect:category.action";
	}
	
	/** 
	 * 显示一级类别
	 * @param cid
	 * @param model
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	@RequestMapping("/showcategorybycida")
	public String showCategoryByIda(String cid,Model model)
	{
		Category c = categoryService.showCategoryByCid(cid);
		model.addAttribute("updatecategorya", c);
		return "category/updatecategorya";
	}
	
	/** 
	 * 修改二级类别
	 * @param c
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	@RequestMapping("/updatecategoryb")
	public String updateCategoryb(Category c)
	{
		categoryService.updateCategoryb(c);
		return "redirect:category.action";
	}
	
	/** 
	 * 显示二级类别
	 * @param cid
	 * @param model
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	@RequestMapping("/showcategorybycidb")
	public String showCategoryByIdb(String cid,Model model)
	{

		Category c = categoryService.showCategoryByCid(cid);
		List<Category> list = categoryService.showAllCategory();	
		Category cp = categoryService.showCategoryByCid(c.getPid());
		model.addAttribute("cp", cp);
		model.addAttribute("categorys", list);
		model.addAttribute("updatecategoryb", c);
		return "category/updatecategoryb";
	}
}
