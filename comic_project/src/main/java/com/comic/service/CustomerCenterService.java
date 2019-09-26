package com.comic.service;

import java.util.List;

import com.comic.model.CustomerBoardVO;
import com.comic.model.CustomerCenterCriteriaVO;

public interface CustomerCenterService {
	
	public void register(CustomerBoardVO board); //글등록
	
	public CustomerBoardVO get(Long BOARD_NUM); // 자세히 보기
	
	public boolean modify(CustomerBoardVO board); // 수정하기
	
	public boolean remove(Long BOARD_NUM); // 삭제하기
	
	public List<CustomerBoardVO> getList(CustomerCenterCriteriaVO cri); //페이징 처리된 목록보기
	
	public int getTotal(CustomerCenterCriteriaVO cri); // 페이징을 위한 총 합

}
