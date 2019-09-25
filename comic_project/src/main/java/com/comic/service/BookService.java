package com.comic.service;

import java.util.List;

import com.comic.model.BookVO;

public interface BookService {
	
	public List<BookVO> bookGetList();
	
	public BookVO bookGet(String book_name);
	
	public void bookRegister(BookVO vo);
	
	public boolean bookModify(BookVO vo);
	
	public boolean bookRemove(String book_name);
	
}
