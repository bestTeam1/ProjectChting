package com.team1.chting.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.team1.chting.dto.*;
import com.team1.chting.dto.MyPageInfo;
import com.team1.chting.service.BoardService;
import net.sf.json.JSONArray;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team1.chting.service.UserService;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private BoardService boardService;

    /*
      마이페이지 회원 정보 불러오기
      작성자 : 박주현
      작성일 : 2021-06-07
    */
    @RequestMapping(value = "myPage.do", method = RequestMethod.GET)
    public String userInfo(Model model, @RequestParam("userid") String userid) {

        model.addAttribute("userInfo", userService.getMyPageInfo(userid));

        return "user/userinfo";
    }

    /*
      마이페이지 회원 정보 수정 페이지(GET)
      작성자 : 박주현
      작성일 : 2021-06-10
    */
    @RequestMapping(value = "userUpdate.do", method = RequestMethod.GET)
    public String userInfoEdit(Model model, @RequestParam("userid") String userid) {

        model.addAttribute("userInfo", userService.getMyPageInfo(userid));
        model.addAttribute("areaList", boardService.getAreaList());

        return "user/userUpdate";
    }

    /*
      회원 정보 수정 처리(POST)- user_info UPDATE
      작성자 : 박주현
      작성일 : 2021-06-09
    */
    @RequestMapping(value = "userUpdate.do", method = RequestMethod.POST, consumes = {"multipart/form-data"})
    public String updateUser(UserDto userDto,
                             HttpServletRequest request) throws Exception {

        System.out.println("userDto : " +userDto);
        String userid = userDto.getUserid();
        userService.updateUser(userDto, request);

        return "redirect:/myPage.do?userid="+userid;
    }

    /*
      마이페이지 회원 정보 수정 - 관심사 선택 팝업창
      작성자 : 박주현
      작성일 : 2021-06-11
    */
    @RequestMapping(value = "userCategory.do", method = RequestMethod.GET)
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

        return "user/interestCategory";
    }

    /*
      마이페이지 회원 정보 수정 - 관심사 적용(기존 관심사 DELETE / 새로운 관심사 INSERT)
      작성자 : 박주현
      작성일 : 2021-06-17
    */
    @RequestMapping(value = "userCategory.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
    public String updateCategory(Model model,
                                 @RequestParam("userid") String userid,
                                 @RequestParam(value="catelist", defaultValue = "")
                                         List<String> catelist) {

        List<InterestCategoryDto> list = new ArrayList<>();

        for(int i = 0; i < catelist.size(); i++) {
            InterestCategoryDto interestCategory = new InterestCategoryDto();
            interestCategory.setCatecode(catelist.get(i));
            interestCategory.setUserid(userid);

            list.add(interestCategory);
        }
        System.out.println("userid: " +userid);
        System.out.println("list : " +list);

        userService.deleteInterestCategory(userid);
        userService.updateInterestCategory(list);

        return "user/userUpdate";

    }

    /*
      회원 탈퇴
      작성자 : 박주현
      작성일 : 2021-06-09
    */
    @RequestMapping(value="delAcount.do", produces = "application/text; charset=utf8")
    public String deleteAcount(@RequestParam("userid") String userid) {

        System.out.println("deleteAcount ajax 들어옴");
        System.out.println("userid : " +userid);

        userService.delAcount(userid);

        return "index";

    }



}
