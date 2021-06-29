package com.team1.chting.service;

import com.team1.chting.dao.NoticeDao;
import com.team1.chting.dto.NoticeDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Service
public class NoticeService {
    @Autowired
    private SqlSession sqlSession;

    public List<NoticeDto> recentlyNotice(){
        List<NoticeDto> list = new ArrayList<NoticeDto>();
        NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
        list = dao.recentlyNotice();

        return list;
    }
}
