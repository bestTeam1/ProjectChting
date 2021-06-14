package com.team1.chting.controller;

import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.UserDto;
import com.team1.chting.service.GroupAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class GroupAdminController {

    @Autowired
    private GroupAdminService groupAdminService;

    //모임관리(가입신청관리 페이지 이동)
    @RequestMapping(value = "groupJoin.do", method = RequestMethod.GET)
    public String groupJoin(@RequestParam("userid") String userid, Model model) {

        //로그인한 유저가 속해있는
        GroupDto adminGroup = groupAdminService.getAdminGroup(userid);
        String groupNo = adminGroup.getGroup_no();
        if(groupNo == null) { //모임장으로 속해있는 모임이 없다면?
            return "group/group_error/HasNoGroupError"; //모임장없음 에러페이지로 이동
        }
        List<UserDto> groupJoinRequest = groupAdminService.getGroupJoinRequest(groupNo);

        model.addAttribute("groupNo", groupNo);
        model.addAttribute("groupJoinRequest", groupJoinRequest);

        return "group/group_management/groupJoin";
    }

    //모임관리(멤버관리 페이지 이동)
    @RequestMapping(value = "groupMemberManage.do", method = RequestMethod.GET)
    public String groupMemberManage(@RequestParam("userid") String userid, Model model) {

        GroupDto adminGroup = groupAdminService.getAdminGroup(userid);
        String groupNo = adminGroup.getGroup_no();
        List<UserDto> groupMemberList = groupAdminService.getGroupMemberList(userid);

        model.addAttribute("groupNo", groupNo);
        model.addAttribute("userid", userid);
        model.addAttribute("groupMemberList", groupMemberList);

        return "group/group_management/groupMemberManage";
    }

    //모임관리(블랙리스트 페이지 이동)
    @RequestMapping(value = "groupBlackListManage.do", method = RequestMethod.GET)
    public String groupBlackListManage(Model model) {

        return "group/group_management/groupBlackListManage";
    }

    //모임관리(모임해산 페이지 이동)
    @RequestMapping(value = "groupDisband.do", method = RequestMethod.GET)
    public String groupDisband(@RequestParam("userid") String userid, Model model) {

        //유저가 모임장으로 있는 모임번호 가져오기위한 groupDto
        GroupDto groupDto = groupAdminService.getAdminGroup(userid);
        String groupNo = groupDto.getGroup_no();
        //모임 이름 가져오기 위한 groupDto
        groupDto = groupAdminService.getAdminGroupName(groupNo);


        model.addAttribute("groupName", groupDto.getGroup_name());
        model.addAttribute("userid", userid);

        return "group/group_management/groupDisband";
    }

    //모임관리(모임해산 기능)
    @RequestMapping(value = "groupDisbandOk.do", method = RequestMethod.GET)
    public String groupDisbandOk(@RequestParam("userid") String userid, Model model) {

        //유저가 모임장으로 있는 모임번호 가져오기위한 groupDto
        GroupDto groupDto = groupAdminService.getAdminGroup(userid);
        //모임 이름 가져오기 위한 groupDto
        groupAdminService.groupDisbandOk(groupDto.getGroup_no());

        model.addAttribute("groupName", groupDto.getGroup_name());
        model.addAttribute("userid", userid);

        return "group/group_management/groupDisband";
    }
}