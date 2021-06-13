package com.team1.chting.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.UserDto;
import com.team1.chting.service.BoardService;
import com.team1.chting.service.GroupService;
import org.apache.ibatis.session.SqlSession;
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
    private SqlSession sqlSession;

    @Autowired
    private BoardService boardService;

    @RequestMapping(value="banishMember.do", method= RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> banishMember (@RequestParam("banishList[]") List<String> banishList,
                                                @RequestParam("groupNo") String groupNo,
                                                @RequestParam("userid") String userid){

        boardService.banishMembers(banishList, groupNo);

        ObjectMapper objmap = new ObjectMapper();

        List<UserDto> list = null;
        String result = "";

        try {
            list = boardService.getGroupMemberList(userid);
            result = objmap.writeValueAsString(list);
            return new ResponseEntity<String>(result, HttpStatus.OK);
        } catch (Exception e) {
            return  new ResponseEntity<String>(result, HttpStatus.BAD_GATEWAY);
        }

    }
    @RequestMapping(value="succeedGroupAdmin.do", method= RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> banishMember (@RequestParam("adminUserid") String adminUserid,
                                                @RequestParam("requestUserid") String requestUserid,
                                                @RequestParam("groupNo") String groupNo){

        boardService.succeedGroupAdmin(adminUserid, requestUserid, groupNo);


        ObjectMapper objmap = new ObjectMapper();

        String resultUrl = "http://localhost:8090/chting_war_exploded/board_main.do?group_no=" + groupNo ;

        try {
            return new ResponseEntity<String>(resultUrl, HttpStatus.OK);
        } catch (Exception e) {
            return  new ResponseEntity<String>(resultUrl, HttpStatus.BAD_GATEWAY);
        }

    }

}