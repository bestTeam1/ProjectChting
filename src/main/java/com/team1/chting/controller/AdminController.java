package com.team1.chting.controller;

import com.team1.chting.dto.NoticeDto;
import com.team1.chting.dto.UserDto;
import com.team1.chting.service.AdminService;
import com.team1.chting.utils.AdminCriteria;
import com.team1.chting.utils.PageMaker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    //관리자 메인 (차트활용)
    @RequestMapping(value = "adminIndex.do", method = RequestMethod.GET)
    public String groupJoin(Model model) {

        return "admin/index";
    }

    /*
      공지사항 목록보기(PageMaker객체 사용)
      만든이 : 이승준
      작성일 : 2021-06-15
     */
    @RequestMapping(value = "adminNotice.do", method = RequestMethod.GET)
    public String listPageGET(AdminCriteria cri, Model model) throws Exception {
        model.addAttribute("boardList", adminService.listCriNotice(cri));

        PageMaker pm = new PageMaker();
        pm.setCri(cri);
        pm.setTotalCount(adminService.pageCountNotice()); //DB의 전체ROW수 입력

        // 뷰페이지로 전달
        model.addAttribute("pm", pm);

        return "admin/notice";
    }

    /*
      공지사항 상세보기(PageMaker객체 사용)
      만든이 : 이승준
      작성일 : 2021-06-16

     */
    @RequestMapping(value = "adminNoticeDetail.do", method = RequestMethod.GET)
    public String adminNoticeDetail(String noticeNo, String page, Model model) {

        NoticeDto noticeDto = adminService.getNoticeDetail(noticeNo);

        model.addAttribute("detail", noticeDto);
        model.addAttribute("page", page);

        return "admin/notice_detail";
    }

    /*
      공지사항 삭제
      만든이 : 이승준
      작성일 : 2021-06-16
     */
    @RequestMapping(value = "adminNoticeDelete.do", method = RequestMethod.GET)
    public String adminNoticeDelete(String noticeNo, String page, Model model) {
        adminService.deleteAdminNotice(noticeNo);
        String url = "adminNotice.do?page=" + page;

        return "redirect:" + url;
    }

    @RequestMapping(value = "adminEvent.do", method = RequestMethod.GET)
    public String adminEvent(Model model) {


        return "admin/event";
    }

    /*
      사이트 회원목록 페이징
      만든이 : 이승준
      작성일 : 2021-06-16
     */
    @RequestMapping(value = "adminUserManagement.do", method = RequestMethod.GET)
    public String adminUserManage(AdminCriteria cri, Model model) throws Exception {
        model.addAttribute("userList", adminService.listCriUser(cri));

        PageMaker pm = new PageMaker();
        pm.setCri(cri);
        pm.setTotalCount(adminService.pageCountUser()); //DB의 전제 row수

        model.addAttribute("pm", pm);

        return "admin/user_management";
    }

    @RequestMapping(value = "adminGroupManagement.do", method = RequestMethod.GET)
    public String adminGroupManagement(Model model) {


        return "admin/group_management";
    }

    /*
      공지사항 수정 이동
      만든이 : 이승준
      작성일 : 2021-06-16
     */
    @RequestMapping(value = "adminNoticeModify.do", method = RequestMethod.GET)
    public String adminNoticeModify(String noticeNo, String page, Model model) {
        NoticeDto noticeDto = adminService.getNoticeDetail(noticeNo);

        model.addAttribute("page", page);
        model.addAttribute("detail", noticeDto);

        return "admin/notice_modify";
    }


    /*
      공지사항 수정 확인
      만든이 : 이승준
      작성일 : 2021-06-16
     */
    @RequestMapping(value = "adminNoticeModifyOk.do", method = RequestMethod.POST)
    public String adminNoticeModifyOk(HttpServletRequest httpServletRequest, Model model) {


        String subject = httpServletRequest.getParameter("subject");
        String content = httpServletRequest.getParameter("content");
        String noticeNo = httpServletRequest.getParameter("noticeNo");
        String page = httpServletRequest.getParameter("page");

        boolean isModified = adminService.adminNoticeModifyOk(subject, content, noticeNo);

        if (isModified != true) {
            System.out.println("공지사항 수정 실패");
        }

        return "redirect:adminNoticeDetail.do?page=" + page + "&noticeNo=" + noticeNo;
    }


}
