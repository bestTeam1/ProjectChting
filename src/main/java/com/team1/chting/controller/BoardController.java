package com.team1.chting.controller;

import com.team1.chting.dao.UserDao;
import com.team1.chting.dto.AreaDto;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.UserDto;
import com.team1.chting.service.BoardService;
import com.team1.chting.service.UserService;
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

    @RequestMapping(value = "groupRecommend.do", method = RequestMethod.GET)
    public String groupMain(Model model) {

        List<AreaDto> areaList = boardService.getAreaList();
        List<GroupDto> newGroupList = boardService.newGroupList();

        model.addAttribute("newGroupList", newGroupList);
        model.addAttribute("areaList", areaList);

        return "group/group";
    }
  
    @RequestMapping(value = "groupJoin.do", method = RequestMethod.GET)
    public String groupJoin(Model model) {

        return "group/group_management/groupJoin";
    }

    @RequestMapping(value = "groupMemberManage.do", method = RequestMethod.GET)
    public String groupMemberManage(Model model) {
/*
        List<GroupDto> groupMemberList = boardService.getGroupMemberList();

        model.addAttribute("groupMemberList", groupDtoList);*/

        return "group/group_management/groupMemberManage";
    }

    @RequestMapping(value = "groupBlackListManage.do", method = RequestMethod.GET)
    public String groupBlackListManage(Model model) {

        return "group/group_management/groupBlackListManage";
    }

    @RequestMapping(value = "groupDisband.do", method = RequestMethod.GET)
    public String groupDisband(Model model) {

        return "group/group_management/groupDisband";
    }


    /*
    모임 만들기
    작성자 : 김영허
    작성일 : 2021-06-09
    */
    @RequestMapping(value = "groupMake.do", method = RequestMethod.GET)
    public String groupMake(Model model) {

        List<AreaDto> areaList = boardService.getAreaList();

        model.addAttribute("areaList", areaList);

        return "group/groupMake";
    }

    /*
    모임 관심사 팝업창 띄우기
    작성자 : 김영허
    작성일 : 2021-06-11
    */

    @RequestMapping(value = "groupMake_Popup.do", method = RequestMethod.GET)
    public String groupMake_Popup(Model model) {

       List<UserDto> groupInterest = boardService.getGroupInterest();

       model.addAttribute("groupInterest", groupInterest);

        return "group/groupMake_Popup";
    }

}