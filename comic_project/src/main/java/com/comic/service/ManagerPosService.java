package com.comic.service;

import java.util.Map;

public interface ManagerPosService {
	public void start_room(Map<String, Object> map);
	public void startnstop_room(String roomuse_id, String roomuse_num, String roomuse_status);
}
