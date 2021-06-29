package com.team1.chting.dto;

import java.util.Date;
import lombok.Data;

//일정
@Data
public class CalendarDto {
	private int schedule_no;
	private String group_no;
	private String subject;
	private String content;
	private Date startdate;
	private Date enddate;
}
