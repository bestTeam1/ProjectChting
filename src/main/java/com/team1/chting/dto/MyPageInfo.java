package com.team1.chting.dto;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

@Data
@Accessors(chain = true)
public class MyPageInfo {

    private String userid;
    private UserDto userInfoBasic;
    private List<UserDto> userInterest;
    private List<UserDto> userJoinGroup;

}
