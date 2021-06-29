package com.team1.chting.dto;

import java.util.Date;
import lombok.Data;

//가입신청내역
@Data
public class JoinRequestDto {
	private String userid;
	private String group_no;
	private Date reqdate;
}
