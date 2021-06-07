package com.team1.chting.controller;

import com.team1.chting.dto.AreaDto;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.service.BoardService;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class BoardRestController {

    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private BoardService boardService;


    //비동기 Searching
    @RequestMapping(value="searchButton.do",produces = "application/text; charset=utf8")
    public String groupSearch(@RequestParam("category") String category, @RequestParam("search") String search) {
        System.out.println("searchButton.do 들어옴");
        System.out.println(category);
        System.out.println(search);
    /*    if(category.equals("전체")) {
            System.out.println("전체네?");
            category = "";
            System.out.println("카테고리 : " + category);
        }*/

        List<GroupDto> groupList = boardService.getGroupListBySearch(category, search);

        System.out.println("boardService 통과");
        System.out.println("띠용?" + groupList);

        String msg = "";

        return msg;
    }


}