package com.comic.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.comic.model.BookAttachVO;

public interface BookAttachMapper {
	
	public void insert(BookAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BookAttachVO> findByBookName(String book_name);
	
}
