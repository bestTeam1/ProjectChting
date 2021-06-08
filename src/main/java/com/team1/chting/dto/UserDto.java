package com.team1.chting.dto;

import java.util.Date;

import lombok.Data;

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
	private String s_catename;

}
