package com.njwangbo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwangbo.mapper.BookMapper;
import com.njwangbo.po.Book;
import com.njwangbo.service.BookService;
@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookMapper bookMapper;
	public List<Book> showAllBook() {
		return bookMapper.findAllBook();
	}
	public void addBook(Book b) {
		bookMapper.addBook(b);
	}
	public void deleteBook(String bid) {
		bookMapper.deleteBook(bid);
	}
	public void updateBook(Book b) {
		bookMapper.updateBook(b);
	}
	public Book showBookByBid(String bid) {
		return bookMapper.findBookByBid(bid);
	}
	public List<Book> showBookByCid(String cid) {
		return bookMapper.findBookByCid(cid);
	}
	
	public List<Book> showBookByCidPage(Book b) {
		return bookMapper.findBookByCidPage(b);
	}
	public int showMaxPageNumByCid(Book b) {
		int count = bookMapper.getCountByCid(b);
		return count % 4 == 0 ? count / 4 : count / 4 + 1;
	}
    public List<Book> showAllBookBySome(Book book)
    {
        return  bookMapper.showAllBookBySome(book);
       
    }
    public int showMaxpage(Book book)
    {
      int count =  bookMapper.AllCount(book);
      
        return count % 4 == 0 ? count / 4 : count / 4 + 1;
    }
	public boolean updatebstatus(String bid) {
		return bookMapper.updatebstatus(bid);
	}

}
