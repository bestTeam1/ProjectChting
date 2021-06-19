package com.team1.chting.controller;

import com.team1.chting.dto.EventDto;
import com.team1.chting.dto.NoticeDto;
import com.team1.chting.service.AdminService;
import com.team1.chting.utils.AdminCriteria;
import com.team1.chting.utils.PageMaker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;

//관리자 권한 페이지에서 할수있는 작업들. 관리자 메인 통계 chart 부분은 ChartController에 할당
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

        return "admin/notice/notice";
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

        return "admin/notice/notice_detail";
    }

    /*
      공지사항 삭제
      만든이 : 이승준
      작성일 : 2021-06-16
     */
    @RequestMapping(value = "adminDeleteBoard.do", method = RequestMethod.GET)
    public String adminBoardDelete(String type ,String num, String page, Model model) {
        System.out.println("받아온값 type , num : " + type + "/" + num);
        adminService.adminDeleteBoard(type, num);
        String url = "admin"+type +".do?page=" + page;

        return "redirect:" + url;
    }

    /*
      사이트 이벤트목록 페이징
      만든이 : 이승준
      작성일 : 2021-06-16
    */
    @RequestMapping(value = "adminEvent.do", method = RequestMethod.GET)
    public String adminEvent(AdminCriteria cri, Model model) throws Exception {
        model.addAttribute("eventList", adminService.listCriEvent(cri));

        PageMaker pm = new PageMaker();
        pm.setCri(cri);
        pm.setTotalCount(adminService.pageCountEvent()); //DB의 전제 row수

        model.addAttribute("pm", pm);

        return "admin/event/event";
    }

    /*
      사이트 이벤트 상세보기
      만든이 : 이승준
      작성일 : 2021-06-17
    */
    @RequestMapping(value = "adminEventDetail.do", method = RequestMethod.GET)
    public String adminEventDetail(String eventNo, String page, Model model) throws Exception {
        EventDto eventDto = adminService.getEventDetail(eventNo);

        model.addAttribute("event", eventDto);
        model.addAttribute("page", page);

        return "admin/event/event_detail";
    }
    /*
      사이트 이벤트 취소
      만든이 : 이승준
      작성일 : 2021-06-18
    */
    @RequestMapping(value = "adminEventDisabled.do", method = RequestMethod.GET)
    public String adminEventDisabled(String eventNo, String page, Model model) {
        int result = adminService.adminEventDisabled(eventNo);

        if(result == 0) {
            System.out.println("이벤트 취소 실패");
        }

        return "redirect:adminEvent.do?page="+page;
    }

    /*
      사이트 이벤트 수정 이동
      만든이 : 이승준
      작성일 : 2021-06-16
     */
    @RequestMapping(value = "adminEventModify.do", method = RequestMethod.GET)
    public String adminEventModify(String eventNo, String page, Model model) {

        EventDto eventDto = adminService.getEventDetail(eventNo);

        model.addAttribute("event", eventDto);
        model.addAttribute("page", page);

        return "admin/event/event_modify";
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
    /*
      사이트 모임목록 페이징
      만든이 : 이승준
      작성일 : 2021-06-16
    */

    @RequestMapping(value = "adminGroupManagement.do", method = RequestMethod.GET)
    public String adminGroupManagement(AdminCriteria cri, Model model)  throws Exception {
        model.addAttribute("groupList", adminService.listCriGroup(cri));

        PageMaker pm = new PageMaker();
        pm.setCri(cri);
        pm.setTotalCount(adminService.pageCountGroup()); //DB의 전제 row수

        model.addAttribute("pm", pm);

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

        return "admin/notice/notice_modify";
    }

    /*
        글쓰기 페이지 이동 (
        만든이 : 이승준
        작성일 : 2021-06-17
    */
    @RequestMapping(value = "write.do", method = RequestMethod.GET)
    public String write(String type, Model model){

        //타입에 맞게 글쓰기 페이지 지정
        if (type.equals("notice")) {
            int writeNoticeNo = adminService.getWriteNo(type);
            model.addAttribute("noticeNo", writeNoticeNo);

            return "admin/notice/notice_write";

        } else if (type.equals("event")) {
            //쓰여질 게시글의 번호 get
            int writeEventNo = adminService.getWriteNo(type);
            model.addAttribute("eventNo", writeEventNo);

            return "admin/event/event_write";

        } else {
            System.out.println("write type error!");
            return null;
        }
    }

    /*
       공지사항 글쓰기 (파일업로드 포함)
       만든이 : 이승준
       작성일 : 2021-06-18
     */
    @RequestMapping(value = "noticeWriteOk.do", method = RequestMethod.POST, consumes = {"multipart/form-data"})
    public String noticeWriteOk(AdminCriteria cri,
                                NoticeDto noticeDto,
                                Model model,
                                HttpServletRequest httpServletRequest,
                                @RequestParam("uploadFile") CommonsMultipartFile file) //dto와 file 이름이 같으면 400오류나서 임의로 가져옴
            throws Exception {

        adminService.noticeWrite(noticeDto, httpServletRequest, file); //파일업로드 포함한 글쓰기

        model.addAttribute("boardList", adminService.listCriNotice(cri));

        PageMaker pm = new PageMaker();
        pm.setCri(cri);
        pm.setTotalCount(adminService.pageCountNotice()); //DB의 전체ROW수 입력

        // 뷰페이지로 전달
        model.addAttribute("pm", pm);

        return "admin/notice/notice";
    }
    /*
       이벤트 글쓰기 (파일업로드 포함)
       만든이 : 이승준
       작성일 : 2021-06-18
     */
    @RequestMapping(value = "eventWriteOk.do", method = RequestMethod.POST, consumes = {"multipart/form-data"})
    public String eventWriteOk(AdminCriteria cri,
                               EventDto eventDto,
                               Model model,
                               HttpServletRequest httpServletRequest,
                               @RequestParam("uploadFile") CommonsMultipartFile file) //dto와 file 이름이 같으면 400오류나서 임의로 가져옴
            throws Exception {

        adminService.eventWrite(eventDto, httpServletRequest, file); //파일업로드 포함한 글쓰기

        model.addAttribute("boardList", adminService.listCriNotice(cri));

        PageMaker pm = new PageMaker();
        pm.setCri(cri);
        pm.setTotalCount(adminService.pageCountNotice()); //DB의 전체ROW수 입력

        // 뷰페이지로 전달
        model.addAttribute("pm", pm);

        return "redirect:adminEvent.do";
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

    /*
      이벤트 수정 확인
      만든이 : 이승준
      작성일 : 2021-06-16
     */
    @RequestMapping(value = "adminEventModifyOk.do", method = RequestMethod.POST)
    public String adminEventModifyOk(EventDto eventDto,
                                     HttpServletRequest httpServletRequest,
                                     @RequestParam("uploadFile") CommonsMultipartFile file,
                                     Model model) throws Exception {
        System.out.println(eventDto);
        String page = httpServletRequest.getParameter("page");
        adminService.eventModify(eventDto, httpServletRequest, file); //파일업로드 포함한 글쓰기

        return "redirect:adminEventDetail.do?page=" + page + "&eventNo=" + eventDto.getEvent_no();
    }


}
