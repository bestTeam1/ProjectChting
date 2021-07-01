package com.team1.chting.dto;

import java.sql.Date;

import lombok.Data;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

//회원
@Data
public class UserDto {
    private String userid;
    private String password;
    private String nickname;
    private String gender;
    private Date birth;
    private String profile_img;
    private String email;
    private String content;
    private String first_area;
    private String second_area;
    private int enabled;
    private Date joindate;
    private String first_area_name;
    private String second_area_name;
    private String group_name;
    private String catename;
    private int cnt;
    private int group_role_no;
    private String group_no;
    private CommonsMultipartFile fileName;
    private String logintype;
}
