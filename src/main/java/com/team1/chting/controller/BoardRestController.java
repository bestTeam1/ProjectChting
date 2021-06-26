package com.team1.chting.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.team1.chting.dto.DiaryCalDto;
import com.team1.chting.dto.DiaryDto;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.PostReplyDto;
import com.team1.chting.service.BoardService;
import com.team1.chting.service.GroupService;
import com.team1.chting.service.UserService;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

@RestController
public class BoardRestController {

    @Autowired
    private BoardService boardService;

    @Autowired
    private GroupService groupService;

    @Autowired
    private UserService userService;

    /*
      모임일정추가
      만든이 : 이승준
      작성일 : 2021-06-23
     */
    @RequestMapping(value="board_diaryOk.do", method= RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> searchGroup(@RequestParam("group_no") String group_no,
                                              @RequestParam("type") String type,
                                              @RequestParam("date") String date,
                                              @RequestParam("content") String content,
                                              @RequestParam("location") String location,
                                              @RequestParam("subject") String subject,
                                              @RequestParam("xcoord") Double xcoord,
                                              @RequestParam("ycoord") Double ycoord     ){
        //받아온 String date를 sql.date 에 맞게 변환
        Date dateFormat = Date.valueOf(date);

        DiaryDto diaryDto = new DiaryDto();

        diaryDto.setGroup_no(group_no);
        diaryDto.setStartdate(dateFormat);
        diaryDto.setType(type);
        diaryDto.setLocation(location);
        diaryDto.setContent(content);
        diaryDto.setSubject(subject);
        diaryDto.setXcoord(xcoord);
        diaryDto.setYcoord(ycoord);

        System.out.println(diaryDto);

        int result = boardService.insertDiary(diaryDto);

        if (result==0) {
            System.out.println("board_diaryOk error. result is 0");
            return new ResponseEntity<String>("false", HttpStatus.BAD_GATEWAY);
        } else {
            System.out.println("board_diaryOk success. result is 1");
            return new ResponseEntity<String>("true", HttpStatus.OK);
        }
    }
    /*
      모임일정로드
      만든이 : 이승준
      작성일 : 2021-06-23
     */
    @RequestMapping(value="board_diaryEvents.do", method= RequestMethod.POST, produces = "application/json")
    public ResponseEntity<String> diaryEvents(@RequestParam("group_no") String group_no){
        List<DiaryCalDto> diaryList = boardService.getDiaryList(group_no);

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        for (int i = 0; i < diaryList.size(); i++) {
            diaryList.get(i).setStart(diaryList.get(i).getStart().split(" ")[0]);
        }

        ObjectMapper objmap = new ObjectMapper();

        try {
            String diaryListJson = objmap.writeValueAsString(diaryList);
            System.out.println(diaryListJson);
            return new ResponseEntity<String>(diaryListJson, HttpStatus.OK);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return new ResponseEntity<String>("false", HttpStatus.BAD_GATEWAY);
    }
    /*
    모임 일정 상세보기
    작성자 : 이승준
    2021-06-24
    */
    @RequestMapping(value="board_diary_detail.do", method= RequestMethod.POST, produces = "application/json")
    public ResponseEntity<String> diaryDetail(@RequestParam("group_no") String group_no,
                                              @RequestParam("schedule_no") String schedule_no){

        //가져온 그룹넘버와 스케줄번호로 조회
        DiaryDto diaryDto = boardService.getDiaryDetail(group_no, schedule_no);

        System.out.println(diaryDto);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        diaryDto.setCalDate(format.format(diaryDto.getStartdate()));


        ObjectMapper objmap = new ObjectMapper();

        try {
            String diaryToJson = objmap.writeValueAsString(diaryDto);
            return new ResponseEntity<String>(diaryToJson, HttpStatus.OK);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return new ResponseEntity<String>("false", HttpStatus.BAD_GATEWAY);
    }

    /*
    모임 일정 삭제
    작성자 : 이승준
    2021-06-24
    */
    @RequestMapping(value="board_diary_delete.do", method= RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> diaryDelete(@RequestParam("group_no") String group_no,
                                              @RequestParam("schedule_no") String schedule_no) {

        //가져온 그룹넘버와 스케줄번호로 조회
        try {
            boardService.deleteDiary(group_no, schedule_no);
            return new ResponseEntity<String>("true", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("false", HttpStatus.BAD_GATEWAY);
        }
    }

    /*
    모임 일정 날짜변경(드래그앤드롭)
    작성자 : 이승준
    2021-06-24
    */
    @RequestMapping(value="board_diary_modify.do", method= RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> diaryDelete(@RequestParam("group_no") String group_no,
                                              @RequestParam("modifyDate") String modifyDate,
                                              @RequestParam("schedule_no") String schedule_no) {

        //가져온 그룹넘버와 스케줄번호로 조회
        try {
            boardService.modifyDiary(group_no, schedule_no, modifyDate);
            return new ResponseEntity<String>("true", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("false", HttpStatus.BAD_GATEWAY);
        }
    }


    // 글 삭제하기
    @RequestMapping(value = "board_delete.do", method = RequestMethod.GET)
    public ResponseEntity<String> delete(@RequestParam("post_no") String post_no, String page, Model model){
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
    public ResponseEntity<String> replyModify(PostReplyDto postReplyDto){
        ResponseEntity<String> entity = null;
        try {
            groupService.replyUpdate(postReplyDto);
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        }catch (Exception e){
            System.out.println(e.getMessage());
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

}