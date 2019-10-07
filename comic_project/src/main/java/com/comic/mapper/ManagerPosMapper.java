package com.comic.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.comic.model.RoomuseVO;

public interface ManagerPosMapper {
	public void roomstart(@Param("roomuse_id")String roomuse_id, @Param("roomuse_num")String roomuse_num, 
			@Param("roomuse_status")String roomuse_status); 		
	public void roomstop(@Param("roomuse_num")String roomuse_num);
	
	public List<RoomuseVO> roomuselist();
	
	public List<RoomuseVO> roomuselist2();
}
