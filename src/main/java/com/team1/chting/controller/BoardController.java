package com.team1.chting.controller;

import com.team1.chting.dto.AreaDto;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;

    //모임추천
   @RequestMapping(value = "groupRecommend.do", method = RequestMethod.GET)
    public String groupMain(Model model) {

        List<AreaDto> areaList = boardService.getAreaList();
        List<GroupDto> newGroupList = boardService.newGroupList();

        model.addAttribute("newGroupList", newGroupList);
        model.addAttribute("areaList", areaList);

        return "group/group";
    }

    //모임만들기
    @RequestMapping(value = "groupMake.do", method = RequestMethod.GET)
    public String groupMake(Model model) {

        List<AreaDto> areaList = boardService.getAreaList();

        model.addAttribute("areaList", areaList);

        return "group/groupMake";
    }


}