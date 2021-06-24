package com.team1.chting.dto;

import lombok.Data;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.sql.Date;

@Data
public class PostDto {
	private int post_no;
	private String group_no;
	private String userid;
	private String nickname;
	private String post_catecode;
	private String post_catename;
	private String subject;
	private String content;
	private String file;
	private Date writedate;
	private CommonsMultipartFile fileName;
	private int enabled;


}
