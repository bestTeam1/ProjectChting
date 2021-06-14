package com.team1.chting.dto;

import lombok.Builder;
import lombok.Data;

@Data
public class LoginDto {
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
