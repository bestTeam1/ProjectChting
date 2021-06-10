package com.team1.chting.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.NoticeDto;
import com.team1.chting.service.NoticeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	@Autowired
	private NoticeService noticeService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() { return "index";}

	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	public String index(Model model) {
		List<NoticeDto> list = new ArrayList<NoticeDto>();
		list = noticeService.recentlyNotice();
		model.addAttribute("list",list);

		return "index";
	}

	public String index() { return "index"; }
	
	@RequestMapping(value = "elements.do", method = RequestMethod.GET)
	public String elements() {
		return "elements";
	}
	
	@RequestMapping(value = "generic.do", method = RequestMethod.GET)
	public String generic() { return "generic"; }

}
