package com.comic.service.impl;

import java.util.Map;

import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comic.mapper.ManagerPosMapper;
import com.comic.service.ManagerPosService;

import lombok.Setter;

@Service
public class ManagerPosServiceImpl implements ManagerPosService {
	
	@Setter(onMethod_ = @Autowired)
	private ManagerPosMapper managerposMapper;
	
	

	public void start_room(String roomuse_id, String roomuse_num, String roomuse_status) {
		managerposMapper.roomstart(roomuse_id, roomuse_num,roomuse_status);
	}

	public void stop_room(String roomuse_num) {
		managerposMapper.roomstop(roomuse_num);
		
	}



	

	

}
