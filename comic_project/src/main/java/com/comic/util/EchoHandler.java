package com.comic.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j;
 
@Log4j
public class EchoHandler extends TextWebSocketHandler{
	
	private Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String senderId = getId(session);
		userSessions.put(senderId, session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String senderId = getId(session);
		System.out.println(senderId + "로 부터 " + message.getPayload() + " 받음");
		
		//protocol ("chat / 1 / admin / content")
		String msg = message.getPayload();
		if(!StringUtils.isEmpty(msg)) {
			String[] strs = msg.split(",");
			if(strs != null && strs.length == 4) {
				String cmd = strs[0];
				String roomNumber = strs[1];
				String checkInOut = strs[2];
				String content = strs[3];
				
				WebSocketSession adminSession = userSessions.get("admin");
				WebSocketSession roomSession = userSessions.get(roomNumber);
				System.out.println(adminSession);
				if("user".equals(checkInOut)) {
					roomSession.sendMessage(new TextMessage(roomNumber + "|" + content));
				}
				
				if("admin".equals(checkInOut)) {
					adminSession.sendMessage(new TextMessage(roomNumber + "|" + content));
				}
			}
		}
	}
	
	private String getId(WebSocketSession session) {
		Map<String, Object> httSession = session.getAttributes();
		String returnId = "";
		
		if(!StringUtils.isEmpty(httSession.get("admin"))) {
			returnId = httSession.get("admin").toString();
			return returnId + "order";
		} else if(!StringUtils.isEmpty(httSession.get("roomNum"))){
			returnId = httSession.get("roomNum").toString();
			return returnId + "order"; 
		} else {
			returnId = "null";
			return returnId;
		}
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		userSessions.remove(getId(session));
		log.info(session.getId() + " 연결 끊김");
	}
	
}
