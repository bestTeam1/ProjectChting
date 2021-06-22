package com.team1.chting.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.PostDto;
import com.team1.chting.dto.PostReplyDto;
import com.team1.chting.service.GroupService;

import org.apache.commons.io.FilenameUtils;

import com.team1.chting.service.UserService;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.w3c.dom.html.HTMLModElement;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
public class GroupUserController {

    @Autowired
    private GroupService groupservice;

    @Autowired
    private UserService userService;


    /*
      게시판
      작성자 : 현상진
      작성일 : 2021-06-18
    */

    // 메인
    @RequestMapping(value = "board_main.do", method = RequestMethod.GET)
    public String groupMain(@RequestParam("group_no") String group_no, Model model){
        GroupDto dto = groupservice.groupByGroup_no(group_no);
        model.addAttribute("group",dto);
        return "board/board_main";
    }

    // 게시물 리스트
    @RequestMapping(value = "board_list.do", method = RequestMethod.GET)
    public String postList(@RequestParam("group_no") String group_no, Model model){
        // 전체 글 개수
        List<PostDto> postList = groupservice.getPostList(group_no);

        model.addAttribute("postList", postList);
        model.addAttribute("group_no", group_no);
        return "board/board_list";
    }

    //글쓰기
    @RequestMapping(value = "board_write.do", method = RequestMethod.GET)
    public String groupWrite(@RequestParam("group_no") String group_no, Model model){
        model.addAttribute("group_no", group_no);
        return "board/board_write";
    }

    // 글쓰기 post
    @RequestMapping(value = "board_write.do", method = RequestMethod.POST)
    public String insert (PostDto postDto, Model model, HttpServletRequest httpServletRequest,
                          @RequestParam("uploadFile")CommonsMultipartFile file) throws Exception {
        groupservice.insert(postDto, httpServletRequest, file);
//        model.addAttribute("postList", groupservice.getPostList());
        String group_no = postDto.getGroup_no();
        return "redirect:board_list.do?group_no=" + group_no;
    }




    // 글 상세보기
    @RequestMapping(value = "board_detail.do", method = RequestMethod.GET)
    public String read(@RequestParam("post_no") int post_no, Model model){
        PostDto postDto = groupservice.read(post_no);

        model.addAttribute("plist", postDto);
        return "board/board_detail";
    }



    // 글 수정하기
    @RequestMapping(value = "board_update.do", method = RequestMethod.GET)
    public String update(@RequestParam("post_no")int post_no, Model model){
        PostDto postDto = groupservice.read(post_no);

        model.addAttribute("plist", postDto);

        return "board/board_update";
    }

    // 글 수정 post
    @RequestMapping(value = "board_update.do", method = RequestMethod.POST)
    public String updateOk(PostDto postDto, Model model, HttpServletRequest httpServletRequest,
                                           @RequestParam("uploadFile")CommonsMultipartFile file) throws Exception{
        boolean u = groupservice.updateOk(postDto, file, httpServletRequest);

        if (u != true){
            System.out.println("게시판 수정 실패");
        }

        return "redirect:board_detail.do?post_no=" + postDto.getPost_no();
    }

    // 일정
    @RequestMapping(value = "board_diary.do", method = RequestMethod.GET)
    public String groupDiary(@RequestParam("group_no") String group_no, Model model){

        return "board/board_diary";
    }

    // 채팅
    @RequestMapping(value = "board_chatting.do", method = RequestMethod.GET)
    public String groupChatting(@RequestParam("group_no") String group_no, Model model){
        String group_name = groupservice.groupByGroup_no(group_no).getGroup_name();
        Authentication authentication  = SecurityContextHolder.getContext().getAuthentication();
        String userid = userService.selectNickname(authentication.getName());

        model.addAttribute("userid", userid);
        model.addAttribute("group_name", group_name);
        model.addAttribute("group_no", group_no);

        return "board/board_chatting";
    }

    /*
      댓글
      작성자 : 현상진
      작성일 : 2021-06-21
    */

    // 댓글등록
    @RequestMapping(value = "board_replyWrite.do")
    @ResponseBody
    public String replyInsert(@ModelAttribute("postReplyDto") PostReplyDto postReplyDto, HttpSession httpSession){
        String userid = (String)httpSession.getAttribute("userid");

        try {
            postReplyDto.setContent(userid);
            groupservice.replyWrite(postReplyDto);
        }catch (Exception e){
            e.getStackTrace();
        }
        return "success";
    }

    // 댓글목록
    @RequestMapping(value = "board_replyList.do", method = RequestMethod.GET)
    @ResponseBody
    public List<PostReplyDto> reply_List(@RequestParam int post_no){
        List<PostReplyDto> list = groupservice.getReply(post_no);
        return list;
    }

    // 댓글삭제
    @RequestMapping(value = "board_replyDelete.do")
    @ResponseBody
    public String replyDel(@ModelAttribute("reply_no")int reply_no){
        groupservice.replyDelete(reply_no);
        return "success";
    }

    // 댓글수정
    public String replyEdit(@ModelAttribute("postReplyDto") PostReplyDto postReplyDto, HttpSession httpSession){
        String userid = (String) httpSession.getAttribute("userid");

        try {
            postReplyDto.setUserid(userid);
            groupservice.replyUpdate(postReplyDto);
        }catch (Exception e){
            e.getStackTrace();
        }
        return "success";
    }


}