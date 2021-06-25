package com.team1.chting.controller;


import java.util.List;

import com.team1.chting.dto.GroupDto;
import com.team1.chting.service.HomeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;


@Controller
public class HomeController {

	@Autowired
	private HomeService homeService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() { return "index";}

	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	public String index(HttpSession session, Model model) {
		List<GroupDto> newGroupList = homeService.getNewGroupList();
		List<GroupDto> bestGroupList = homeService.getBestGroupList();

		model.addAttribute("newGroupList", newGroupList);
		model.addAttribute("bestGroupList", bestGroupList);
		return "index";
	}
	
	@RequestMapping(value = "elements.do", method = RequestMethod.GET)
	public String elements() { return "elements"; }
	
	@RequestMapping(value = "generic.do", method = RequestMethod.GET)
	public String generic() { return "generic"; }

}
