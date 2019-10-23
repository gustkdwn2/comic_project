package com.comic.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comic.mapper.ChattingMapper;
import com.comic.model.ChatVO;
import com.comic.service.ChattingService;

import lombok.Setter;

@Service
public class ChattingServiceImpl implements ChattingService{

	@Setter(onMethod_ = @Autowired)
	private ChattingMapper chattingmapper;
	
	@Override
	public void chatAdd(ChatVO vo) {
		chattingmapper.chatAdd(vo);
	}

}
