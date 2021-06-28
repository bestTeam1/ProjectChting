package com.team1.chting.controller;


import java.security.Principal;
import java.util.List;

import com.team1.chting.dto.EventDto;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.service.BoardService;
import com.team1.chting.service.HomeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;


@Controller
public class HomeController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private HomeService homeService;

	@Autowired
	private ServletContext application;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		if(application.getAttribute("search_areaList") == null) {
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

	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	public String index(Model model) {
		if(application.getAttribute("search_areaList") == null) {
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

}
