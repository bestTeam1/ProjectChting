package com.team1.chting.security;

import com.team1.chting.dto.LoginDto;
import com.team1.chting.dto.SessionDto;
import com.team1.chting.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Collections;

@Service
public class CustomOAuth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {

    @Autowired
    private final LoginService loginService;
    @Autowired
    private final HttpSession httpSession;

    public CustomOAuth2UserService(LoginService loginService, HttpSession httpSession) {
        this.loginService = loginService;
        this.httpSession = httpSession;
    }

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2UserService delegate = new DefaultOAuth2UserService();
        OAuth2User oAuth2User = delegate.loadUser(userRequest);

        String registrationId = userRequest.getClientRegistration().getRegistrationId();
        System.out.println("registrationId :: " + registrationId + oAuth2User.getName());

        LoginDto loginDto = loginService.isUser(oAuth2User.getName());

        String resultRole = null;
        if(loginDto == null) {
            resultRole = "ROLE_GUEST";
        } else {
            resultRole = "ROLE_USER";
            httpSession.setAttribute("user", new SessionDto(loginDto));
        }

        return new DefaultOAuth2User(
                Collections.singleton(new SimpleGrantedAuthority(resultRole)),
                oAuth2User.getAttributes(),
                userRequest.getClientRegistration().getProviderDetails().getUserInfoEndpoint().getUserNameAttributeName());
    }

}
