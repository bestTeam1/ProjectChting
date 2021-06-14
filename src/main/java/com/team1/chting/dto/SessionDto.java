package com.team1.chting.dto;

import lombok.Getter;

import java.io.Serializable;

@Getter
public class SessionDto implements Serializable {

    private String userid;
    private String userrole;

    public SessionDto(LoginDto loginDto) {
        this.userid = loginDto.getUserid();
        this.userrole = loginDto.getRole();
    }

}
