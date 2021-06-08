package com.team1.chting.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.service.GroupService;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
    public String groupList(Model model) {

        return "board/board_list";
    }

    //글쓰기
    @RequestMapping(value = "board_write.do", method = RequestMethod.GET)
    public String groupWrite(Model model){
        return "board/board_write";
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
