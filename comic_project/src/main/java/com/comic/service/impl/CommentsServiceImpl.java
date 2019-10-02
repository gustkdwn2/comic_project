package com.comic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comic.mapper.BoardMapper;
import com.comic.mapper.CommentsMapper;
import com.comic.model.CommentsVO;
import com.comic.service.CommentsService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class CommentsServiceImpl implements CommentsService{
	
	@Setter(onMethod_=@Autowired)
	private CommentsMapper cmapper;
	
	//@Setter(onMethod_=@Autowired)
	//private BoardMapper bmapper;
	

	@Override
	public int register(CommentsVO vo) {
		// TODO Auto-generated method stub
		log.info("\r\n##register : "+vo);
		return cmapper.insert(vo);
	}

	@Override
	public int modify(CommentsVO vo) {
		// TODO Auto-generated method stub
		log.info("\r\n##modify : "+vo);
		return cmapper.update(vo);
	}

	@Override
	public int remove(int cmnt_num) {
		// TODO Auto-generated method stub
		System.out.println(cmnt_num + "리무브comments서비스임플 ");
		return cmapper.delete(cmnt_num);
	}

	@Override
	public List<CommentsVO> getList(Long board_num) {
		// TODO Auto-generated method stub
		System.out.println(board_num + "리스트comments서비스임플 ");
		return cmapper.getList(board_num);
	}

}
