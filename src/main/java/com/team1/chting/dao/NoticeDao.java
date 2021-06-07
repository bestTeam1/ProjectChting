package com.team1.chting.dao;

import com.team1.chting.dto.NoticeDto;

import java.util.List;

public interface NoticeDao {
    //최근 공지사항 2개
    public List<NoticeDto> recentlyNotice();
}
