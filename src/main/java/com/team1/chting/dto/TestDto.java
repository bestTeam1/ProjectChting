package com.team1.chting.dto;

import lombok.Builder;
import lombok.Data;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.io.Serializable;

@Data
@Builder
public class TestDto implements Serializable {
    private String userid;
    private Properties properties;
    private String user_role_name;

    public String getProfile_img() {
        return properties.profile_image;
    }

    @Builder
    public TestDto(String userid, Properties properties, String user_role_name) {
        this.userid = userid;
        this.properties = properties;
        this.user_role_name = user_role_name;
    }

    @Builder
    public TestDto(OAuth2User oAuth2User) {
        this.userid = oAuth2User.getName();
        this.properties = oAuth2User.getAttribute("proterties");
        this.user_role_name = oAuth2User.getAuthorities().toString();
    }


    @Data
    public class Properties {
        private String profile_image;
    }
}
