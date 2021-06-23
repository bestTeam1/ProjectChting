package com.team1.chting.dto.social;

import lombok.ToString;

@ToString
public abstract class SocialData {
    public abstract String getUserid();
    public abstract String getNickname();
    public abstract String getEmail();
    public abstract String getProfile_img();
    public abstract String getLoginType();

}
