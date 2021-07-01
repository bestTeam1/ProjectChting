package com.team1.chting.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.team1.chting.dto.ChattingDto;
import com.team1.chting.service.UserService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.text.SimpleDateFormat;
import java.util.*;

@Log4j
public class ChattingEchoHandler extends TextWebSocketHandler {
    // 객체 ==> 주소      Set 중복제거.
    List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    Map<String, String> groupChattingList = new HashMap<String, String>();

    @Autowired
    private UserService userService;

    // 클라이언트에서 메세지 도착 시 호출
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String userid = userService.selectNickname(session.getPrincipal().getName());
        groupChattingList.put((String) session.getAttributes().get("group_no"), userid);
        sessionList.add(session);
        //log.info(userid + "님이 입장하셨습니다");
    }

    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        String userid = userService.selectNickname(session.getPrincipal().getName());
        ObjectMapper mapper = new ObjectMapper();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        String msg = (String) message.getPayload();
        ChattingDto dto = mapper.readValue(msg, ChattingDto.class);
        dto.setWriteDate(sdf.format(new Date()));

        String json = mapper.writeValueAsString(dto);
        for (WebSocketSession s : sessionList) {
            if (userid.equals(groupChattingList.get(dto.getGroup_no()))) {
                s.sendMessage(new TextMessage(json));
            }
        }
    }

    // 클라이언트 접속 종료 후
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        String userid = userService.selectNickname(session.getPrincipal().getName());
        groupChattingList.remove((String) session.getAttributes().get("group_no"), userid);
        sessionList.remove(session);
        //log.info(userid + "님이 퇴장하셨습니다");
    }
}
