package com.comic.service.impl.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comic.mapper.CustomerCenterBoardMapper;
import com.comic.model.CustomerBoardVO;
import com.comic.model.CustomerCenterCriteriaVO;
import com.comic.service.CustomerCenterService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CustomerCenterServiceImpl implements CustomerCenterService {
	
	@Setter(onMethod_=@Autowired)
	private CustomerCenterBoardMapper mapper;

	@Override
	public void register(CustomerBoardVO board) {
		//// TODO Auto-generated method stub
		log.info("\r\n#### register #####"+board);
		
		mapper.insert(board);
		
		//원래 책에는 insertSelectKey를 이용하는데 그냥 insert문을 이용했다.
		
	}

	@Override
	public CustomerBoardVO get(Long BOARD_NUM) {
		// TODO Auto-generated method stub
		
		log.info("\r\n#### get #####"+BOARD_NUM);
		
		return mapper.read(BOARD_NUM);
	}

	@Override
	public boolean modify(CustomerBoardVO board) {
		
		log.info("\r\n#### modify #####"+board);
		
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long BOARD_NUM) {
		// TODO Auto-generated method stub
		
		log.info("\r\n#### remove #####"+BOARD_NUM);
		
		return mapper.delete(BOARD_NUM) == 1;
	}

	@Override
	public List<CustomerBoardVO> getList(CustomerCenterCriteriaVO cri) {
		// TODO Auto-generated method stub
		
		log.info("\r\n#### get list with criteria #####"+cri);
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(CustomerCenterCriteriaVO cri) {
		
		log.info("\r\n#### get total count #####"+cri);
		
		return mapper.getTotalCount(cri);
	}

}
