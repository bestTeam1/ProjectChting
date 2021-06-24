package com.team1.chting.dto;

import lombok.Data;

import java.sql.Date;

@Data
public class DiaryDto {
	private String schedule_no;
	private String group_no;
	private String type;
	private Date startdate;
	private String location;
	private String content;
	private String subject;
	private String calDate;
	private double xcoord;
	private double ycoord;
}
