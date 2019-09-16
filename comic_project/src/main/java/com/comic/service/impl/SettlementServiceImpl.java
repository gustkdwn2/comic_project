package com.comic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comic.mapper.SettlementMapper;
import com.comic.model.ProductVO;
import com.comic.service.SettlementService;

import lombok.Setter;


@Service
public class SettlementServiceImpl implements SettlementService {
	
	@Setter(onMethod_ = @Autowired)
	private SettlementMapper settleMapper;

	@Override
	public List<ProductVO> settlementList() {
		return settleMapper.settlementList();
	}
}
