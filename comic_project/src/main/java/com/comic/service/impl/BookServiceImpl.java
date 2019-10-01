package com.comic.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.comic.mapper.BookMapper;
import com.comic.model.BookVO;
import com.comic.service.BookService;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BookServiceImpl implements BookService {
	
	private BookMapper mapper;
	
	@Override
	public List<BookVO> bookGetList() {
		return mapper.bookGetList();
	}

	@Override
	public BookVO bookGet(String book_name) {
		return mapper.bookRead(book_name);
	}

	@Override
	public void bookRegister(BookVO vo) {
		mapper.bookInsert(vo);
	}

	@Override
	public boolean bookModify(BookVO vo) {
		return mapper.bookUpdate(vo) == 1;
	}

	@Override
	public boolean bookRemove(String book_name) {
		return mapper.bookDelete(book_name) == 1;
	}

	@Override
	public BookVO bookNameCheck(String book_name) {
		return mapper.bookNameCheck(book_name);
	}
	
}
