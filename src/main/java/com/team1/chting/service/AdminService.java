package com.team1.chting.service;

import com.team1.chting.dao.AdminDao;
import com.team1.chting.dao.BoardDao;
import com.team1.chting.dto.*;
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
    public List<NoticeDto> listCriNotice(AdminCriteria cri) throws Exception {

        AdminDao adminDao = sqlsession.getMapper(AdminDao.class);

        return adminDao.listPageCriNotice(cri);
    }

    //DB테이블에 있는 모든 글 개수 리턴
    public int pageCount() throws Exception {

        AdminDao adminDao = sqlsession.getMapper(AdminDao.class);

        return adminDao.pageCount();
    }

    //공지페이징
    public List<NoticeDto> listPageNotice(int page) throws Exception {
        //page가 0인경우 1로 바꿔서 처리
        if(page <= 0) {
            page = 1;
        }
        page = (page - 1) * 10;

        return sqlsession.selectList("listPageNotice", page);
    }

    //공지 페이징 처리하는 동작(Criteria 객체 사용)
    public List<NoticeDto> listPageCriNotice(AdminCriteria cri) throws Exception {
        return sqlsession.selectList("listPageCriNotice", cri);
    }


    //DB테이블에 있는 모든 공지글 개수 계산 후 리턴
    public int pageCountNotice() throws Exception {

        return sqlsession.selectOne("pageCountNotice");
    }

    //페이지처리한 글 목록
    public List<EventDto> listCriEvent(AdminCriteria cri) throws Exception {

        AdminDao adminDao = sqlsession.getMapper(AdminDao.class);

        return adminDao.listPageCriEvent(cri);
    }

    //페이지처리한 글 목록(공지)
    public List<NoticeDto> listCriUser(AdminCriteria cri) throws Exception {

        AdminDao adminDao = sqlsession.getMapper(AdminDao.class);

        return adminDao.listPageCriUser(cri);
    }

    //페이지처리한 글 목록(모임)
    public List<GroupDto> listCriGroup(AdminCriteria cri) throws Exception {

        AdminDao adminDao = sqlsession.getMapper(AdminDao.class);

        return adminDao.listPageCriGroup(cri);
    }

    //유저 페이징
    public List<NoticeDto> listPageUser(int page) throws Exception {
        //page가 0인경우 1로 바꿔서 처리
        if(page <= 0) {
            page = 1;
        }
        page = (page - 1) * 10;

        return sqlsession.selectList("listPageUser", page);
    }

    //유저 페이징 처리하는 동작(Criteria 객체 사용)
    public List<UserDto> listPageCriUser(AdminCriteria cri) throws Exception {
        return sqlsession.selectList("listPageCriUser", cri);
    }

    //DB테이블에 있는 모든 유저수 계산 후 리턴
    public int pageCountEvent() throws Exception {

        return sqlsession.selectOne("pageCountEvent");
    }
    //DB테이블에 있는 모든 유저수 계산 후 리턴
    public int pageCountUser() throws Exception {

        return sqlsession.selectOne("pageCountUser");
    }

    //DB테이블에 있는 모든 유저수 계산 후 리턴
    public int pageCountGroup() throws Exception {

        return sqlsession.selectOne("pageCountGroup");
    }


    //공지사항 삭제하기
    public void deleteAdminNotice(String noticeNo) {

        AdminDao adminDao = sqlsession.getMapper(AdminDao.class);
        adminDao.deleteAdminNotice(noticeNo);

    }

    //공지사항 상세보기
    public NoticeDto getNoticeDetail(String noticeNo) {

        AdminDao adminDao = sqlsession.getMapper(AdminDao.class);
        NoticeDto noticeDto = adminDao.getNoticeDetail(noticeNo);

        return noticeDto;
    }

    //이벤트 상세보기
    public EventDto getEventDetail(String eventNo) {

        AdminDao adminDao = sqlsession.getMapper(AdminDao.class);
        EventDto eventDto = adminDao.getEventDetail(eventNo);

        return eventDto;
    }


    //공지사항 수정완료
    public boolean adminNoticeModifyOk(String subject, String content, String noticeNo) {

        AdminDao adminDao = sqlsession.getMapper(AdminDao.class);
        int isModified =  adminDao.adminNoticeModifyOk(subject, content, noticeNo);

        if (isModified == 0) {
            System.out.println("isModified == 0 , Modify failed error");
            return false;
        } else if (isModified == 1) {
            return true;
        } else { return false; }
    }

}

