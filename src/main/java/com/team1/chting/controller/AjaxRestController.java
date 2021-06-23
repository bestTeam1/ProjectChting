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
import org.springframework.security.core.parameters.P;
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
    private NoticeService noticeService;

    @Autowired
    private EventService eventService;

    @Autowired
    private UserService userService;

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
            for(GroupDto dto : list) {
                if(dto.getGroup_img() == null) {
                    dto.setGroup_img("default.jpg");
                }
            }
            result = objmap.writeValueAsString(list);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch(Exception e){
            System.out.println(e.getMessage());
            return new ResponseEntity<String>(result, HttpStatus.BAD_REQUEST);
        }
    }

    //로그인 -> 지역모임 5개
    @RequestMapping(value="/main/loginedArea/{userid}", method= RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> areaGroup(@PathVariable String userid){
        List<GroupDto> list = null;
        ObjectMapper objmap = new ObjectMapper();
        UserDto userDto = userService.selectAreacode(userid);
        String result = "";
        try {
            list = groupService.areaGroup(userid);
            for(GroupDto dto : list) {
                if(dto.getGroup_img() == null) {
                    dto.setGroup_img("default.jpg");
                }
            }
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
            list = groupService.catecodeGroup(userid);
            for(GroupDto dto : list) {
                if(dto.getGroup_img() == null) {
                    dto.setGroup_img("default.jpg");
                }
            }
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
            list = groupService.userGroupList(userid);
            result = objmap.writeValueAsString(list);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return new ResponseEntity<String>(result, HttpStatus.BAD_REQUEST);
        }
    }


    @RequestMapping(value = "/group/main", method = RequestMethod.GET)
    public ResponseEntity<String> selectGroupRoleNo(@RequestParam("userid") String userid, @RequestParam("group_no") String group_no) {
        String result = "";
        try {
            result = groupService.selectGroupRoleNo(userid, group_no);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return new ResponseEntity<String>(result, HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping(value = "/side/authority", method = RequestMethod.GET)
    public ResponseEntity<String> sideGroupRoleNo(@RequestParam("userid") String userid, @RequestParam("group_no") String group_no) {
        String result = "";
        try {
            result = groupService.selectGroupRoleNo(userid, group_no);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return new ResponseEntity<String>(result, HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping(value = "/group/insert", method = RequestMethod.POST, produces = "application/text; charset=utf8")
    public ResponseEntity<String> insertGroupJoinRequest(@RequestBody JoinRequestDto dto) {
        System.out.println(dto.toString());
        int result = groupService.insertGroupJoinRequest(dto);
        if(result > 0) {
            return new ResponseEntity<String>("success", HttpStatus.OK);
        } else if(result == -1) {
            return new ResponseEntity<String>("warning", HttpStatus.OK);
        } else {
            return new ResponseEntity<String>("error", HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping(value = "/group/insert", method = RequestMethod.DELETE, produces = "application/text; charset=utf8")
    public ResponseEntity<String> deleteGroupUserRole(@RequestBody GroupUserRoleDto dto) {
        int result = groupService.deleteGroupUserRole(dto);

        if(result > 0) {
            return new ResponseEntity<String>("success", HttpStatus.OK);
        } else {
            return new ResponseEntity<String>("error", HttpStatus.BAD_REQUEST);
        }
    }
}
