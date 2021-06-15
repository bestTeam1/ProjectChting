package com.team1.chting.dao;

import com.team1.chting.dto.GroupDto;
import com.team1.chting.dto.NoticeDto;
import com.team1.chting.utils.AdminCriteria;

import java.util.List;

public interface AdminDao {

    //페이징처리한 글목록록
   public List<GroupDto> listCri(AdminCriteria cri) throws Exception;

    //공지사항에 있는 글정보를 확인
    public List<NoticeDto> listPage(int page) throws Exception;

    //페이징 처리하는 동작(Criteria 객체 사용)
    public List<NoticeDto> listPageCri(AdminCriteria cri) throws Exception;

    //DB 테이블에 있는 모든 글 개수 계산 후 리턴
    public int pageCount() throws Exception;

}
