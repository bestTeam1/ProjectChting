package com.team1.chting.dto;

import lombok.Data;

//캘린더 처음로딩시 일정 자동으로 보여줌
@Data
public class DiaryCalDto {
    private String schedule_no;
    private String title;
    private String start;
    private double xcoord;
    private double ycoord;
}
