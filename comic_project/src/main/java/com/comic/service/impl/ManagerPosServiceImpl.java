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
	
	@Override
	public void start_room(Map<String, Object> map) {

		JSONArray jsonArray = new JSONArray(); // object 타입
		String user = jsonArray.fromObject(map.get("list")).get(0).toString();
		String time = jsonArray.fromObject(map.get("list")).get(1).toString();
		String user_status = jsonArray.fromObject(map.get("list")).get(2).toString();
		String order_status = jsonArray.fromObject(map.get("list")).get(3).toString();
		String room_num = jsonArray.fromObject(map.get("list")).get(4).toString();
		
		System.out.println(user+time+user_status+order_status+room_num);
		
		managerposMapper.roomstartinsert(user, user_status, order_status, Integer.valueOf(room_num));
	}

	public void startnstop_room(String roomuse_id, String roomuse_num, String roomuse_status) {
		managerposMapper.roomstartnstop(roomuse_id, roomuse_num,roomuse_status);
		
	}

	

}
