package com.team1.chting.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Date;
import java.util.List;

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


}
