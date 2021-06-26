package com.team1.chting.security;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {
    @Override
    public void onAuthenticationFailure(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AuthenticationException e) throws IOException, ServletException {
        final String failureURL = "/logout";
        System.out.println("[!!!!] fail error :: " + e.getClass() + e.getMessage());
        httpServletRequest.getRequestDispatcher(failureURL).forward(httpServletRequest, httpServletResponse);
    }
}
