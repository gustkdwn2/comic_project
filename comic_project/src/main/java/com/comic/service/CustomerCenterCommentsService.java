package com.comic.service;

import java.util.List;

import com.comic.model.CustomerCenterCriteriaVO;
import com.comic.model.CustomerCommentsVO;

public interface CustomerCenterCommentsService {
	
	public int register(CustomerCommentsVO vo);
	public CustomerCommentsVO get(int CMNT_NUM);
	public int modify(CustomerCommentsVO vo);
	public int remove(int CMNT_NUM);
	public List<CustomerCommentsVO> getList(CustomerCenterCriteriaVO cri, Long CMNT_BOARDNUM);
	

}
