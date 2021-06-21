package com.team1.chting.service;

import com.team1.chting.dao.AdminDao;
import com.team1.chting.dao.BoardDao;
import com.team1.chting.dto.*;
import com.team1.chting.utils.AdminCriteria;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
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

    public void noticeWrite(NoticeDto noticeDto, HttpServletRequest httpServletRequest, CommonsMultipartFile file) throws Exception {
        //if(noticeDto.getFile() != null) {
        //CommonsMultipartFile file = noticeDto.getFileName();
        if(file != null && file.getSize() > 0 && !file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            fileName = noticeDto.getNotice_no() + "." + fileName.split("\\.")[1];
            String path = httpServletRequest.getSession().getServletContext().getRealPath("/upload/notice");
            String fpath = path + File.separator + fileName;

            System.out.println("fpath : " + fpath);

            if(!fileName.equals("")) {
                FileOutputStream fs = new FileOutputStream(fpath);
                fs.write(file.getBytes());
                fs.close();
            }
            noticeDto.setFile(fileName);
        }

        AdminDao adminDao = sqlsession.getMapper(AdminDao.class);
        int result = adminDao.noticeWrite(noticeDto);

        if (result < 1) {
            System.out.println("db write error on write()");
        }
    }
    //이벤트 글쓰기
    public void eventWrite(EventDto eventDto, HttpServletRequest httpServletRequest, CommonsMultipartFile file) throws Exception {
        //if(noticeDto.getFile() != null) {
        //CommonsMultipartFile file = noticeDto.getFileName();
        if(file != null && file.getSize() > 0 && !file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            fileName = eventDto.getEvent_no() + "." + fileName.split("\\.")[1];
            String path = httpServletRequest.getSession().getServletContext().getRealPath("/upload/event");
            String fpath = path + File.separator + fileName;

            System.out.println("fpath : " + fpath);

            if(!fileName.equals("")) {
                FileOutputStream fs = new FileOutputStream(fpath);
                fs.write(file.getBytes());
                fs.close();
            }
            eventDto.setFile(fileName);
        }

        AdminDao adminDao = sqlsession.getMapper(AdminDao.class);
        int result = adminDao.eventWrite(eventDto);

        if (result < 1) {
            System.out.println("db write error on write()");
        }
    }
    //이벤트 수정
    public void eventModify(EventDto eventDto, HttpServletRequest httpServletRequest, CommonsMultipartFile file) throws Exception {
        if(file != null && file.getSize() > 0 && !file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            fileName = eventDto.getEvent_no() + "." + fileName.split("\\.")[1];
            String path = httpServletRequest.getSession().getServletContext().getRealPath("/upload/event");
            String fpath = path + File.separator + fileName;

            System.out.println("fpath : " + fpath);

            if(!fileName.equals("")) {
                FileOutputStream fs = new FileOutputStream(fpath);
                fs.write(file.getBytes());
                fs.close();
            }
            eventDto.setFile(fileName);
        }

        AdminDao adminDao = sqlsession.getMapper(AdminDao.class);
        int result = adminDao.eventModify(eventDto);

        if (result < 1) {
            System.out.println("db write error on write()");
        }


    }



    //공지사항 삭제하기
    public void adminDeleteBoard(String type, String num) {

        AdminDao adminDao = sqlsession.getMapper(AdminDao.class);
        adminDao.adminDeleteBoard(type, num);

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
    //이벤트 취소
    public int adminEventDisabled(String eventNo) {
        AdminDao adminDao = sqlsession.getMapper(AdminDao.class);

        return adminDao.adminEventDisabled(eventNo);
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

    //게시글 작성에 쓰일 번호
    public int getWriteNo(String type) {
        AdminDao adminDao = sqlsession.getMapper(AdminDao.class);
        int writeNo = adminDao.getWriteNo(type);

        return writeNo + 1;
    }

}

