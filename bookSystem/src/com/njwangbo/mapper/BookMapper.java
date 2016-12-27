package com.njwangbo.mapper;

import java.util.List;

import com.njwangbo.po.Book;

/**
 * <一句话功能简述>
 *  
 * @author  
 * @version  [V1.00, 2016-11-9]
 * @see  [相关类/方法]
 * @since V1.00
 */
public interface BookMapper {

	/** 
	 * 查询所有图书
	 * @return 图书集合
	 * @see [类、类#方法、类#成员]
	 */
	public List<Book> findAllBook();
	
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
	public Book findBookByBid(String bid);
	
	/** 
	 * 根据cid查询图书
	 * @param cid
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public List<Book> findBookByCid(String cid);
	
	/** 
	 * 根据cid分页查询图书
	 * @param b
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public List<Book> findBookByCidPage(Book b);
	
	/** 
	 * 根据cid查询图书的数量
	 * @param b
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public int getCountByCid(Book b);
	
	/** 
	 * 根据高级搜索和cid来实现分页
	 * <功能详细描述>
	 * @param b
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public List<Book> showAllBookBySome(Book book);
	
	/** 
	 * 查询高级搜索---搜索图书的数量
	 * <功能详细描述>
	 * @param b
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public int AllCount(Book b);
	
	
	/**
	 * 下架书籍
	 * @param book
	 * @return
	 */
	public boolean updatebstatus(String bid);
}
