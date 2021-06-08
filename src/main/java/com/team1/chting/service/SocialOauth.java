package com.team1.chting.service;

import com.team1.chting.helper.SocialLoginType;

public interface SocialOauth {
    String getOauthRedirectURL();
    String requestAccessToken(String code);

    default SocialLoginType type() {
        if (this instanceof KaKaoOauth) {
           return SocialLoginType.KAKAO;
        } else {
            return null;
        }
    }

}
