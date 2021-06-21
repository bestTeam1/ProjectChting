package com.team1.chting.controller;

import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.PostDto;
import com.team1.chting.service.GroupService;
import com.team1.chting.service.UserService;
import com.team1.chting.utils.AdminCriteria;
import com.team1.chting.utils.PageMaker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class GroupUserController {

    @Autowired
    private GroupService groupservice;

    @Autowired
    private UserService userService;

    // 내 모임 페이지 수연
    @RequestMapping(value = "myGroup.do", method = RequestMethod.GET)
    public String groupMain() {
        return "board/board_total";
    }

    // 메인
    @RequestMapping(value = "board_main.do", method = RequestMethod.GET)
    public String groupMain(@RequestParam("group_no") String group_no, Model model) {
        GroupDto dto = groupservice.groupByGroup_no(group_no);
        dto.setGroup_no(group_no);
        model.addAttribute("group", dto);
        return "board/board_main_new";
    }

    // 메인
    @RequestMapping(value = "board_main_old.do", method = RequestMethod.GET)
    public String groupMain2(@RequestParam("group_no") String group_no, Model model) {
        GroupDto dto = groupservice.groupByGroup_no(group_no);
        model.addAttribute("group", dto);
        return "board/board_main";
    }

    // 게시물 리스트
    @RequestMapping(value = "board_list.do", method = RequestMethod.GET)
    public String postList(@RequestParam("group_no") String group_no, Model model,
                           AdminCriteria cri) {
        // 전체 글 개수
        List<PostDto> postList = groupservice.getPostList(group_no, cri);

        PageMaker pm = new PageMaker();
        pm.setCri(cri);
        pm.setTotalCount(groupservice.getPostListTotalCount(group_no, cri));

        GroupDto dto = groupservice.groupByGroup_no(group_no);
        dto.setGroup_no(group_no);

        model.addAttribute("group", dto);
        model.addAttribute("postList", postList);
        model.addAttribute("pm", pm);
        return "board/board_list_new";
    }

    // 게시물 리스트
    @RequestMapping(value = "board_list_old.do", method = RequestMethod.GET)
    public String postList2(@RequestParam("group_no") String group_no, Model model, AdminCriteria cri) {
        // 전체 글 개수

        List<PostDto> postList = groupservice.getPostList(group_no, cri);

        model.addAttribute("postList", postList);

        return "board/board_list";
    }


    //글쓰기
    @RequestMapping(value = "board_write.do", method = RequestMethod.GET)
    public String groupWrite(@RequestParam("group_no") String group_no, Model model) {

        return "board/board_write";
    }

    // 글쓰기 post
    @RequestMapping(value = "board_write.do", method = RequestMethod.POST)
    public String insert(@RequestParam("group_no") String group_no, PostDto postDto) {

        groupservice.insert(postDto);

        return "redirect:board_list.do";
    }

    // 글 상세보기
    @RequestMapping(value = "board_detail.do", method = RequestMethod.GET)
    public String read(@RequestParam(value = "post_no", required = false) int post_no, Model model) {
//        PostDto postDto = groupservice.read(post_no);
//        System.out.println(postDto);
//        model.addAttribute("post", postDto );

        return "board/board_detail";
    }

    // 일정
    @RequestMapping(value = "board_diary.do", method = RequestMethod.GET)
    public String groupDiary(@RequestParam("group_no") String group_no, Model model) {

        return "board/board_diary_new";
    }

    // 일정
    @RequestMapping(value = "board_diary_old.do", method = RequestMethod.GET)
    public String groupDiary2(@RequestParam("group_no") String group_no, Model model) {

        return "board/board_diary";
    }

    // 채팅
    @RequestMapping(value = "board_chatting.do", method = RequestMethod.GET)
    public String groupChatting(@RequestParam("group_no") String group_no, Model model) {
        String group_name = groupservice.groupByGroup_no(group_no).getGroup_name();
        model.addAttribute("group_name", group_name);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userid = userService.selectNickname(authentication.getName());
        System.out.println(userid);
        model.addAttribute("userid", userid);

        return "board/board_chatting";
    }
}