package com.team1.chting.controller;

import java.security.Principal;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.MyPageInfo;
import com.team1.chting.dto.MyPageInfo;
import net.sf.json.JSONArray;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.oidc.user.DefaultOidcUser;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
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

        model.addAttribute("userInfo", userService.getMyPageInfo());

        return "user/userinfo";
    }

    /*
    마이페이지 회원 정보 수정
    작성자 : 박주현
    작성일 : 2021-06-10
    */
    @RequestMapping(value = "userUpdate.do", method = RequestMethod.GET)
    public String userUpdate(Model model) {

        model.addAttribute("userInfo", userService.getMyPageInfo());

        return "user/userUpdate";
    }

    @RequestMapping(value = "signUp.do", method = RequestMethod.GET)
    public String userSignUp(HttpServletRequest request, Model model) {

        OAuth2AuthenticationToken token = (OAuth2AuthenticationToken) request.getUserPrincipal();
        Map<String, Object> userData = token.getPrincipal().getAttributes();
        Set<String> userDataSet = userData.keySet();
        Iterator<String> Iter_userDataSet = userDataSet.iterator();

        while (Iter_userDataSet.hasNext()) {
            String next = Iter_userDataSet.next();
            System.out.println("KEY : " + next);
            model.addAttribute(next, userData.get(next));
        }

        model.addAttribute("data", request.getUserPrincipal());
        return "sign/signUp";
    }

}
