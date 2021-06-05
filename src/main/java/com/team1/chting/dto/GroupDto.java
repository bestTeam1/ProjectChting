package com.team1.chting.dto;

import java.util.Date;

import lombok.Data;

//모임
@Data
public class GroupDto {
	private String group_no;
	private String group_name;
	private String group_img;
	private int join_user;
	private String content;
	private String area_code;
	private String s_catecode;
	private int enabled;
	private Date opendate;
}
