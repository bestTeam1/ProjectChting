package com.team1.chting.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import com.team1.chting.dto.AreaDto;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.NoticeDto;
import com.team1.chting.service.BoardService;
import com.team1.chting.service.NoticeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.annotation.ApplicationScope;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;


@Controller
public class HomeController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private ServletContext application;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		application.setAttribute("appScope_areaList", boardService.getAreaList());
		return "index";
	}

	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	public String index() { return "index"; }

	@RequestMapping(value = "index_new.do", method = RequestMethod.GET)
	public String index_new() {
		return "index_new";
	}
	
	@RequestMapping(value = "elements.do", method = RequestMethod.GET)
	public String elements() { return "elements"; }
	
	@RequestMapping(value = "generic.do", method = RequestMethod.GET)
	public String generic() { return "generic"; }


}
