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
public class EchoHandlerOrder extends TextWebSocketHandler{
	
	private Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String senderId = getId(session);
		System.out.println("senderId : "  + senderId);
		userSessions.put(senderId, session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String senderId = getId(session);
		System.out.println(senderId + "로 부터 " + message.getPayload() + " 받음");
		
		//protocol : cmd, 작성자(방번호), admin  ex: (1,주문)
		String msg = message.getPayload();
		if(!StringUtils.isEmpty(msg)) {
			String[] strs = msg.split(",");
			if(strs != null) {
				String roomNumber = strs[0];
				String content = strs[1];
				String memberid = strs[2];
				
				WebSocketSession adminSession = userSessions.get("admin");
				WebSocketSession roomSession = userSessions.get(roomNumber);

				if("주문".equals(content)) {
					adminSession.sendMessage(new TextMessage(roomNumber + "|" + content+ "|" + memberid));
				} else if("시작".equals(content)) {
					adminSession.sendMessage(new TextMessage(roomNumber + "|" + content + "|" + memberid));
				}
				
			}
		}
	}
	
	private String getId(WebSocketSession session) {
		Map<String, Object> httSession = session.getAttributes();
		String returnId = "";
		
		if(!StringUtils.isEmpty(httSession.get("admin"))) {
			returnId = httSession.get("admin").toString();
			return returnId;
		} else if(!StringUtils.isEmpty(httSession.get("roomNum"))){
			returnId = httSession.get("roomNum").toString();
			return returnId;
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
