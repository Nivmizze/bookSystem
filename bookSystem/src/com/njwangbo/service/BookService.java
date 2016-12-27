package com.njwangbo.service;

import java.util.List;

import com.njwangbo.po.Book;

/**
 * 
 * @author  王一航
 * @version  [V1.00, 2016-11-9]
 * @see  [相关类/方法]
 * @since V1.00
 */
/**
 * <一句话功能简述>
 *  
 * @author  王一航
 * @version  [V1.00, 2016-11-18]
 * @see  [相关类/方法]
 * @since V1.00
 */
public interface BookService {

	/** 
	 * 查询所有图书
	 * @return 图书集合
	 * @see [类、类#方法、类#成员]
	 */
	public List<Book> showAllBook();
	
	/** 
	 * 添加图书
	 * @param b
	 * @see [类、类#方法、类#成员]
	 */
	public void addBook(Book b);
	
	/** 
	 * 根据bid删除图书
	 * @param bid
	 * @see [类、类#方法、类#成员]
	 */
	public void deleteBook(String bid);
	
	/** 
	 * 修改图书
	 * @param b
	 * @see [类、类#方法、类#成员]
	 */
	public void updateBook(Book b);
	
	/** 
	 * 根据bid查询图书
	 * @param bid
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public Book showBookByBid(String bid);
	
	/** 
	 * 根据cid查询图书
	 * @param cid
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public List<Book> showBookByCid(String cid);
	
	/** 
	 * 根据cid分页查询图书
	 * @param b
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public List<Book> showBookByCidPage(Book b);
	
	/** 
	 * 获得根据cid分页查询图书的最大页数
	 * @param b
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public int showMaxPageNumByCid(Book b);
	
	
	/** 
	 * 高级搜索
	 * <功能详细描述>
	 * @param ao
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public List<Book> showAllBookBySome(Book book);
	
	/** 
	 * 高级搜索最大页数
	 * <功能详细描述>
	 * @param book
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public int showMaxpage(Book book);
	
	/**
	 * 下架
	 * @param bstatus
	 * @return
	 */
	public boolean updatebstatus(String bid);
}
