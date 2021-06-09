package com.team1.chting.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.team1.chting.dto.EventDto;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.NoticeDto;
import com.team1.chting.dto.UserDto;
import com.team1.chting.service.EventService;
import com.team1.chting.service.GroupService;
import com.team1.chting.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class AjaxRestController {
    @Autowired
    private GroupService groupService;

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private EventService eventService;

    //노출여부가 활성화된 이벤트
    @RequestMapping(value="/main/event", method=RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> enabledEvent() {
        List<EventDto> list = null;
        ObjectMapper objmap = new ObjectMapper();
        String result = "";
        try {
            list = eventService.enabledEvent();
            result = objmap.writeValueAsString(list);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch(Exception e) {
            System.out.println(e.getMessage());
            return new ResponseEntity<String>(result, HttpStatus.BAD_REQUEST);
        }
    }

    //공지사항 2개
    @RequestMapping(value="/main/notice", method=RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> recentlyNotice(){
        List<NoticeDto> list = null;
        ObjectMapper objmap = new ObjectMapper();
        String result = "";
        try {
            list = noticeService.recentlyNotice();
            result = objmap.writeValueAsString(list);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch(Exception e){
            System.out.println(e.getMessage());
            return new ResponseEntity<String>(result, HttpStatus.BAD_REQUEST);
        }
    }

    //비로그인 -> 랜덤모임 10개
    @RequestMapping(value="/main/nologin", method= RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> randomGroup(){
        List<GroupDto> list = null;
        ObjectMapper objmap = new ObjectMapper();
        String result = "";
        try {
            list = groupService.randomGroup();
            result = objmap.writeValueAsString(list);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch(Exception e){
            System.out.println(e.getMessage());
            return new ResponseEntity<String>(result, HttpStatus.BAD_REQUEST);
        }
    }

    //로그인 -> 지역모임 5개
    @RequestMapping(value="/main/loginedArea", method= RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> areaGroup(){
        List<GroupDto> list = null;
        ObjectMapper objmap = new ObjectMapper();
        String result = "";
        try {
            list = groupService.areaGroup("031", "002");
            result = objmap.writeValueAsString(list);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return new ResponseEntity<String>(result, HttpStatus.BAD_REQUEST);
        }
    }

    //로그인 -> 관심사모임 5개
    @RequestMapping(value="/main/loginedCatecode", method= RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> catecodeGroup(){
        List<GroupDto> list = null;
        ObjectMapper objmap = new ObjectMapper();
        String result = "";
        try {
            list = groupService.catecodeGroup("testuser");
            result = objmap.writeValueAsString(list);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return new ResponseEntity<String>(result, HttpStatus.BAD_REQUEST);
        }
    }
}
