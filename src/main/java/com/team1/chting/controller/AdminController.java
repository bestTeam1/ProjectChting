package com.team1.chting.controller;

import com.team1.chting.dto.NoticeDto;
import com.team1.chting.service.AdminService;
import com.team1.chting.utils.AdminCriteria;
import com.team1.chting.utils.PageMaker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

    //공지사항 목록보기(PageMaker객체 사용)
    @RequestMapping(value = "adminNotice.do", method = RequestMethod.GET)
    public String listPageGET(AdminCriteria cri, Model model) throws Exception {
        model.addAttribute("boardList", adminService.listCri(cri));

        PageMaker pm = new PageMaker();
        pm.setCri(cri);
        pm.setTotalCount(adminService.pageCount()); //DB의 전체ROW수 입력

        // 뷰페이지로 전달
        model.addAttribute("pm", pm);

        return "admin/notice";
    }

    //공지사항 상세보기
    @RequestMapping(value = "adminNoticeDetail.do", method = RequestMethod.GET)
    public String adminNoticeDetail(String noticeNo, Model model) {

        NoticeDto noticeDto = adminService.getNoticeDetail(noticeNo);
        System.out.println("noticeNo : " + noticeNo);
        model.addAttribute("detail", noticeDto);
        System.out.println(noticeDto);

        return "admin/notice_detail";
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
    @RequestMapping(value = "testestsetste.do", method = RequestMethod.GET)
    public String listCriGET(AdminCriteria cri, Model model) throws Exception {
        model.addAttribute("boardList", adminService.listCri(cri));

        return "admin/pagingtest";
    }



}
