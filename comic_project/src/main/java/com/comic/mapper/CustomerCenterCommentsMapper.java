package com.comic.mapper;

import com.comic.model.CustomerCommentsVO;

public interface CustomerCenterCommentsMapper {
	
	public int insert(CustomerCommentsVO vo);
	
	public CustomerCommentsVO read(Long CMNT_BOARDNUM);
	
	public int delete (int CMNT_NUM);
	
	public int update(CustomerCommentsVO vo);
	
	public int getCountByCmnt_boardnum(Long CMNT_BOARDNUM);
	
	

}
