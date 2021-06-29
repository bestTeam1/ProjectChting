//package com.team1.chting.security;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.context.annotation.PropertySource;
//import org.springframework.core.env.Environment;
//import org.springframework.security.oauth2.client.registration.ClientRegistration;
//import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
//import org.springframework.security.oauth2.core.AuthorizationGrantType;
//import org.springframework.security.oauth2.core.ClientAuthenticationMethod;
//import org.springframework.stereotype.Component;
//import org.springframework.util.Assert;
//
//import java.util.ArrayList;
//import java.util.Iterator;
//import java.util.List;
//import java.util.Map;
//
//@Component
//@Configuration
//@PropertySource(value = {"classpath:properties/Social.properties"})
//public class CustomInMemoryClientRegistrationRepository implements ClientRegistrationRepository, Iterable<ClientRegistration> {
//
//    @Autowired
//    private Environment env;
//
//    public Map<String, ClientRegistration> registrationMap;
//
//    //구글 생성
//    private ClientRegistration googleClientRegistration() {
//        List<String> scopeList = new ArrayList<>();
//        scopeList.add("profile");
//        scopeList.add("email");
//
//        return ClientRegistration.withRegistrationId("google-login")
//                .clientId(env.getProperty("google.client-id"))
//                .clientSecret(env.getProperty("google.client-secret"))
//                .clientAuthenticationMethod(ClientAuthenticationMethod.BASIC)
//                .redirectUriTemplate("{baseUrl}/login/oauth2/code/{registrationId}")
//                .clientName("Google")
//                .tokenUri(env.getProperty("google.token-uri"))
//                .authorizationUri(env.getProperty("google.authorization-uri"))
//                .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
//                .scope(scopeList)
//                .userNameAttributeName("sub")
//                .userInfoUri(env.getProperty("google.userinfo-uri"))
//                .jwkSetUri(env.getProperty("google.jwk-set-uri"))
//                .build();
//    }
//
//    //카카오 생성
//    private ClientRegistration kakaoClientRegistration() {
//        return ClientRegistration.withRegistrationId("kakao-login")
//                .clientId(env.getProperty("kakao.client-id"))
//                .clientAuthenticationMethod(ClientAuthenticationMethod.BASIC)
//                .redirectUriTemplate("{baseUrl}/login/oauth2/code/{registrationId}")
//                .clientName("Kakao")
//                .tokenUri(env.getProperty("kakao.token-uri"))
//                .authorizationUri(env.getProperty("kakao.authorization-uri"))
//                .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
//                .scope("")
//                .userNameAttributeName("id")
//                .userInfoUri(env.getProperty("kakao.userinfo-uri"))
//                .jwkSetUri(env.getProperty("kakao.jwk-set-uri"))
//                .build();
//    }
//
//    private ClientRegistration githubClientRegistration() {
//        return ClientRegistration.withRegistrationId("github-login")
//                .clientId(env.getProperty("github.client-id"))
//                .clientSecret(env.getProperty("github.client-secret"))
//                .clientAuthenticationMethod(ClientAuthenticationMethod.BASIC)
//                .redirectUriTemplate("{baseUrl}/login/oauth2/code/{registrationId}")
//                .clientName("Github")
//                .tokenUri(env.getProperty("github.token-uri"))
//                .authorizationUri(env.getProperty("github.authorization-uri"))
//                .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
//                .scope("")
//                .userNameAttributeName("id")
//                .userInfoUri(env.getProperty("github.userinfo-uri"))
//                .build();
//    }
//
//    @Override
//    public ClientRegistration findByRegistrationId(String registrationId) {
//        if(this.registrationMap.size() != 3) {
//            ClientRegistration googleObject = googleClientRegistration();
//            ClientRegistration kakaoObject = kakaoClientRegistration();
//            ClientRegistration githubObject = githubClientRegistration();
//
//            this.registrationMap.put(googleObject.getClientName(), googleObject);
//            this.registrationMap.put(kakaoObject.getClientName(), kakaoObject);
//            this.registrationMap.put(githubObject.getClientName(), githubObject);
//        }
//
//        Assert.hasText(registrationId, "registrationId cannot be empty");
//        return this.registrationMap.get(registrationId);
//    }
//
//    @Override
//    public Iterator<ClientRegistration> iterator() {
//        return this.registrationMap.values().iterator();
//    }
//}
