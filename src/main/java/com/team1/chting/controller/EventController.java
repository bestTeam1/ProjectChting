package com.team1.chting.controller;

import com.team1.chting.dto.EventDto;
import com.team1.chting.service.AdminService;
import com.team1.chting.utils.AdminCriteria;
import com.team1.chting.utils.PageMaker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EventController {
    @Autowired
    private AdminService adminService;

    /*
      사이트 이벤트목록 페이징
      만든이 : 이승준
      작성일 : 2021-06-16
    */
    @RequestMapping(value = "eventList.do", method = RequestMethod.GET)
    public String adminEvent(AdminCriteria cri, Model model) throws Exception {
        model.addAttribute("eventList", adminService.listCriEvent(cri));

        PageMaker pm = new PageMaker();
        pm.setCri(cri);
        pm.setTotalCount(adminService.pageCountEvent()); //DB의 전제 row수

        model.addAttribute("pm", pm);

        return "main/event/event";
    }

    /*
      사이트 이벤트 상세보기
      만든이 : 이승준
      작성일 : 2021-06-17
    */
    @RequestMapping(value = "eventDetail.do", method = RequestMethod.GET)
    public String adminEventDetail(String eventNo, String page, Model model) throws Exception {
        EventDto eventDto = adminService.getEventDetail(eventNo);

        if(page == null) {
            page = "1";
        }

        model.addAttribute("event", eventDto);
        model.addAttribute("page", page);

        return "main/event/event_detail";
    }
}
