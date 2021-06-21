package com.team1.chting.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.service.BoardService;
import com.team1.chting.utils.AdminCriteria;
import com.team1.chting.utils.PageMaker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class SearchController {

    @Autowired
    private BoardService boardService;

    @RequestMapping(value="search.do", method= RequestMethod.GET)
    public String search(@RequestParam("category") String category,
                         @RequestParam("search") String search,
                         @RequestParam(value = "page", defaultValue = "1", required = false) String page,
                         Model model, AdminCriteria cri,
                         HttpServletRequest request) {
        cri.resetPageSize(6);
        cri.setPage(Integer.parseInt(page));
        String search_link = request.getContextPath()+request.getServletPath()+"?category="+category+"&search="+search;
        String search_result = "";

        List<GroupDto> list = boardService.getGroupListBySearch(category, search, cri);
        ObjectMapper objMapper = new ObjectMapper();

        PageMaker pm = new PageMaker();
        pm.setCri(cri);
        pm.setTotalCount(boardService.getGroupListBySearchTotalCount(category, search));

        try {
            search_result = objMapper.writeValueAsString(list);
        } catch (Exception e) {
            e.printStackTrace();
        }


        model.addAttribute("search_category", category);
        model.addAttribute("search_keyword",search);
        model.addAttribute("search_result", search_result);
        model.addAttribute("search_link", search_link);
        model.addAttribute("pm", pm);
        String url = (String) request.getAttribute("javax.servlet.include.request_uri");
        return "group/search";
    }

}
