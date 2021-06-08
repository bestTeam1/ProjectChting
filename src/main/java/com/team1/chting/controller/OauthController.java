package com.team1.chting.controller;

import com.team1.chting.helper.SocialLoginType;
import com.team1.chting.service.OauthService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Connection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin
@RequiredArgsConstructor
@RequestMapping(value = "/auth/")
@Slf4j
public class OauthController {

    @Autowired
    private  final OauthService oauthService;

    @GetMapping(value = "{socialLoginType}")
    public void socialLoginType(@PathVariable(name = "socialLoginType")SocialLoginType socialLoginType) {
        System.out.println(" >> 사용자에게서 SNS 로그인 요청을 받음 : " + socialLoginType);
        log.info(" >> 사용자에게서 SNS 로그인 요청을 받음 :: ", socialLoginType);
        oauthService.request(socialLoginType);
    }

    @RequestMapping(value = "{socialLoginType}/callback", method = {RequestMethod.GET, RequestMethod.POST})
    public String callback(@PathVariable(name = "socialLoginType") SocialLoginType socialLoginType,
                           @RequestParam(name = "code", required = false) String code) {
        System.out.println("callback : " + code);
        return oauthService.requestAccessToken(socialLoginType, code);
    }

}
