package com.team1.chting.dao;

import com.team1.chting.dto.EventDto;
import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.NoticeDto;
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
    public List<EventDto> listPageCriEvent(AdminCriteria cri) throws Exception;

    //유저 페이징 처리하는 동작(Criteria 객체 사용)
    public List<NoticeDto> listPageCriUser(AdminCriteria cri) throws Exception;

    //모임 페이징 처리하는 동작(Criteria 객체 사용)
    public List<GroupDto> listPageCriGroup(AdminCriteria cri) throws Exception;

    //삭제하기
    public void adminDeleteBoard(@Param("type") String type, @Param("num") String num);

    //DB 테이블에 있는 모든 글 개수 계산 후 리턴
    public int pageCount() throws Exception;

    //공지사항 상세보기
    public NoticeDto getNoticeDetail(@Param("noticeNo") String noticeNo);

    //이벤트 상세보기
    public EventDto getEventDetail(@Param("eventNo") String eventNo);

    //공지사항 수정 및 체크 (0 = fail, 1 = success)
    public int adminNoticeModifyOk(@Param("subject") String subject,
                                   @Param("content") String content,
                                   @Param("noticeNo") String noticeNo);

    //공지 글쓰기
    public int noticeWrite(NoticeDto noticeDto);

    //이벤트 글쓰기
    public int eventWrite(EventDto eventDto);

    //이벤트 수정
    public int eventModify(EventDto eventDto);

    //이벤트 취소
    public int adminEventDisabled(@Param("eventNo") String eventNo);

    //글쓰기 번호
    public int getWriteNo(@Param("type") String type);


}
