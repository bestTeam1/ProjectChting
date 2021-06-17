package com.team1.chting.dao;

import com.team1.chting.dto.InterestCategoryDto;
import com.team1.chting.dto.UserDto;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface InterestCategoryDao {

    //관심사 선택 (중분류)
    List<InterestCategoryDto> selectInterestCategory(@RequestParam("list") List<InterestCategoryDto> list,
                                                     @RequestParam("userid") String userid);

    //관심사 UPDATE
    int updateInterestCategory(@RequestParam("list") List<InterestCategoryDto> list);
}
