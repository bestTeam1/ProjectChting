package com.team1.chting.controller;

import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.InterestCategoryDto;
import com.team1.chting.service.BoardService;
import com.team1.chting.service.GroupService;
import com.team1.chting.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class GroupController {

    @Autowired
    private BoardService boardService;

    @Autowired
    private UserService userService;

    @Autowired
    private GroupService groupService;

    /*
      모임 생성 페이지 이동
      만든이 : 박주현
      작성일 : 2021-06-18
    */
    @RequestMapping(value = "groupMake.do", method = RequestMethod.GET)
    public String groupMakeTest(@RequestParam("userid") String userid,
                                Model model) {

        model.addAttribute("areaList", boardService.getAreaList());

        return "group/groupMake";
    }


    /*
      모임 생성 처리
      작성자 : 박주현
      작성일 : 2021-06-18
    */
    @RequestMapping(value = "groupMake.do", method = RequestMethod.POST, consumes = {"multipart/form-data"})
    public String insertGroup(GroupDto groupDto,
                              Model model,
                              HttpServletRequest request) throws Exception {

        //System.out.println(groupDto);
        groupService.groupMake(groupDto, request);

        return "group/group";
    }

    /*
      모임 생성 - 관심사 선택 팝업창
      작성자 : 박주현
      작성일 : 2021-06-18
    */
    @RequestMapping(value = "groupCategory.do", method = RequestMethod.GET)
    public String categoryChoice(Model model,
                                 @RequestParam(value="catelist", defaultValue = "")
                                         List<String> catelist) {

        List<InterestCategoryDto> list = new ArrayList<>();

        if (catelist.size() == 0) {
            InterestCategoryDto interestCategory = new InterestCategoryDto();
            interestCategory.setParent_catecode("");
            list.add(interestCategory);
        }else {
            for(int i = 0; i < catelist.size(); i++) {
                InterestCategoryDto interestCategory = new InterestCategoryDto();
                interestCategory.setParent_catecode(catelist.get(i));
                list.add(interestCategory);
            }
        }
        model.addAttribute("interestCategory", userService.getInterestCategory(list));

        return "group/interestCategory";
    }

}