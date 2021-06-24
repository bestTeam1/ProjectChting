package com.team1.chting.security;

import com.team1.chting.dto.LoginDto;
import com.team1.chting.dto.SessionDto;
import com.team1.chting.service.LoginService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserRequest;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.oidc.user.DefaultOidcUser;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Collections;

@RequiredArgsConstructor
@Service
public class CustomOidcUserService implements OAuth2UserService<OidcUserRequest, OidcUser> {

    private final LoginService loginService;

    @Override
    public OidcUser loadUser(OidcUserRequest userRequest) throws OAuth2AuthenticationException {
        OidcUserService delegate = new OidcUserService();
        OidcUser oidcUser = delegate.loadUser(userRequest);

        System.out.println("oidcUser ToString :: " + oidcUser.toString());

        LoginDto loginDto = loginService.isUser(oidcUser.getName());

        String resultRole = null;
        if(loginDto == null) {
            resultRole = "ROLE_GUEST";
        } else {
            resultRole = loginDto.getRole();
        }

        return new DefaultOidcUser(
                Collections.singleton(new SimpleGrantedAuthority(resultRole)),
                oidcUser.getIdToken(),
                oidcUser.getUserInfo(),
                userRequest.getClientRegistration().getProviderDetails().getUserInfoEndpoint().getUserNameAttributeName());
    }
}
