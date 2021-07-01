package com.team1.chting.controller;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.team1.chting.dto.*;
import com.team1.chting.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public String userInfo(Model model, HttpServletRequest request) {

        HttpSession session = request.getSession();
        SessionDto sessionDto = (SessionDto) session.getAttribute("userData");
        String userid = sessionDto.getUserid();

        model.addAttribute("userInfo", userService.getMyPageInfo(userid));

        return "user/userInfo";
    }

    /*
      마이페이지 회원 정보 불러오기_ userid 파라미터
      작성자 : 김명환
      작성일 : 2021-06-24
    */
    @RequestMapping(value = "userPage.do", method = RequestMethod.GET)
    public String userPage(@RequestParam("userid") String userid, Model model) {

        model.addAttribute("userInfo", userService.getMyPageInfo(userid));

        return "user/userInfo";
    }

    /*
      마이페이지 회원 정보 수정 페이지(GET)
      작성자 : 박주현
      작성일 : 2021-06-10
    */
    @RequestMapping(value = "userUpdate.do", method = RequestMethod.GET)
    public String userInfoEdit(Model model, HttpServletRequest request) {

        HttpSession session = request.getSession();
        SessionDto sessionDto = (SessionDto) session.getAttribute("userData");
        String userid = sessionDto.getUserid();

        model.addAttribute("userInfo", userService.getMyPageInfo(userid));
        model.addAttribute("areaList", boardService.getAreaList());
        model.addAttribute("cateList", userService.getInterestCategory());

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

        //System.out.println("userDto : " + userDto);
        String userid = userDto.getUserid();
        userService.updateUser(userDto, request);

        return "redirect:/myPage.do?userid=" + userid;
    }

    /*
      마이페이지 회원 정보 수정 - 관심사 선택 팝업창
      작성자 : 박주현
      작성일 : 2021-06-11
    */
    @RequestMapping(value = "userCategory.do", method = RequestMethod.GET)
    public String categoryChoice(Model model) {

        List<InterestCategoryDto> list = new ArrayList<>();
        InterestCategoryDto interestCategory = new InterestCategoryDto();
        list.add(interestCategory);

        model.addAttribute("interestCategory", userService.getInterestCategory());

        return "user/interestCategory";
    }

    /*
      마이페이지 회원 정보 수정 - 관심사 적용(기존 관심사 DELETE / 새로운 관심사 INSERT)
      작성자 : 박주현
      작성일 : 2021-06-17
    */
    @RequestMapping(value = "userCategory.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
    public String updateCategory(Model model,
                                 HttpServletRequest request,
                                 @RequestParam("catelist") List<String> catelist) {

        HttpSession session = request.getSession();
        SessionDto sessionDto = (SessionDto) session.getAttribute("userData");
        String userid = sessionDto.getUserid();

        List<InterestCategoryDto> list = new ArrayList<>();

        for (int i = 0; i < catelist.size(); i++) {
            InterestCategoryDto interestCategory = new InterestCategoryDto();
            interestCategory.setCatecode(catelist.get(i));
            interestCategory.setUserid(userid);

            list.add(interestCategory);
        }
        //System.out.println("userid: " +userid);
        //System.out.println("list : " +list);

        userService.updateInterestCategory(list, userid);

        return "user/userUpdate";

    }

    /*
      회원 탈퇴
      작성자 : 박주현
      작성일 : 2021-06-09
    */
    @RequestMapping(value = "delAcount.do", produces = "application/text; charset=utf8")
    public String deleteAcount(HttpServletRequest request) {

        HttpSession session = request.getSession();
        SessionDto sessionDto = (SessionDto) session.getAttribute("userData");
        String userid = sessionDto.getUserid();

        userService.delAcount(userid);
        session.invalidate();

        return "index";

    }

}
