package com.team1.chting.controller;

import com.team1.chting.dao.GroupDao;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.service.BoardService;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class BoardController {

    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private BoardService boardService;

    @RequestMapping(value = "group01.do", method = RequestMethod.GET)
    public String groupMain(Model model) {
        List<GroupDto> newList = boardService.newGroupList();
        List<GroupDto> bestList = boardService.bestGroupList();

        model.addAttribute("newList", newList);
        model.addAttribute("bestList", bestList);

        return "group/group";
    }
}
