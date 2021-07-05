package com.team1.chting.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.core.AuthorizationGrantType;
import org.springframework.security.oauth2.core.ClientAuthenticationMethod;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
@Configuration
@PropertySource(value = {"classpath:properties/Social.properties"})
public class CustomClientRegistrationRepository implements ClientRegistrationRepository {

    @Autowired
    private Environment env;

    @Override
    public ClientRegistration findByRegistrationId(String registrationId) {
        if(registrationId.equalsIgnoreCase("google-login")) {
            return googleClientRegistration(registrationId);
        } else if(registrationId.equalsIgnoreCase("kakao-login")) {
            return kakaoClientRegistration(registrationId);
        } else if(registrationId.equalsIgnoreCase("github-login")) {
            return githubClientRegistration(registrationId);
        }
        return null;
    }

    private ClientRegistration googleClientRegistration(String registrationId) {
        List<String> scopeList = new ArrayList<>();
        scopeList.add("profile");
        scopeList.add("email");

        return ClientRegistration.withRegistrationId(registrationId)
                .clientId(env.getProperty("google.client-id"))
                .clientSecret(env.getProperty("google.client-secret"))
                .clientAuthenticationMethod(ClientAuthenticationMethod.BASIC)
                .redirectUriTemplate("{baseUrl}/login/oauth2/code/{registrationId}")
                .clientName("Google")
                .tokenUri("https://www.googleapis.com/oauth2/v4/token")
                .authorizationUri("https://accounts.google.com/o/oauth2/v2/auth")
                .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
                .scope(scopeList)
                .userNameAttributeName("sub")
                .userInfoUri("https://www.googleapis.com/oauth2/v3/userinfo")
                .jwkSetUri("https://www.googleapis.com/oauth2/v3/certs")
                .build();
    }

    private ClientRegistration kakaoClientRegistration(String registrationId) {
        return ClientRegistration.withRegistrationId(registrationId)
                .clientId(env.getProperty("kakao.client-id"))
                .clientAuthenticationMethod(ClientAuthenticationMethod.BASIC)
                .redirectUriTemplate("{baseUrl}/login/oauth2/code/{registrationId}")
                .clientName("Kakao")
                .tokenUri("https://kauth.kakao.com/oauth/token")
                .authorizationUri("https://kauth.kakao.com/oauth/authorize")
                .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
                .scope("")
                .userNameAttributeName("id")
                .userInfoUri("https://kapi.kakao.com/v2/user/me")
                .jwkSetUri("https://kapi.kakao.com/v1/user/access_token_info")
                .build();
    }

    private ClientRegistration githubClientRegistration(String registrationId) {
        return ClientRegistration.withRegistrationId(registrationId)
                .clientId(env.getProperty("github.client-id"))
                .clientSecret(env.getProperty("github.client-secret"))
                .clientAuthenticationMethod(ClientAuthenticationMethod.BASIC)
                .redirectUriTemplate("{baseUrl}/login/oauth2/code/{registrationId}")
                .clientName("Github")
                .tokenUri("https://github.com/login/oauth/access_token")
                .authorizationUri("https://github.com/login/oauth/authorize")
                .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
                .scope("")
                .userNameAttributeName("id")
                .userInfoUri("https://api.github.com/user")
                .build();
    }

}
