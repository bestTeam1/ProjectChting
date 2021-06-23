package com.team1.chting.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nimbusds.oauth2.sdk.util.date.SimpleDate;
import com.team1.chting.dto.PostDto;
import com.team1.chting.dto.PostReplyDto;
import com.team1.chting.dto.UserDto;
import com.team1.chting.service.GroupAdminService;
import com.team1.chting.service.GroupService;
import com.team1.chting.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.List;

@RestController
public class GroupRestController {

    @Autowired
    private GroupAdminService broupAdminService;

    @Autowired
    private GroupService groupService;

    @Autowired
    private UserService userService;
    /*
      모임관리 모임원강퇴
      만든이 : 이승준
      작성일 : 2021-06-12
     */
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

    /*
      모임관리 모임장위임
      만든이 : 이승준
      작성일 : 2021-06-12
     */
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


    /*
      모임관리 모임가입 승인
      만든이 : 이승준
      작성일 : 2021-06-12
     */
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
    /*
      모임관리 모임가입 거부
      만든이 : 이승준
      작성일 : 2021-06-12
     */
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

    // 글 삭제하기
    @RequestMapping(value = "board_delete.do", method = RequestMethod.GET)
    public ResponseEntity<String> delete(@RequestParam("post_no") String post_no){
        groupService.delete(Integer.parseInt(post_no));
        return new ResponseEntity<String>("", HttpStatus.OK);
    }

    /*
      댓글
      작성자 : 현상진
      작성일 : 2021-06-21
    */
    // 댓글목록
    @RequestMapping(value = "board_replyList.do", method = RequestMethod.GET)
    public List<PostReplyDto> reply_List(@RequestParam String post_no){
        List<PostReplyDto> list = groupService.getReply(Integer.parseInt(post_no));
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for(PostReplyDto dto : list) {
            dto.setFormatdate(format.format(dto.getWritedate()));
            dto.setUserid(userService.selectNickname(dto.getUserid()));
        }
        return list;
    }

    //댓글등록
    @RequestMapping(value = "board_replyWrite.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
    public ResponseEntity<String> replyInsert(@RequestBody PostReplyDto postReplyDto){
        System.out.println(postReplyDto.toString());
        try {
            groupService.replyWrite(postReplyDto);
            return new ResponseEntity<String>("", HttpStatus.OK);
        }catch (Exception e){
            System.out.println(e.getMessage());
            return new ResponseEntity<String>("", HttpStatus.BAD_REQUEST);
        }
    }

    // 댓글삭제
    @RequestMapping(value = "board_replyDelete.do", method = RequestMethod.GET)
    public ResponseEntity<String> replyDel(@RequestParam("reply_no")String reply_no){
        groupService.replyDelete(Integer.parseInt(reply_no));

        ResponseEntity<String> entity = null;
        try {
            groupService.replyDelete(Integer.parseInt(reply_no));
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        }catch (Exception e){
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    // 댓글수정
    @RequestMapping(value = "board_replyUpdate.do", method = RequestMethod.POST)
    public ResponseEntity<String> replyModify(@RequestParam("postReplyDto") PostReplyDto postReplyDto){
        groupService.replyUpdate(postReplyDto);

        ResponseEntity<String> entity = null;
        try {
            groupService.replyUpdate(postReplyDto);
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        }catch (Exception e){
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

}

