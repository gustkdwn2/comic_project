package com.comic.mapper;

import java.util.List;

import com.comic.model.CustomerBoardVO;
import com.comic.model.CustomerCenterCriteriaVO;

public interface CustomerCenterBoardMapper {
	
//	public List<CustomerBoardVO> getList();
	
	public void insert(CustomerBoardVO board);
	
//	public void insertSelectKey(CustomerBoardVO board);
	
	public int delete(Long BOARD_NUM);
	
	public int update(CustomerBoardVO board);
	
	public CustomerBoardVO read(Long BOARD_NUM);
	
	public List<CustomerBoardVO> getListWithPaging(CustomerCenterCriteriaVO cri);
	
	public int getTotalCount(CustomerCenterCriteriaVO cri);

}
