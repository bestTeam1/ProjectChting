package com.team1.chting.dto;

import lombok.Data;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import java.sql.Date;

@Data
public class SignUpDto {
    private  String userid;
    private String password;
    private  String nickname;
    private  String gender;
    private  Date birth;
    private  String profile_img;
    private  String email;
    private  String content;
    private  String first_area;
    private  String second_area;
    private int enabled;
    private Date joindate;
    private String logintype;
    private  CommonsMultipartFile fileName;
}
