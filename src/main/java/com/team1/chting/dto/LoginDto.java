package com.team1.chting.dto;

import lombok.Builder;
import lombok.Data;

@Data
public class LoginDto {
    /*
    DB 회원가입 여부 확인
    작성자 : 김수연
    작성일 : 2021-06-14
    */
    private String userid;
    private int enabled;
    private String role;

    @Builder
    public LoginDto(String userid, int enabled, String role) {
        this.userid = userid;
        this.enabled = enabled;
        this.role = role;
    }
}
