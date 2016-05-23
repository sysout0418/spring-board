package com.nbreds.projectPlanning.common.util;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@ServerEndpoint("/chat")
public class ChattingServer {
	
	private static final Logger logger = LoggerFactory.getLogger(ChattingServer.class);

	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		logger.info("message : " + message);
		synchronized (clients) {
			// 같은 세션이 아닐 경우에만 ui단으로 다시 메세지 전송
			for (Session client : clients) {
				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}

	@OnOpen
	public void onOpen(Session session) {
		// 세션 추가
		logger.info("session : " + session);
		clients.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		// 연결된 세션 제거
		clients.remove(session);
	}
	
}
