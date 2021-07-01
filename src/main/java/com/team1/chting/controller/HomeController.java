package com.team1.chting.controller;

import java.util.List;

import com.team1.chting.dto.EventDto;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.service.BoardService;
import com.team1.chting.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletContext;

@Controller
public class HomeController {

    @Autowired
    private BoardService boardService;

    @Autowired
    private HomeService homeService;

    @Autowired
    private ServletContext application;

    //비로그인 메인
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Model model) {
        if (application.getAttribute("search_areaList") == null) {
            application.setAttribute("search_areaList", boardService.getAreaList());
        }
        List<EventDto> eventList = homeService.getEventList();
        List<GroupDto> newGroupList = homeService.getNewGroupList();
        List<GroupDto> bestGroupList = homeService.getBestGroupList();

        model.addAttribute("eventList", eventList);
        model.addAttribute("newGroupList", newGroupList);
        model.addAttribute("bestGroupList", bestGroupList);
        return "index";
    }

    //비로그인 메인
    @RequestMapping(value = "index.do", method = RequestMethod.GET)
    public String index(Model model) {
        if (application.getAttribute("search_areaList") == null) {
            application.setAttribute("search_areaList", boardService.getAreaList());
        }
        List<EventDto> eventList = homeService.getEventList();
        List<GroupDto> newGroupList = homeService.getNewGroupList();
        List<GroupDto> bestGroupList = homeService.getBestGroupList();

        //System.out.println("-----------------------------");
        //System.out.println(bestGroupList);
        //System.out.println("-----------------------------");

        model.addAttribute("eventList", eventList);
        model.addAttribute("newGroupList", newGroupList);
        model.addAttribute("bestGroupList", bestGroupList);

        return "index";
    }

}
