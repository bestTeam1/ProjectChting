package com.team1.chting.dto;

import java.util.Date;
import lombok.Data;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

//공지사항
@Data
public class NoticeDto {
	private int notice_no;
	private String userid;
	private String subject;
	private String content;
	private String file;
	private Date writedate;
	private int enabled;
	private String nickname;
	private CommonsMultipartFile fileName;

}
