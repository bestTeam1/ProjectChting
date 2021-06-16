package com.team1.chting.controller;

import com.team1.chting.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

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

        model.addAttribute("areaList", loginService.getAreaList());
        model.addAttribute("data", request.getUserPrincipal());
        return "sign/signUp";
    }
}
