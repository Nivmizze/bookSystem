package com.njwangbo.controller;

import java.util.List;

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
@RequestMapping("/searchbook")
public class SearchController
{  
    @Autowired
    private BookService bookService;
    @Autowired
    private CategoryService  categoryService;
    
    //跳到高级搜索
   @RequestMapping("/accuratesearch") 
   public String accurateSearch()
   {
       return "searchbook/accurateselect";
   }
   
 /*  @RequestMapping("/showonebook")
   public String showonebook()
   {
       return "searchbook/describlebook";
   }*/
   
 //展示一个图书的详情信息
   @RequestMapping("/showbookbybid")
   public String showBookByBid(String bid,Model model)
   {
       Book b = bookService.showBookByBid(bid);
       List<Category> list = categoryService.showAllCategory();    
       model.addAttribute("categorys", list);
       model.addAttribute("bookbybid", b);
       return "searchbook/describlebook";
   }
   //点击左边的第二级查找到所有的书籍
  /* @RequestMapping("/findbook")
   public String findbook()
   {
       return "searchbook/showallbook";
   }*/
   /** 
    * 根据cid查询图书
    * @param cid 分类编号
    * @param model
    * @return
    * @see [类、类#方法、类#成员]
    */
   //点击左边的第二级查找到所有的书籍
  //左侧分栏的分页查询
   @RequestMapping("/showbookbycid")
   public String showBookByCid(String cid,HttpServletRequest request)
   { 
       HttpSession session = request.getSession();
       //page是客户端向服务器发送的数据
      String pageNum =  request.getParameter("pageNum");
      System.out.println("========================================");
      System.out.println("我的pagenum"+pageNum);
      Book book = new Book();
      book.setCid(cid);
      //最大的页数
      int maxPage = bookService.showMaxPageNumByCid(book);
      System.out.println(maxPage);
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
       List<Book> list = bookService.showBookByCidPage(book);
         session.setAttribute("bookbycid", list);
         session.setAttribute("curPage", curPage);
         session.setAttribute("maxPage", maxPage);
         session.setAttribute("cid", cid);
       return "searchbook/showallbook";
   }
   
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
       
       
       List<Book> books = bookService.showAllBookBySome(book);
       session.setAttribute("bname", bname);
       session.setAttribute("author", author);
       session.setAttribute("press", press);
       session.setAttribute("curPage", curPage);
       session.setAttribute("booklist", books);
       session.setAttribute("maxPage", maxPage);
       return "searchbook/accuratenum";
   }
}
