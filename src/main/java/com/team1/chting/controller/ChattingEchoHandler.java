package com.team1.chting.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.team1.chting.dto.ChattingDto;
import lombok.extern.log4j.Log4j;
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
    //Set<WebSocketSession> clients = new HashSet<WebSocketSession>();
    List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
/*

    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        String payloadMessage = (String) message.getPayload();
        ObjectMapper objectMapper = new ObjectMapper();
        LinkedHashMap paramData = objectMapper.readValue(payloadMessage, LinkedHashMap.class);
        paramData.put("regDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss SSS Z").format(new Date()));
        System.out.println("서버에 도착한 메시지 : " + paramData);

        clients.add(session);

        for (WebSocketSession s : clients) {
            s.sendMessage(
                    new TextMessage(
                            session.getId()
                                    + "\n"
                                    + objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(paramData)
                                    + "\n-------------------------"
                    )
            );
        }
    }

    // 클라이언트에서 메세지 도착 시 호출
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        super.afterConnectionEstablished(session);
        System.out.println("클라이언트 접속됨");
    }

    // 클라이언트 접속 종료 후
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        super.afterConnectionClosed(session, status);
        System.out.println(status.getReason());
        System.out.println("클라이언트 접속 해제");
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        super.handleTransportError(session, exception);
        System.out.println("전송오류 발생" + exception.getMessage());
    }
*/



    // 클라이언트에서 메세지 도착 시 호출
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessionList.add(session);

        log.info(session.getPrincipal().getName() + "님이 입장하셨습니다");
    }

    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        log.info(session.getPrincipal().getName() + " : " + message );
        ChattingDto dto = new ChattingDto();
        ObjectMapper mapper = new ObjectMapper();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
        String json = "";

        dto.setUserid(session.getPrincipal().getName());
        dto.setMessage((String)message.getPayload());
        dto.setWriteDate(sdf.format(new Date()));
        json = mapper.writeValueAsString(dto);

        for(WebSocketSession s : sessionList) {
            s.sendMessage(new TextMessage(json));
        }
    }

    // 클라이언트 접속 종료 후
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessionList.remove(session);

        log.info(session.getPrincipal().getName() + "님이 퇴장하셨습니다");
    }
}
