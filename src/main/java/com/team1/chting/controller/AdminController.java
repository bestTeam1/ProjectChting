package com.team1.chting.controller;

import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.UserDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class AdminController {
    //관리자 메인
    @RequestMapping(value = "adminIndex.do", method = RequestMethod.GET)
    public String groupJoin(Model model) {



        return "admin/index";
    }
    @RequestMapping(value = "adminNotice.do", method = RequestMethod.GET)
    public String adminNotice(Model model) {



        return "admin/notice";
    }
    @RequestMapping(value = "adminEvent.do", method = RequestMethod.GET)
    public String adminEvent(Model model) {



        return "admin/event";
    }
    @RequestMapping(value = "adminUserManagement.do", method = RequestMethod.GET)
    public String adminUserManagement(Model model) {



        return "admin/user_management";
    }
    @RequestMapping(value = "adminGroupManagement.do", method = RequestMethod.GET)
    public String adminGroupManagement(Model model) {



        return "admin/group_management";
    }

}
