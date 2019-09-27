package com.comic.mapper;

import com.comic.model.CommentsVO;

public interface CommentsMapper {
	
	public int insert(CommentsVO vo);
	
	public CommentsVO read(Long CMNT_BOARDNUM);
	
	public int delete (int CMNT_NUM);
	
	public int update(CommentsVO vo);
	
	public int getCountByCmnt_boardnum(Long CMNT_BOARDNUM);
	
	

}
