package com.team1.chting.dto;

import java.sql.Date;

import lombok.Data;

//이벤트
@Data
public class EventDto {
    private int event_no;
    private String userid;
    private String subject;
    private String content;
    private Date startdate;
    private Date enddate;
    private Date writedate;
    private String file;
    private String event_img;
    private Date currentDate;
    private int enabled;
}
