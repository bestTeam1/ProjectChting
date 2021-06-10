package com.team1.chting.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.team1.chting.dto.GroupDto;
import net.sf.json.JSONArray;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team1.chting.dto.UserDto;
import com.team1.chting.service.UserService;

@Controller
public class UserController {

    @Autowired
    private SqlSession sqlsession;

    @Autowired
    private UserService userService;

    /*
    마이페이지 회원 정보 불러오기
    작성자 : 박주현
    작성일 : 2021-06-07
    */
    @RequestMapping(value = "myPage.do", method = RequestMethod.GET)
    public String userInfo(Model model) {

        UserDto userInfoBasic = userService.userInfoBasic();
        List<UserDto> userInterest = userService.userInterest();
        List<UserDto> userJoinGroup = userService.userJoinGroup();

        model.addAttribute("userInfoBasic", userInfoBasic);
        model.addAttribute("userInterest", userInterest);
        model.addAttribute("userJoinGroup", userJoinGroup);

        return "user/userinfo";
    }


}
