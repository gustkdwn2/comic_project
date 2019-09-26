package com.comic.mapper;

import org.apache.ibatis.annotations.Param;

public interface ManagerPosMapper {
	
	public int room_start_insert(@Param("user") String user, @Param("sysdate") int sysdate,
			@Param("user_status") String user_status,@Param("order_status") String order_status,
			@Param("room_num") int room_num);

}
