package com.team1.chting.dto;

import java.util.Map;

public class UserDataDto {

    private String userid;
    private String nickname;
    private String email;
    private String profile_img;

    public UserDataDto(Map<String, Object> userData, String registrationId) {
        if(registrationId == "google-login"){

        }
    }



}
