package com.team1.chting.controller;

import com.team1.chting.dto.AreaDto;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.UserDto;
import com.team1.chting.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String groupJoin(@RequestParam("userid") String userid, Model model) {

        //로그인한 유저가 속해있는
        GroupDto adminGroup = boardService.getAdminGroup(userid);
        String groupNo = adminGroup.getGroup_no();
        if(groupNo == null) { //모임장으로 속해있는 모임이 없다면?
            return "group/group_error/HasNoGroupError"; //모임장없음 에러페이지로 이동
        }
        List<UserDto> groupJoinRequest = boardService.getGroupJoinRequest(groupNo);

        model.addAttribute("groupNo", groupNo);
        model.addAttribute("groupJoinRequest", groupJoinRequest);

        return "group/group_management/groupJoin";
    }

    @RequestMapping(value = "groupMemberManage.do", method = RequestMethod.GET)
    public String groupMemberManage(@RequestParam("userid") String userid, Model model) {

        GroupDto adminGroup = boardService.getAdminGroup(userid);
        String groupNo = adminGroup.getGroup_no();
        List<UserDto> groupMemberList = boardService.getGroupMemberList(userid);

        model.addAttribute("groupNo", groupNo);
        model.addAttribute("groupMemberList", groupMemberList);

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


    @RequestMapping(value = "groupMake.do", method = RequestMethod.GET)
    public String groupMake(Model model) {

        List<AreaDto> areaList = boardService.getAreaList();

        model.addAttribute("areaList", areaList);

        return "group/groupMake";
    }


}