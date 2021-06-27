package com.team1.chting.dto;

import lombok.Data;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.sql.Date;

@Data
public class PostCategoryDto {
	private String post_catecode;
	private String post_catename;

}
