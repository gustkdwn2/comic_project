package com.comic.service;

import java.util.List;

import com.comic.model.BoardVO;
import com.comic.model.CriteriaVO;

public interface BoardService {
	
	public void register(BoardVO board); //글등록
	
	public BoardVO get(Long board_num); // 자세히 보기
	
	public boolean modify(BoardVO board); // 수정하기
	
	public boolean remove(Long board_num); // 삭제하기
	
	public List<BoardVO> getList(CriteriaVO cri); //페이징 처리된 목록보기
	
	public int getTotal(CriteriaVO cri); // 페이징을 위한 총 합

}
