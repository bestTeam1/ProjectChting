package com.team1.chting.controller;

import com.team1.chting.dto.*;
import com.team1.chting.service.GroupAdminService;
import com.team1.chting.service.GroupService;
import com.team1.chting.service.HomeService;
import com.team1.chting.utils.AdminCriteria;
import com.team1.chting.utils.PageMaker;
import com.team1.chting.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class GroupUserController {

    @Autowired
    private GroupService groupservice;

    @Autowired
    private UserService userService;

    @Autowired
    private GroupAdminService groupAdminService;

    @Autowired
    private HomeService homeService;

    // 내 모임 페이지
    @RequestMapping(value = "myGroup.do", method = RequestMethod.GET)
    public String groupMain(HttpServletRequest httpServletRequest, Model model) {

        //로그인한 세션의 userid
        HttpSession session = httpServletRequest.getSession();
        SessionDto sessionDto = (SessionDto) session.getAttribute("userData");
        if(sessionDto == null) {// 비로그인유저
            return "sign/login";
        }
        String userid = sessionDto.getUserid();


        List<EventDto> eventList = homeService.getEventList();

        //모임장으로 있는 모임의 모임번호 가져오기
        GroupDto groupAdminDto = groupAdminService.getAdminGroup(userid);
        String groupNo = groupAdminDto.getGroup_no();
        GroupDto groupDto = userService.getAdminGroup(groupNo);

        //모임원으로 있는 모임들 가져오기
        List<GroupDto> groupList = userService.getGroupList(userid);

        //가입한 모든 모임 가져오기 (모임장,모임원)
        List<GroupDto> groupListAll = userService.getGroupListAll(userid);
        int length = groupListAll.size();

        //카테
        List<GroupDto> newGroupByCate = userService.getNewGroupByCate(userid);
        List<GroupDto> bestGroupByCate = userService.getBestGroupByCate(userid);

        model.addAttribute("adminGroup", groupDto);
        model.addAttribute("eventList", eventList);
        model.addAttribute("groupList", groupList);
        model.addAttribute("newGroupList", newGroupByCate);
        model.addAttribute("bestGroupList", bestGroupByCate);
        model.addAttribute("length", length);
        model.addAttribute("groupListAll", groupListAll);

        return "board/board_total";
    }

    /*
      모임 메인
      작성자 : 현상진
      작성일 : 2021-06-18
    */
    @RequestMapping(value = "board_main.do", method = RequestMethod.GET)
    public String groupMain(@RequestParam("group_no") String group_no, Model model, HttpServletRequest request) {
        GroupDto dto = groupservice.groupByGroup_no(group_no);

        String userid = "";

        //로그인한 세션의 userid
        HttpSession session = request.getSession();
        SessionDto sessionDto = (SessionDto) session.getAttribute("userData");
        if(sessionDto == null) {// 비로그인유저
            userid = "AnonymousNonLoginUser";
        } else {
            userid = sessionDto.getUserid();
        }

        //가입한 모든 모임 가져오기 (모임장,모임원)
        List<GroupDto> groupListAll = userService.getGroupListAll(userid);
        int length = groupListAll.size();

        //모임장으로 있는 모임의 모임번호 가져오기
        GroupDto groupAdminDto = groupAdminService.getAdminGroup(userid);
        String groupNo = groupAdminDto.getGroup_no();

        GroupDto groupDto = userService.getAdminGroup(groupNo);


        //가입한 회원 수
        int joinUser = groupAdminService.getJoinUser(group_no);
        model.addAttribute("joinUser", joinUser);
        model.addAttribute("group_no", group_no);
        model.addAttribute("adminGroup", groupDto);
        model.addAttribute("group", dto);
        model.addAttribute("length", length);
        model.addAttribute("groupListAll", groupListAll);

        return "board/board_main";
    }
    
    // 게시물 리스트
    @RequestMapping(value = "board_list.do", method = RequestMethod.GET)
    public String postList(@RequestParam("group_no") String group_no, HttpServletRequest request , AdminCriteria cri, Model model) throws Exception {

        //로그인한 세션의 userid
        HttpSession session = request.getSession();
        SessionDto sessionDto = (SessionDto) session.getAttribute("userData");
        String userid = sessionDto.getUserid();

        //모임원인지 체크, true = 모임원
        boolean check = groupservice.checkMember(group_no, userid);

        if(check == false) {
            return "error/hasNoRoleError";
        }

        cri.setGroupNo(group_no);
        // 전체 글 개수
        model.addAttribute("plist", groupservice.listCriPost(cri));
        //List<PostDto> postList = groupservice.getPostList(group_no);

        PageMaker pm = new PageMaker();
        pm.setCri(cri);
        pm.setTotalCount(groupservice.pageCountPost(group_no));

        // model.addAttribute("postList", postList);
        model.addAttribute("pm", pm);
        model.addAttribute("group_no", group_no);

        return "board/board_list";
    }

    //글쓰기
    @RequestMapping(value = "board_write.do", method = RequestMethod.GET)
    public String groupWrite(String group_no, Model model) {
        // public String groupWrite(PostDto postDto, @RequestParam("group_no") String group_no, Model model){
        // model.addAttribute("postDto", postDto);

        List<PostCategoryDto> postCategoryList = groupservice.getPostCategory();
        model.addAttribute("postCategory",postCategoryList);

        model.addAttribute("group_no", group_no);
        return "board/board_write";
    }

    // 글쓰기 post
    @RequestMapping(value = "board_writeOk.do", method = RequestMethod.POST, consumes = {"multipart/form-data"})
    public String groupWriteOk(PostDto postDto, Model model, HttpServletRequest httpServletRequest,
                               @RequestParam("uploadFile") CommonsMultipartFile file) throws Exception {
        groupservice.insert(postDto, httpServletRequest, file);
        //   model.addAttribute("postList", groupservice.listCriPost(cri));

//         PageMaker pm = new PageMaker();
//         pm.setCri(cri);
//         pm.setTotalCount(groupservice.pageCountPost());

//         model.addAttribute("pm", pm);

        String group_no = postDto.getGroup_no();
        return "redirect:board_list.do?group_no=" + group_no;
    }


    // 글 상세보기
    @RequestMapping(value = "board_detail.do", method = RequestMethod.GET)
    public String read(@RequestParam("post_no") int post_no, HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        SessionDto sessionDto = (SessionDto) session.getAttribute("userData");
        String userid = sessionDto.getUserid();

        PostDto postDto = groupservice.read(post_no);
        String nickname = userService.selectNickname(userid);

        model.addAttribute("plist", postDto);
        model.addAttribute("nickname", nickname);

        return "board/board_detail";
    }


    // 글 수정하기
    @RequestMapping(value = "board_update.do", method = RequestMethod.GET)
    public String update(@RequestParam("post_no") int post_no, Model model) {
        PostDto postDto = groupservice.read(post_no);

        model.addAttribute("plist", postDto);

        return "board/board_update";
    }

    // 글 수정 post
    @RequestMapping(value = "board_update.do", method = RequestMethod.POST)
    public String updateOk(PostDto postDto, Model model, HttpServletRequest httpServletRequest,
                           @RequestParam("uploadFile") CommonsMultipartFile file) throws Exception {
        boolean u = groupservice.updateOk(postDto, file, httpServletRequest);

        if (u != true) {
            System.out.println("게시판 수정 실패");
        }

        return "redirect:board_detail.do?post_no=" + postDto.getPost_no() + "&userid=" + postDto.getUserid();
    }

    // 일정
    @RequestMapping(value = "board_diary.do", method = RequestMethod.GET)
    public String groupDiary(@RequestParam("group_no") String group_no, HttpServletRequest request, Model model) {

        //로그인한 세션의 userid
        HttpSession session = request.getSession();
        SessionDto sessionDto = (SessionDto) session.getAttribute("userData");
        String userid = sessionDto.getUserid();

        //모임원인지 체크, true = 모임원
        boolean check = groupservice.checkMember(group_no, userid);

        if(check == false) {
            return "error/hasNoRoleError";
        }


        model.addAttribute("group_no", group_no);

        return "board/board_diary";
    }

    // 채팅
    @RequestMapping(value = "board_chatting.do", method = RequestMethod.GET)
    public String groupChatting(@RequestParam("group_no") String group_no, HttpServletRequest request, Model model) {

        //로그인한 세션의 userid
        HttpSession session = request.getSession();
        SessionDto sessionDto = (SessionDto) session.getAttribute("userData");
        String useridChk = sessionDto.getUserid();

        //모임원인지 체크, true = 모임원
        boolean check = groupservice.checkMember(group_no, useridChk);

        if(check == false) {
            return "error/hasNoRoleError";
        }


        String group_name = groupservice.groupByGroup_no(group_no).getGroup_name();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userid = userService.selectNickname(authentication.getName());

        model.addAttribute("userid", userid);
        model.addAttribute("group_name", group_name);
        model.addAttribute("group_no", group_no);

        return "board/board_chatting";
    }


}
