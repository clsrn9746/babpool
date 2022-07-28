package com.babpool.chat.handler;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import javax.websocket.Session; //2022.07.07 빨간줄 떠있어서 주석처리함 -김남규

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.babpool.main.dao.ICalendarDao;
import com.babpool.main.vo.CalendarVO;
import com.babpool.member.vo.MemberVO;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class HandlerChat extends TextWebSocketHandler {

	// (<"bang_id", 방ID>, <"session", 세션>) - (<"bang_id", 방ID>, <"session", 세션>) -
	// (<"bang_id", 방ID>, <"session", 세션>) 형태
	private List<Map<String, Object>> sessionList = new ArrayList<Map<String, Object>>();

//	@RequestMapping(value = "/chatb.do")
//	public String readFile(String ppp) {
//		int bb = Integer.parseInt(ppp);
//		String file = "/home/pc31/chat_log/test" + bb + ".txt";
//
//		try {
//			byte[] bytes = Files.readAllBytes(Paths.get(file));
//			return new String(bytes);
//		} catch (Throwable e) {
//			e.printStackTrace();
//			System.out.println("파일 불러올때 에러");
//			return "";
//		}
//	}
	
	
//	@RequestMapping(value = "/chatb.do")
//	public void readFile(String ppp) {
//		int bb = Integer.parseInt(ppp);
//		FileInputStream input = null;
//
//		try {
//			File filePath = new File("/home/pc31/chat_log/test" + bb + ".txt");
//			input = new FileInputStream(filePath);
//			int i = 0;
//			while((i = input.read()) != -1) {
//				System.out.write(i);
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//			System.out.println(e);
//		}finally {
//			try {
//				input.close();
//			} catch (IOException io) {
//				io.printStackTrace();
//				System.out.println(io);
//			}
//		}
//	}
//
//	@RequestMapping(value = "/chata.do")
//	public void saveFile(String id, String message, String param) {
//		int aa = Integer.parseInt(param);
//		String msg = id + ": " + message + "\n";
//
//		File filePath = new File("/home/pc31/chat_log/test" + aa + ".txt");
//		try {
//			FileOutputStream stream = new FileOutputStream(filePath, true);
//			try {
//				stream.write(msg.getBytes("UTF-8"));
//			} catch (UnsupportedEncodingException e) {
//				e.printStackTrace();
//				System.out.println("뭔 에러인지도 모르겠다 인코딩에러냐");
//			} catch (IOException e) {
//				e.printStackTrace();
//				System.out.println("입출력 에러가 난단다");
//			}
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//			System.out.println("파일이 없단다.");
//		}
//	}
	
	
	

	// 클라이언트가 서버로 메세지 전송 처리

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		// 여기서 read 첫번째
		/*
		 * readFile(); System.out.println("100 : " + readFile().toString());
		 * System.out.println("111 : " + readFile());
		 */
		super.handleTextMessage(session, message);
		/* System.out.println("====================" + session.getId()); */
		// JSON --> Map으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, String> mapReceive = objectMapper.readValue(message.getPayload(), Map.class);
		/*
		 * readFile(); System.out.println("readFile().toString ::: " +
		 * readFile().toString()); System.out.println("readFile() ::: " + readFile());
		 */
		switch (mapReceive.get("cmd")) {

		// CLIENT 입장
		case "CMD_ENTER":
			
			// 세션 리스트에 저장
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bang_id", mapReceive.get("bang_id"));
			map.put("session", session);
			// user 정보
			map.put("user_id", mapReceive.get("user"));
			map.put("param", mapReceive.get("param"));
			map.put("nick", mapReceive.get("nick"));
			map.put("profile", mapReceive.get("profile"));
			map.put("calNo", mapReceive.get("calNo"));
			
			sessionList.add(map);
//			readFile(mapReceive.get("param"));
			// readFile하고 read
			System.out.println(mapReceive.get("user"));
			// 같은 채팅방에 입장 메세지 전송
			for (int i = 0; i < sessionList.size(); i++) {
				Map<String, Object> mapSessionList = sessionList.get(i);
				String bang_id = (String) mapSessionList.get("calNo");
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

				if (bang_id.equals(mapReceive.get("calNo"))) {
					Map<String, String> mapToSend = new HashMap<String, String>();
					mapToSend.put("bang_id", bang_id);
					mapToSend.put("cmd", "CMD_ENTER");
					mapToSend.put("enter_session", session.getId());
					// 데이터베이스 이름으로 수정
					mapToSend.put("msg", mapReceive.get("nick") + "님이 입장 했습니다.");

					String jsonStr = objectMapper.writeValueAsString(mapToSend);
					sess.sendMessage(new TextMessage(jsonStr));
				}
			}
			break;

		// CLIENT 메세지
		case "CMD_MSG_SEND":
			// 같은 채팅방에 메세지 전송
			for (int i = 0; i < sessionList.size(); i++) {
				Map<String, Object> mapSessionList = sessionList.get(i);
				String bang_id = (String) mapSessionList.get("calNo");
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

				if (bang_id.equals(mapReceive.get("calNo"))) {
					Map<String, String> mapToSend = new HashMap<String, String>();
					mapToSend.put("bang_id", bang_id);	
					mapToSend.put("cmd", "CMD_MSG_SEND");
					mapToSend.put("msg", mapReceive.get("msg"));
					mapToSend.put("user", mapReceive.get("user"));
					mapToSend.put("param", mapReceive.get("param"));
					mapToSend.put("nick", mapReceive.get("nick"));
					mapToSend.put("profile", mapReceive.get("profile"));
					mapToSend.put("calNo", mapReceive.get("calNo"));
					mapToSend.put("msg_session", session.getId());
					System.out.println(mapReceive.get("profile"));
					/* mapToSend.put("msg", session.getId() + " : " + mapReceive.get("msg")); */
//					saveFile(mapReceive.get("nick"), mapReceive.get("msg"), mapReceive.get("param"));
					String jsonStr = objectMapper.writeValueAsString(mapToSend);
					sess.sendMessage(new TextMessage(jsonStr));
				}
			}
			break;
		}
	}

	// 클라이언트가 연결을 끊음 처리
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		super.afterConnectionClosed(session, status);

		ObjectMapper objectMapper = new ObjectMapper();
		String now_bang_id = "";
//		String out_user = "";
		String out_nick = "";

		// 사용자 세션을 리스트에서 제거
		for (int i = 0; i < sessionList.size(); i++) {
			Map<String, Object> map = sessionList.get(i);
			String bang_id = (String) map.get("calNo");
			WebSocketSession sess = (WebSocketSession) map.get("session");

			if (session.equals(sess)) {
				now_bang_id = bang_id;
				sessionList.remove(map);
//				out_user = (String) map.get("user_id");
				out_nick = (String) map.get("nick");
				break;
			}
		}
		// 같은 채팅방에 퇴장 메세지 전송
		for (int i = 0; i < sessionList.size(); i++) {
			Map<String, Object> mapSessionList = sessionList.get(i);
			String bang_id = (String) mapSessionList.get("calNo");
			WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

			if (bang_id.equals(now_bang_id)) {
				Map<String, String> mapToSend = new HashMap<String, String>();
				mapToSend.put("bang_id", bang_id);
				mapToSend.put("cmd", "CMD_EXIT");
				mapToSend.put("msg", out_nick + "님이 퇴장 했습니다.");

				String jsonStr = objectMapper.writeValueAsString(mapToSend);
				sess.sendMessage(new TextMessage(jsonStr));
			}
		}

	}
}