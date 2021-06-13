package com.team1.chting.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.team1.chting.dto.UserDto;
import com.team1.chting.service.GroupAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class GroupRestController {

    @Autowired
    private GroupAdminService broupAdminService;

    //모임원 강퇴
    @RequestMapping(value="banishMember.do", method= RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> banishMember (@RequestParam("banishList[]") List<String> banishList,
                                                @RequestParam("groupNo") String groupNo,
                                                @RequestParam("userid") String userid){

        broupAdminService.banishMembers(banishList, groupNo);

        ObjectMapper objmap = new ObjectMapper();

        List<UserDto> list = null;
        String result = "";

        try {
            list = broupAdminService.getGroupMemberList(userid);
            result = objmap.writeValueAsString(list);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch (Exception e) {
            return  new ResponseEntity<String>(result, HttpStatus.BAD_GATEWAY);
        }

    }

    //모임장 위임
    @RequestMapping(value="succeedGroupAdmin.do", method= RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> banishMember (@RequestParam("adminUserid") String adminUserid,
                                                @RequestParam("requestUserid") String requestUserid,
                                                @RequestParam("groupNo") String groupNo){

        //위임하려는 멤버가 이미 모임장인 모임이 있는지 체크
        boolean check = broupAdminService.duplicateGroupAdminCheck(requestUserid);

        if(check == true) { // 모임장인 모임이 이미있다(모임장 위임불가능 상태)
            String alertMsg = "false";
            return new ResponseEntity<String>(alertMsg,HttpStatus.OK);
        } else { //위임장인 모임이 없다(모임장 위임 가능상태)
            //모임장 위임
            broupAdminService.succeedGroupAdmin(adminUserid, requestUserid, groupNo);
            String resultUrl = "http://localhost:8090/chting_war_exploded/board_main.do?group_no=" + groupNo;
            return new ResponseEntity<String>(resultUrl, HttpStatus.OK);
        }
    }


    //가입신청 승인
    @RequestMapping(value="joinAccept.do", method= RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> joinAccept(@RequestParam("requestList[]") List<String> requestList, @RequestParam("groupNo") String groupNo){
        broupAdminService.acceptMembers(requestList, groupNo);
        List<UserDto> list = null;

        ObjectMapper objmap = new ObjectMapper();

        String result = "";

        try {
            list = broupAdminService.getGroupJoinRequest(groupNo);
            result = objmap.writeValueAsString(list);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch (Exception e) {
            return  new ResponseEntity<String>(result, HttpStatus.BAD_GATEWAY);
        }

    }
    //가입신청 거부
    @RequestMapping(value="joinDeny.do", method= RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> joinDeny(@RequestParam("requestList[]") List<String> requestList, @RequestParam("groupNo") String groupNo){
        broupAdminService.deleteRequest(requestList, groupNo);
        List<UserDto> list = null;

        ObjectMapper objmap = new ObjectMapper();

        String result = "";

        try {
            list = broupAdminService.getGroupJoinRequest(groupNo);
            result = objmap.writeValueAsString(list);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch (Exception e) {
            return  new ResponseEntity<String>(result, HttpStatus.BAD_GATEWAY);
        }

    }

}