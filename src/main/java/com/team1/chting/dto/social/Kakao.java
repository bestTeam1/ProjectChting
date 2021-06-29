package com.team1.chting.dto.social;

import lombok.Data;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

@Data
public class Kakao extends SocialData {

    private String userid;
    private String nickname;
    private String email;
    private String profile_img;
    private String logintype;

    public Kakao(Map<String, Object> userData, String registrationId) {
        Set<String> userDataSet = userData.keySet();
        Iterator<String> Iter_userDataSet = userDataSet.iterator();
        while (Iter_userDataSet.hasNext()) {
            String next = Iter_userDataSet.next();
            if(next.equals("id")) {
                this.userid = userData.get(next).toString();
            }else if(next.equals("properties")) {
                Map<String, Object> properties = (Map<String, Object>) userData.get(next);
                Set<String> propertiesSet = properties.keySet();
                Iterator<String> Iter_propertiesSet = propertiesSet.iterator();
                while (Iter_propertiesSet.hasNext()) {
                    String properties_next = Iter_propertiesSet.next();
                    if(properties_next.equals("nickname")) {
                        this.nickname = properties.get(properties_next).toString();
                    }else if(properties_next.equals("profile_image")) {
                        this.profile_img = properties.get(properties_next).toString();
                    }
                }
            }else if(next.equals("kakao_account")) {
                Map<String, Object> account = (Map<String, Object>) userData.get(next);
                Set<String> accountSet = account.keySet();
                Iterator<String> Iter_account = accountSet.iterator();
                while (Iter_account.hasNext()) {
                    String account_next = Iter_account.next();
                    if(account_next.equals("email")) {
                        this.email = account.get(account_next).toString();
                    }
                }
            }
        }
        if(this.email == null || this.email.equals("null")) {
            this.email = "emptyData";
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
