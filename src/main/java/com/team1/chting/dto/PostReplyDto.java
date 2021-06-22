package com.team1.chting.dto;

import java.util.Date;

import lombok.Data;

//댓글
@Data
public class PostReplyDto {
	private int reply_no;
	private int post_no;
	private String userid;
	private String content;
	private Date writedate;
	private String formatdate;
}
