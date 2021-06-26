package com.team1.chting.controller;

import com.team1.chting.dto.SignUpDto;
import com.team1.chting.dto.social.SocialData;
import com.team1.chting.dto.social.SocialDataFactory;
import com.team1.chting.service.EmailService;
import com.team1.chting.service.LoginService;
import com.team1.chting.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private EmailService emailService;

    @Autowired
    private UserService userService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        StringTrimmerEditor stringTimmerEditor = new StringTrimmerEditor(true);
        binder.registerCustomEditor(String.class, stringTimmerEditor);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, false));
    }

    //회원가입 페이지 이동 수연
    @RequestMapping(value = "signUp.do", method = RequestMethod.GET)
    public String signUpPage(HttpServletRequest request, Model model) {
        OAuth2AuthenticationToken token = (OAuth2AuthenticationToken) request.getUserPrincipal();
        Map<String, Object> userData = token.getPrincipal().getAttributes();

        SocialData socialData = SocialDataFactory.getSocialData(userData, token.getAuthorizedClientRegistrationId());
        System.out.println(socialData.toString());

        model.addAttribute("socialData", socialData);
        model.addAttribute("areaList", loginService.getAreaList());
        model.addAttribute("interestList", loginService.tempInterestList());
        return "sign/signUp";
    }

    //회원가입 비동기 처리 수연
    @ResponseBody
    @RequestMapping(value = "signUp.do", method = RequestMethod.POST, consumes = {"multipart/form-data"})
    public ResponseEntity<String> signUpReg(SignUpDto signUpDto,
                                    @RequestParam(value = "interest", defaultValue = "P") List<String> interest,
                                    @RequestParam(value = "siterule") String siterule,
                                    HttpServletRequest request) {

        try {
            int result = loginService.signUpReg(signUpDto, request, interest);
            emailService.sendMail(signUpDto.getEmail(), signUpDto.getNickname());
            System.out.println(result);
            return new ResponseEntity<String>("회원가입이 완료되었습니다. 다시 로그인 해주세요.", HttpStatus.OK);
        } catch (Exception e) {
            System.out.println("error : " + e.getMessage());
            return new ResponseEntity<String>("SignUp Failure", HttpStatus.BAD_REQUEST);
        }
    }

}
