package com.comic.mapper;

import org.apache.ibatis.annotations.Param;

public interface ManagerPosMapper {
	
	public void roomstartinsert(@Param("user") String user, 
			@Param("user_status") String user_status,@Param("order_status") String order_status,
			@Param("room_num") int room_num);

	public void roomstartnstop(@Param("roomuse_id")String roomuse_id, @Param("roomuse_num")String roomuse_num, 
			@Param("roomuse_status")String roomuse_status); 		
}
