package com.team1.chting.dto.social;

import lombok.Data;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

@Data
public class Google extends SocialData {

    private String userid;
    private String nickname;
    private String email;
    private String profile_img;
    private String logintype;

    public Google(Map<String, Object> userData, String registrationId) {
        Set<String> userDataSet = userData.keySet();
        Iterator<String> Iter_userDataSet = userDataSet.iterator();
        while (Iter_userDataSet.hasNext()) {
            String next = Iter_userDataSet.next();
            if (next.equals("sub")) {
                this.userid = userData.get(next).toString();
            } else if (next.equals("name")) {
                this.nickname = userData.get(next).toString();
            } else if (next.equals("email")) {
                this.email = userData.get(next).toString();
            } else if (next.equals("picture")) {
                this.profile_img = userData.get(next).toString();
            }
        }
        this.logintype = registrationId.substring(0, registrationId.lastIndexOf("-"));
    }

    @Override
    public String getUserid() {
        return this.userid;
    }

    @Override
    public String getNickname() {
        return this.nickname;
    }

    @Override
    public String getEmail() {
        return this.email;
    }

    @Override
    public String getProfile_img() {
        return this.profile_img;
    }

    @Override
    public String getLoginType() {
        return this.logintype;
    }
}
