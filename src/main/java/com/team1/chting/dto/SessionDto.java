package com.team1.chting.dto;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;

import java.io.Serializable;

@Data
public class SessionDto implements Serializable {
    /*
    회원가입 유저 Session 추가
    작성자 : 김수연
    작성일 : 2021-06-14
    */

    private String userid;
    private String userrole;

    public SessionDto(LoginDto loginDto) {
        this.userid = loginDto.getUserid();
        this.userrole = loginDto.getRole();
    }

}
