package com.team1.chting.controller;

import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.UserDto;
import com.team1.chting.service.AdminService;
import com.team1.chting.utils.AdminCriteria;
import com.team1.chting.utils.Criteria;
import com.team1.chting.utils.PageMaker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

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

    //페이징처리한 글목록
    @RequestMapping(value = "/listCri", method = RequestMethod.GET)
    public void listCriGET(AdminCriteria cri, Model model) throws Exception {
        model.addAttribute("boardList", adminService.listCri(cri));
    }

    //글목록보기(PageMaker객체 사용)
    // http://localhost:8088/board/listPage
    @RequestMapping(value = "/listPage", method = RequestMethod.GET)
    public void listPageGET(AdminCriteria cri, Model model) throws Exception {
        model.addAttribute("boardList", adminService.listCri(cri));

        PageMaker pm = new PageMaker();
        pm.setCri(cri);
        pm.setTotalCount(adminService.pageCount()); //DB의 전체ROW수 입력

        // 뷰페이지로 전달
        model.addAttribute("pm", pm);
    }

}
