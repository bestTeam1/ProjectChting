package com.team1.chting.dao;

import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.NoticeDto;
import com.team1.chting.dto.UserDto;
import com.team1.chting.utils.AdminCriteria;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminDao {

    //공지사항에 있는 글정보를 확인
    public List<NoticeDto> listPageNotice(@Param("page") int page) throws Exception;

    //공지사항에 있는 글정보를 확인
    public List<NoticeDto> listPageUser(@Param("page") int page) throws Exception;

    //공지 페이징 처리하는 동작(Criteria 객체 사용)
    public List<NoticeDto> listPageCriNotice(AdminCriteria cri) throws Exception;

    //유저 페이징 처리하는 동작(Criteria 객체 사용)
    public List<NoticeDto> listPageCriUser(AdminCriteria cri) throws Exception;





    //공지사항 삭제하기
    public void deleteAdminNotice(@Param("noticeNo") String noticeNo);

    //DB 테이블에 있는 모든 글 개수 계산 후 리턴
    public int pageCount() throws Exception;

    //공지사항 상세보기
    public NoticeDto getNoticeDetail(@Param("noticeNo") String noticeNo);

    //공지사항 수정 및 체크 (0 = fail, 1 = success)
    public int adminNoticeModifyOk(@Param("subject") String subject,
                                   @Param("content") String content,
                                   @Param("noticeNo") String noticeNo);


}
