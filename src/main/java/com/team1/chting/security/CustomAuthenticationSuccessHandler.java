package com.team1.chting.security;

import com.team1.chting.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private LoginService loginService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        String userid = authentication.getName();

//        LoginDto loginDto = loginService.isUser(userid);
//
//        if(loginDto != null) {
//
//            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/index.do");
//
//
//        } else {
////            authentication.setAuthenticated(false);
//
//            authentication = new Authentication() {
//                @Override
//                public Collection<? extends GrantedAuthority> getAuthorities() {
//                    List<GrantedAuthority> list = new ArrayList<>(1);
//                    list.add(new SimpleGrantedAuthority(""))
//
//                    return null;
//                }
//
//                @Override
//                public Object getCredentials() {
//                    return null;
//                }
//
//                @Override
//                public Object getDetails() {
//                    return null;
//                }
//
//                @Override
//                public Object getPrincipal() {
//                    return null;
//                }
//
//                @Override
//                public boolean isAuthenticated() {
//                    return false;
//                }
//
//                @Override
//                public void setAuthenticated(boolean b) throws IllegalArgumentException {
//
//                }
//
//                @Override
//                public String getName() {
//                    return null;
//                }
//            };
//
//            SecurityContext context = SecurityContextHolder.getContext();
//
//
//            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/join.do");
//
//        }

        System.out.println(httpServletRequest.getContextPath());
        System.out.println("getAuthorities" + authentication.getAuthorities());
        System.out.println("getPrincipal" + authentication.getPrincipal());
        System.out.println("getDetails" + authentication.getDetails());
        System.out.println("getName" + authentication.getName());
        System.out.println("getCredentials" + authentication.getCredentials());

    }
}
