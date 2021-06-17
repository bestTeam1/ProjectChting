package com.team1.chting.dto;
import lombok.Data;

import java.util.List;

//관심사 카테고리
@Data
public class InterestCategoryDto {
    private String userid;
    private String catecode;
    private String catename;
    private String parent_catecode;
    private String parent_catename;
}
