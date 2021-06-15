package com.team1.chting.service;

import com.team1.chting.dao.AdminDao;
import com.team1.chting.dao.BoardDao;
import com.team1.chting.dto.AreaDto;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.NoticeDto;
import com.team1.chting.utils.AdminCriteria;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

//취팅 사이트 관리자 Service
@Service
public class AdminService {

    @Autowired
    private SqlSession sqlsession;

    //페이지처리한 글 목록
    public List<NoticeDto> listCri(AdminCriteria cri) throws Exception {

        AdminDao adminDao = sqlsession.getMapper(AdminDao.class);

        return adminDao.listPageCri(cri);
    }

    //DB테이블에 있는 모든 글 개수 리턴
    public int pageCount() throws Exception {

        AdminDao adminDao = sqlsession.getMapper(AdminDao.class);

        return adminDao.pageCount();
    }

    //페이징
    public List<NoticeDto> listPage(int page) throws Exception {
        //page가 0인경우 1로 바꿔서 처리
        if(page <= 0) {
            page = 1;
        }
        page = (page - 1) * 10;

        return sqlsession.selectList("listPage", page);
    }

    //페이징 처리하는 동작(Criteria 객체 사용)
    public List<NoticeDto> listPageCri(AdminCriteria cri) throws Exception {
        System.out.println("AdminService : listPageCri 호출");

        return sqlsession.selectList("listPageCri", cri);
    }

    //DB테이블에 있는 모든 글 개수 계산 후 리턴
    public int PageCount() throws Exception {

        return sqlsession.selectOne("pageCount");
    }

    //공지사항 상세보기
    public NoticeDto getNoticeDetail(String noticeNo) {

        AdminDao adminDao = sqlsession.getMapper(AdminDao.class);
        NoticeDto noticeDto = adminDao.getNoticeDetail(noticeNo);

        return noticeDto;
    }



}
