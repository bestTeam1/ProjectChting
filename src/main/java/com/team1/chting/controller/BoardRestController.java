package com.team1.chting.controller;

import com.team1.chting.dto.GroupDto;
import com.team1.chting.service.BoardService;
import com.team1.chting.utils.AdminCriteria;
import com.team1.chting.utils.Criteria;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.List;

@RestController
public class BoardRestController {

    @Autowired
    private SqlSession sqlSession;

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

        AdminCriteria cri = new AdminCriteria();

        ObjectMapper objmap = new ObjectMapper();

        String result = "";

        try {
            list = boardService.getGroupListBySearch(category, search, cri);
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
}