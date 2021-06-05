package com.team1.chting.dto;

import java.util.Date;

import lombok.Data;

//신고내역
@Data
public class ReportDto {
	private int report_no;
	private String report_uid;
	private String reported_uid;
	private String content;
	private String file;
	private Date reportdate;
}
