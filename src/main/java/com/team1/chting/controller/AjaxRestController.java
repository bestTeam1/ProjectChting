package com.team1.chting.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.team1.chting.dto.*;

import com.team1.chting.service.GroupService;
import com.team1.chting.service.UserService;
import com.team1.chting.service.EventService;
import com.team1.chting.service.GroupService;
import com.team1.chting.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
public class AjaxRestController {
    @Autowired
    private GroupService groupService;
  
    @Autowired
    private UserService userService;

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

    /*
    회원 탈퇴
    작성자 : 박주현
    작성일 : 2021-06-09
    */
    @RequestMapping(value="delAcount.do",produces = "application/text; charset=utf8")
    public void deleteAcount(@RequestParam("userid") String userid) {

        System.out.println("deleteAcount ajax 들어옴");
        System.out.println("userid : " +userid);

        userService.delAcount(userid);
    }

    /*
    회원 정보 수정 처리(POST)- user_info UPDATE
    작성자 : 박주현
    작성일 : 2021-06-09
    */
    @RequestMapping(value = "userUpdate.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
    public String updateUser(Model model,
                                 @RequestBody UserDto userDto) {

        System.out.println(userDto);
        userService.updateUser(userDto);

        return "user/userUpdate";
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
    @RequestMapping(value="/main/loginedCatecode/{userid}", method= RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> catecodeGroup(@PathVariable String userid){
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

    //사이드바, 로그인유저 -> 자신이 속한 그룹리스트
    @RequestMapping(value="/side/groupList/{userid}", method=RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> userGroupList(@PathVariable String userid){
        List<GroupDto> list = null;
        ObjectMapper objmap = new ObjectMapper();
        String result = "";
        try {
            list = groupService.userGroupList("testuser");
            result = objmap.writeValueAsString(list);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return new ResponseEntity<String>(result, HttpStatus.BAD_REQUEST);
        }
    }
}
