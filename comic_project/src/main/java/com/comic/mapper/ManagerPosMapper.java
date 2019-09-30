package com.comic.mapper;

import org.apache.ibatis.annotations.Param;

public interface ManagerPosMapper {
	


	public void roomstart(@Param("roomuse_id")String roomuse_id, @Param("roomuse_num")String roomuse_num, 
			@Param("roomuse_status")String roomuse_status); 		
	public void roomstop(@Param("roomuse_num")String roomuse_num);
}
