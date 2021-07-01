package com.team1.chting.dto.social;

import java.util.Map;

public class SocialDataFactory {

    public static SocialData getSocialData(Map<String, Object> userData, String registrationId) {
        if ("google-login".equalsIgnoreCase(registrationId)) {
            return new Google(userData, registrationId);
        } else if ("kakao-login".equalsIgnoreCase(registrationId)) {
            return new Kakao(userData, registrationId);
        } else if ("github-login".equalsIgnoreCase(registrationId)) {
            return new Github(userData, registrationId);
        }
        return null;
    }

}
