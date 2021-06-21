package com.team1.chting.dto;

import lombok.Data;

import java.util.Date;

@Data
public class ChattingDto {
	private String group_no;
	private String userid;
	private String message;
	private String writeDate;
	private String messageType;
}
