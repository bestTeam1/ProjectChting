package com.team1.chting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EtcController {

    @RequestMapping(value = "team.do")
    public String teamPage() {
        return "etc/team";
    }

}
