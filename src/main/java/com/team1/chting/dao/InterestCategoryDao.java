package com.team1.chting.dao;

import com.team1.chting.dto.AreaDto;
import com.team1.chting.dto.InterestCategoryDto;
import com.team1.chting.dto.UserDto;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface InterestCategoryDao {

    //관심사 리스트
    List<InterestCategoryDto> selectInterestCategory();

    //관심사 INSERT
    int insertInterestCategory(@RequestParam("list") List<InterestCategoryDto> list);

    //관심사 DELETE
    int deleteInterestCategory(String userid);
}
