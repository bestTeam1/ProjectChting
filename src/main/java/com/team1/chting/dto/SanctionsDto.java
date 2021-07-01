package com.team1.chting.dto;

import java.util.Date;

import lombok.Data;

//제재내역
@Data
public class SanctionsDto {
    private int sanc_no;
    private String userid;
    private String sanc_reason;
    private int enabled;
    private Date startdate;
    private Date enddate;
    private Date sancdate;

}
