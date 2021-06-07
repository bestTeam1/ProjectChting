package com.team1.chting.controller;

import com.team1.chting.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
    @Autowired
    private EmailService emailservice;

    @RequestMapping("test.do")
    //public String emailSend(UserDto userDto)
    public String emailSend(){
        System.out.println("test.do");

        //emailservice.sendMail(userDto.getEmail(), userDto.getUserid());
        emailservice.sendMail("cookie010305@naver.com", "김명환");

        return "index";
    }
}
