package com.team1.chting.dto;

import java.sql.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.jackson.Jacksonized;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

//모임
@Data
public class GroupDto {
	private String userid;
	private String group_no;
	private String group_name;
	private String group_img;
	private String content;
	private String area_code;
	private String s_catecode;
	private String area_name;
	private String parent_catename;
	private int enabled;
	private int join_user;
	private Date opendate;
	private CommonsMultipartFile fileName;
}
