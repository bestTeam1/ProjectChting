package com.team1.chting.dto;

import java.sql.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.jackson.Jacksonized;

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
	private String area_name;
	private String parent_catename;
	private int enabled;
	private Date opendate;
}
