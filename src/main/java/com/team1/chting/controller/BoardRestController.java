package com.team1.chting.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.team1.chting.dto.AreaDto;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.service.BoardService;
import org.apache.commons.compress.utils.Lists;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
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
}