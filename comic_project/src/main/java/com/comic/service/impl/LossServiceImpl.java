package com.comic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comic.mapper.LossMapper;
import com.comic.mapper.SettlementMapper;
import com.comic.model.LossVO;
import com.comic.service.LossService;

import lombok.Setter;

@Service
public class LossServiceImpl implements LossService {

	@Setter(onMethod_ = @Autowired)
	private LossMapper lossMapper;
	
	@Override
	public List<LossVO> lossList() {
		return lossMapper.lossList();
	}

}
