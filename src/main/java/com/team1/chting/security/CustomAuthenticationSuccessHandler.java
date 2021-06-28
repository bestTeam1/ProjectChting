package com.team1.chting.security;

import com.team1.chting.dto.LoginDto;
import com.team1.chting.dto.SessionDto;
import com.team1.chting.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.OAuth2AuthenticatedPrincipal;
import org.springframework.security.oauth2.core.oidc.user.DefaultOidcUser;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.Principal;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;


public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    /*
    소셜 로그인 성공 시 회원가입 여부에 따른 redirect 처리
    작성자 : 김수연
    작성일 : 2021-06-14
    */

    @Autowired
    private LoginService loginService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
//        System.out.println(httpServletRequest.getContextPath());
//        System.out.println("getAuthorities" + authentication.getAuthorities());
//        System.out.println("---------------------------------");
//        System.out.println("getPrincipal" + authentication.getPrincipal());
//        System.out.println("---------------------------------");
//        System.out.println("getDetails" + authentication.getDetails());
//        System.out.println("getName" + authentication.getName());
//        System.out.println("getCredentials" + authentication.getCredentials());
//        System.out.println("toString :: " + authentication.getAuthorities().toString());
        System.out.println((authentication.getPrincipal().getClass()));
        String redirectURL = "/myGroup.do";
        Collection<? extends GrantedAuthority> authList = authentication.getAuthorities();
        Iterator<? extends GrantedAuthority> authList_iterator = authList.iterator();
        while (authList_iterator.hasNext()) {
            GrantedAuthority authority = authList_iterator.next();
            if(authority.getAuthority().equals("ROLE_GUEST") || authority.getAuthority().equals("GUEST")) {
                redirectURL = "/signUp.do";
            }else {
                LoginDto loginDto = loginService.isUser(authentication.getName());
                httpServletRequest.getSession().setAttribute("userData", new SessionDto(loginDto));
            }
        }
        httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + redirectURL);
    }
}
