package com.njwangbo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	private BookService bookService;
	@Autowired
	private CategoryService categoryService;
	
	/** 
	 * 显示图书管理界面
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	@RequestMapping("/book")
	public String showManageBook()
	{
		
		return "book/book";
	}
	
	/** 
	 * 显示添加图书界面
	 * @param model
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	@RequestMapping("/showaddbook")
	public String showaddBook(Model model)
	{
		List<Category> list = categoryService.showAllCategory();	
		model.addAttribute("categorys", list);
		return "book/addbook";
	}
	
	/** 
     * 分类下拉列表框传值
	 * @param cid
	 * @param response
	 * @throws IOException
	 * @see [类、类#方法、类#成员]
	 */
	@RequestMapping("/ajax")
	public void ajax(String cid,HttpServletResponse response) throws IOException
	{
		List<Category> list = categoryService.showCategoryByPid(cid);
		StringBuffer str = new StringBuffer();
        for(int i=0;i<list.size();i++){
            str.append(list.get(i).getCid()+","+list.get(i).getCname()+",");
        }
        String s=str.toString();
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(s);
        out.flush();
        out.close();
	}
	
	/** 
	 * 添加图书
	 * @param b
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	@RequestMapping("/addbook")
	public String addBook(Book b)
	{
		String ran=UUID.randomUUID().toString();
    	String []bid1=ran.split("-");
    	String bid=bid1[0];
    	b.setBid(bid);
		bookService.addBook(b);
		return "book/addsuccess";
	}
	
	/** 
	 * 删除图书
	 * @param bid
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	@RequestMapping("/deletebook")
	public String deleteBook(String bid)
	{
		bookService.deleteBook(bid);
		return "book/deletesuccess";
	}
	
	/** 
	 * 修改图书
	 * @param b
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	@RequestMapping("/updatebook")
	public String updateBook(Book b)
	{
		bookService.updateBook(b);
		return "book/updatesuccess";
	}
	
	/** 
	 * 根据bid查询图书
	 * @param bid 图书编号
	 * @param model
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	@RequestMapping("/showbookbybid")
	public String showBookByBid(String bid,Model model)
	{
		Book b = bookService.showBookByBid(bid);
		Category c2 = categoryService.showCategoryByCid(b.getCid());
		c2.getCname();//二级分类名称
		Category c1 = categoryService.showCategoryByCid(c2.getPid());
		c1.getCname();//一级分类名称
		List<Category> list = categoryService.showAllCategory();	
		model.addAttribute("categorys", list);
		model.addAttribute("bookbybid", b);
		model.addAttribute("bca", c1.getCname());//一级分类名称
		model.addAttribute("bcb", c2.getCname());//二级分类名称
		return "book/editbook";
	}
	
	/** 
	 * 根据cid查询图书
	 * @param cid 分类编号
	 * @param model
	 * @return
	 * @see [类、类#方法、类#成员]
	 */

	@RequestMapping("/showbookbycid")
	public String showBookByCid(String cid,HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		Book b = new Book();
		b.setCid(cid);
		int maxPage = bookService.showMaxPageNumByCid(b);//最大页数
		System.out.println("==============================================");
		System.out.println(maxPage);
		String pageNum = request.getParameter("pageNum");
		int curPageNum;//显示当前页码
		if(null == pageNum || "".equals(pageNum))
		{
			curPageNum = 1;
		}
		else
		{
			curPageNum = Integer.parseInt(pageNum);
			if(curPageNum < 1)
			{
				curPageNum = 1;
			}
			if(curPageNum > maxPage && maxPage != 0 )
			{
				curPageNum = maxPage;
			}
		}
		System.out.println(curPageNum);
		int curPageNuma = (curPageNum-1)*4;
		System.out.println(curPageNuma);
		Book book = new Book();
		book.setCid(cid);
		book.setNum(curPageNuma);
		//book.setPageNum(curPageNuma);
		List<Book> list = bookService.showBookByCidPage(book);
		session.setAttribute("bookbycid", list);
		session.setAttribute("curPage", curPageNum);
		session.setAttribute("maxPage", maxPage);
		
		
		session.setAttribute("cid", cid);
		return "book/bookbycid";
	}
	
	/** 
	 * 跳转到模糊查询页面
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	@RequestMapping("/searchbook")
	public String searchBook()
	{
		return "book/accurateselect";
		
	}
	
	/** 
	 * 模糊分页查询
	 * @param request
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	@RequestMapping("/allbookcount")
	public String allbookcount(HttpServletRequest request)
	{
	    HttpSession session = request.getSession();
	    String bname = request.getParameter("bname");
	    String author = request.getParameter("author");
	    String press = request.getParameter("press");
	    //page是客户端向服务器发送的数据
	    String pageNum = request.getParameter("page");
	    Book book=new Book();
	    book.setBname(bname);
	    book.setAuthor(author);
	    book.setPress(press);
	    //每页显示多少个
	    int maxPage = bookService.showMaxpage(book);
	    //当前要显示的页码
	    int curPage ;
	    if(null==pageNum ||"".equals(pageNum))
	    {
	        curPage = 1;
	    }else{
	        int page = Integer.parseInt(pageNum);
	        curPage = page;
	        if(curPage<1)
	        {
	            curPage=1;
	        }
	        if(curPage>maxPage)
	        {
	            curPage =  maxPage;
	        }
	    }
	    book.setNum((curPage-1)*4);
	   // book.setPageNum((curPage-1)*4);
	    
	    List<Book> books = bookService.showAllBookBySome(book);
	    session.setAttribute("bname", bname);
	    session.setAttribute("author", author);
        session.setAttribute("press", press);
	    session.setAttribute("curPage", curPage);
	    session.setAttribute("booklist", books);
	    session.setAttribute("maxPage", maxPage);
        return "book/accuratenum";
	    
	}
	/**
	 * @param book
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/cbstatus")
	public void cbstatus(String bid,HttpServletResponse response) throws IOException{
		bookService.updatebstatus(bid);
		System.out.println(bid+"LLLLLLLLLLLLLLLLLL");
		response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println("已下架");
        out.flush();
        out.close();
	}
}
