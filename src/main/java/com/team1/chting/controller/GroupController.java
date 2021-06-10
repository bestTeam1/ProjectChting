package com.team1.chting.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.team1.chting.dao.GroupDao;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.PostDto;
import com.team1.chting.service.GroupService;
import com.team1.chting.utils.Criteria;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.logging.Logger;

@Controller
public class GroupController {

    @Autowired
    private GroupService groupservice;

    // 메인
    @RequestMapping(value = "board_main.do", method = RequestMethod.GET)
    public String groupMain(Model model){

        return "board/board_main";
    }

    // 게시물 리스트
    @RequestMapping(value = "board_list.do", method = RequestMethod.GET)
    public String postList(Model model){
        // 전체 글 개수

        List<PostDto> postList = groupservice.getPostList();

        model.addAttribute("postList", postList);

        return "board/board_list";
    }


    //글쓰기
    @RequestMapping(value = "board_write.do", method = RequestMethod.GET)
    public String groupWrite(Model model){

        return "board/board_write";
    }

    // 글쓰기 post
    @RequestMapping(value = "board_write.do", method = RequestMethod.POST)
    public String groupWrite(PostDto postDto){
        groupservice.postWrite(postDto);
        return "redirect:postList";
    }

    // 일정
    @RequestMapping(value = "board_diary.do", method = RequestMethod.GET)
    public String groupDiary(Model model){

        return "board/board_diary";
}

    // 채팅
    @RequestMapping(value = "board_chatting.do", method = RequestMethod.GET)
    public String groupChatting(Model model){

        return "board/board_chatting";
    }

}
