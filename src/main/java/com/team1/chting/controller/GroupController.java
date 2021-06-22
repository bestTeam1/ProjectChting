package com.team1.chting.controller;

import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.InterestCategoryDto;
import com.team1.chting.dto.SessionDto;
import com.team1.chting.dto.UserDto;
import com.team1.chting.service.BoardService;
import com.team1.chting.service.GroupService;
import com.team1.chting.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
    public String groupMakeTest(Model model, HttpServletRequest request) {

        HttpSession session = request.getSession();
        SessionDto sessionDto = (SessionDto) session.getAttribute("userData");
        String userid = sessionDto.getUserid();

        UserDto userDto = userService.userInfoBasic(userid);
        int groupAdmin = userDto.getCnt();

        GroupDto groupDto = groupService.groupBefore();
        String beforeGroupNo = groupDto.getGroup_no();

        //직전에 생성된 모임 번호에 +1
        String tmpNo1 = beforeGroupNo.substring(0,1); //B
        int tmpNo2 = Integer.parseInt(beforeGroupNo.substring(1))+1; //0000+1
        String tmpNo3 = String.format("%05d", tmpNo2);
        String groupNo = tmpNo1.concat(tmpNo3);

        //모임장으로 속해있는 그룹이 있다면
        if (groupAdmin == 1) {
            return "group/group_error/alreadyGroupError"; //에러페이지 이동
        }

        model.addAttribute("areaList", boardService.getAreaList());
        model.addAttribute("groupNo", groupNo);

        return "group/groupMake";
    }

    /*
      모임 생성 처리
      작성자 : 박주현
      작성일 : 2021-06-18
    */
    @RequestMapping(value = "groupMake.do", method = RequestMethod.POST, consumes = {"multipart/form-data"})
    public String insertGroup(GroupDto groupDto,
                              String groupNo,
                              HttpServletRequest request) throws Exception {

        //System.out.println(groupDto);
        String userid = groupDto.getUserid();
        groupService.groupMake(groupDto, request, groupNo);

        return "redirect:/groupJoin.do?userid="+userid;
    }

    /*
      모임 생성 - 관심사 선택 팝업창
      작성자 : 박주현
      작성일 : 2021-06-18
    */
    @RequestMapping(value = "groupCategory.do", method = RequestMethod.GET)
    public String categoryChoice(Model model) {

        List<InterestCategoryDto> list = new ArrayList<>();
        InterestCategoryDto interestCategory = new InterestCategoryDto();
        list.add(interestCategory);

        model.addAttribute("interestCategory", userService.getInterestCategory());

        return "group/interestCategory";
    }

}