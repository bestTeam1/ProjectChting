package com.team1.chting.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.team1.chting.dto.DiaryCalDto;
import com.team1.chting.dto.DiaryDto;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.service.BoardService;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

@RestController
public class BoardRestController {

    @Autowired
    private BoardService boardService;


    /*
      모임검색
      만든이 : 이승준
      작성일 : 2021-06-08
     */
    @RequestMapping(value="searchButton.do", method= RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> searchGroup(@RequestParam("category") String category, @RequestParam("search") String search){

        List<GroupDto> list = null;

        ObjectMapper objmap = new ObjectMapper();

        String result = "";

        try {
            list = boardService.getGroupListBySearch(category, search);
            int list_size = 0;
            for(GroupDto dto : list) {
                //System.out.println(dto.toString());
            }
            result = objmap.writeValueAsString(list);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch(Exception e){
            //System.out.println(e.getMessage());
            return new ResponseEntity<String>(result, HttpStatus.BAD_GATEWAY);
        }
    }

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
    모임 일정 수정
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

}