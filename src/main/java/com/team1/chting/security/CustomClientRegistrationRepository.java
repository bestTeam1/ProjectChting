//package com.team1.chting.security;
//
//import org.apache.commons.collections.map.HashedMap;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.context.annotation.PropertySource;
//import org.springframework.core.env.Environment;
//import org.springframework.security.oauth2.client.registration.ClientRegistration;
//import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
//import org.springframework.security.oauth2.core.AuthorizationGrantType;
//import org.springframework.security.oauth2.core.ClientAuthenticationMethod;
//import org.springframework.stereotype.Component;
//
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Map;
//
//@Component
//@Configuration
//@PropertySource(value = {"classpath:properties/Social.properties"})
//public class CustomClientRegistrationRepository implements ClientRegistrationRepository {
//
//    @Autowired
//    private Environment env;
//
//    public ClientRegistration Google;
//    public ClientRegistration Kakao;
//    public ClientRegistration Github;
//
//    @Override
//    public ClientRegistration findByRegistrationId(String s) {
//        if(s.equalsIgnoreCase("google-login")) {
//            return this.Google = googleClientRegistration(s);
//        } else if(s.equalsIgnoreCase("kakao-login")) {
//            return this.Kakao = kakaoClientRegistration(s);
//        } else if(s.equalsIgnoreCase("github-login")) {
//            return this.Github = githubClientRegistration(s);
//        }
//        return null;
//    }
//
//    private ClientRegistration googleClientRegistration(String s) {
//        List<String> scopeList = new ArrayList<>();
//        scopeList.add("profile");
//        scopeList.add("email");
//
//        return ClientRegistration.withRegistrationId(s)
//                .clientId(env.getProperty("google.client-id"))
//                .clientSecret(env.getProperty("google.client-secret"))
//                .clientAuthenticationMethod(ClientAuthenticationMethod.BASIC)
//                .redirectUriTemplate("{baseUrl}/login/oauth2/code/{registrationId}")
//                .clientName("Google")
//                .tokenUri("https://www.googleapis.com/oauth2/v4/token")
//                .authorizationUri("https://accounts.google.com/o/oauth2/v2/auth")
//                .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
//                .scope(scopeList)
//                .userNameAttributeName("sub")
//                .userInfoUri("https://www.googleapis.com/oauth2/v3/userinfo")
//                .jwkSetUri("https://www.googleapis.com/oauth2/v3/certs")
//                .build();
//    }
//
//    private ClientRegistration kakaoClientRegistration(String s) {
//        return ClientRegistration.withRegistrationId(s)
//                .clientId(env.getProperty("kakao.client-id"))
//                .clientAuthenticationMethod(ClientAuthenticationMethod.BASIC)
//                .redirectUriTemplate("{baseUrl}/login/oauth2/code/{registrationId}")
//                .clientName("Kakao")
//                .tokenUri("https://kauth.kakao.com/oauth/token")
//                .authorizationUri("https://kauth.kakao.com/oauth/authorize")
//                .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
//                .scope("")
//                .userNameAttributeName("id")
//                .userInfoUri("https://kapi.kakao.com/v2/user/me")
//                .jwkSetUri("https://kapi.kakao.com/v1/user/access_token_info")
//                .build();
//    }
//
//    private ClientRegistration githubClientRegistration(String s) {
//        return ClientRegistration.withRegistrationId(s)
//                .clientId(env.getProperty("github.client-id"))
//                .clientSecret(env.getProperty("github.client-secret"))
//                .clientAuthenticationMethod(ClientAuthenticationMethod.BASIC)
//                .redirectUriTemplate("{baseUrl}/login/oauth2/code/{registrationId}")
//                .clientName("Github")
//                .tokenUri("https://github.com/login/oauth/access_token")
//                .authorizationUri("https://github.com/login/oauth/authorize")
//                .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
//                .scope("")
//                .userNameAttributeName("id")
//                .userInfoUri("https://api.github.com/user")
//                .build();
//    }
//
//}
