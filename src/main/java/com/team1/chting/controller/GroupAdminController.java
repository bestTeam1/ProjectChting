package com.team1.chting.controller;

import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.SessionDto;
import com.team1.chting.dto.UserDto;
import com.team1.chting.service.BoardService;
import com.team1.chting.service.GroupAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class GroupAdminController {

    @Autowired
    private GroupAdminService groupAdminService;

    @Autowired
    private BoardService boardService;

    /*
      모임관리 첫페이지 모임가입신청 리스트
      만든이 : 이승준
      작성일 : 2021-06-10
     */
    @RequestMapping(value = "groupJoin.do", method = RequestMethod.GET)
    public String groupJoin(HttpServletRequest request, Model model) {

        HttpSession session = request.getSession();
        SessionDto sessionDto = (SessionDto) session.getAttribute("userData");
        if(sessionDto == null) {// 비로그인유저
            return "sign/login";
        }
        String userid = sessionDto.getUserid();



        //로그인한 유저가 속해있는
        GroupDto adminGroup = groupAdminService.getAdminGroup(userid);
        String groupNo = adminGroup.getGroup_no();
        if(groupNo == null) { //모임장으로 속해있는 모임이 없다면?
            return "error/HasNoGroupError"; //모임장없음 에러페이지로 이동
        }
        List<UserDto> groupJoinRequest = groupAdminService.getGroupJoinRequest(groupNo);
        model.addAttribute("group_no", groupNo);
        model.addAttribute("groupJoinRequest", groupJoinRequest);

        return "group/group_management/groupJoin";
    }

    /*
      모임관리 멤버관리 페이지이동
      만든이 : 이승준
      작성일 : 2021-06-10
     */
    @RequestMapping(value = "groupMemberManage.do", method = RequestMethod.GET)
    public String groupMemberManage(HttpServletRequest request, Model model) {

        HttpSession session = request.getSession();
        SessionDto sessionDto = (SessionDto) session.getAttribute("userData");
        if(sessionDto == null) {// 비로그인유저
            return "sign/login";
        }
        String userid = sessionDto.getUserid();

        GroupDto adminGroup = groupAdminService.getAdminGroup(userid);
        String groupNo = adminGroup.getGroup_no();
        List<UserDto> groupMemberList = groupAdminService.getGroupMemberList(userid);

        model.addAttribute("group_no", groupNo);
        model.addAttribute("userid", userid);
        model.addAttribute("groupMemberList", groupMemberList);

        return "group/group_management/groupMemberManage";
    }

    /*
      모임관리 모임해산 페이지 이동
      만든이 : 이승준
      작성일 : 2021-06-11
     */
    @RequestMapping(value = "groupDisband.do", method = RequestMethod.GET)
    public String groupDisband(HttpServletRequest request, Model model) {

        HttpSession session = request.getSession();
        SessionDto sessionDto = (SessionDto) session.getAttribute("userData");
        if(sessionDto == null) {// 비로그인유저
            return "sign/login";
        }
        String userid = sessionDto.getUserid();

        //유저가 모임장으로 있는 모임번호 가져오기위한 groupDto
        GroupDto groupDto = groupAdminService.getAdminGroup(userid);
        String groupNo = groupDto.getGroup_no();

        if(groupNo == null) { //페이지 이동 시도시 모임장으로 속한 모임이 없다면 모임장없음 에러페이지로 이동
            return "error/HasNoGroupError";
        }

        //모임 이름 가져오기 위한 groupDto
        groupDto = groupAdminService.getAdminGroupName(groupNo);

        model.addAttribute("group_no", groupNo);
        model.addAttribute("groupName", groupDto.getGroup_name());
        model.addAttribute("userid", userid);

        return "group/group_management/groupDisband";
    }

    /*
      모임관리 모임해산 기능
      만든이 : 이승준
      작성일 : 2021-06-11
     */
    @RequestMapping(value = "groupDisbandOk.do", method = RequestMethod.GET)
    public String groupDisbandOk(HttpServletRequest request) {

        HttpSession session = request.getSession();
        SessionDto sessionDto = (SessionDto) session.getAttribute("userData");
        if(sessionDto == null) {// 비로그인유저
            return "sign/login";
        }
        String userid = sessionDto.getUserid();

        //유저가 모임장으로 있는 모임번호 가져오기위한 groupDto
        GroupDto groupDto = groupAdminService.getAdminGroup(userid);
        String groupNo = groupDto.getGroup_no();

        groupAdminService.groupDisbandOk(groupNo);

        return "redirect:myGroup.do";
    }

    /*
      모임 정보 수정 페이지(GET)
      만든이 : 박주현
      작성일 : 2021-06-23
     */
    @RequestMapping(value = "groupUpdate.do", method = RequestMethod.GET)
    public String groupUpdate(Model model,
                              @RequestParam("group_no") String groupNo) {

        model.addAttribute("groupInfo", groupAdminService.getGroupInfo(groupNo));
        model.addAttribute("areaList", boardService.getAreaList());
        return "group/groupUpdate";
    }

    /*
      모임 정보 수정 처리(POST)
      만든이 : 박주현
      작성일 : 2021-06-23
     */
    @RequestMapping(value = "groupUpdate.do", method = RequestMethod.POST)
    public String groupUpdateOk(Model model,
                                GroupDto groupDto,
                                HttpServletRequest request) throws Exception {

        String groupNo = groupDto.getGroup_no();
        //System.out.println("groupDto :" +groupDto);

        groupAdminService.updateGroup(groupDto, request);

        return "redirect:board_main.do?group_no="+groupNo;
    }
}