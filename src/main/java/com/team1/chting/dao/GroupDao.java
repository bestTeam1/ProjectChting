package com.team1.chting.dao;

import com.team1.chting.dto.*;
import org.apache.ibatis.annotations.Param;
import com.team1.chting.utils.Criteria;
import org.springframework.dao.DataIntegrityViolationException;
import java.util.Map;
import java.util.List;

public interface GroupDao {
    // 게시글 작성
    // 게시글 상세보기
    // 게시글 수정
    // 게시글 삭제
    // 게시글 전체 목록

    public void wirte(GroupDto gdto);
    public List<GroupDto> listAll();


    //비회원 -> 랜덤모임 10개
    public List<GroupDto> randomGroup();

    //회원 -> 지역기반 5개
    public List<GroupDto> areaGroup(@Param("first_area") String first_area,@Param("second_area") String second_area);

    //회원 -> 관심사기반 5개
    public List<GroupDto> catecodeGroup(String userid);

    //로그인한 유저가 속한 그룹리스트
    public List<GroupDto> userGroupList(String userid);

    //그룹메인페이지 -> 그룹넘버를 이용한 그룹 검색
    public GroupDto groupByGroup_no(String group_no);

    // 게시글 작성
    public void insert(PostDto postDto);

    // 게시글 상세보기
    // PostDto
    public PostDto read(@Param("post_no")int post_no);

    // 게시글 수정
    public int update(@Param("post_no") int post_no,
                      @Param("subject") String subject,
                      @Param("content") String content,
                      @Param("file") String file);


    // 게시글 삭제
    public void delete(@Param("post_no") int post_no);


    // 게시글 전체 목록
    public List<PostDto> getPostList(@Param("group_no") String group_no);

    // 페이징 리스트?
    public List<Map<String, Object>> postList(Criteria cri);


    // 댓글목록
   public List<PostReplyDto> getReply(int post_no);
    // 댓글입력
    public int replyWrite(PostReplyDto postReplyDto);


    // 댓글수정
    public PostReplyDto replyUpdate(PostReplyDto postReplyDto);
    // 댓글삭제
    public int replyDelete(int reply_no);

    //모임 생성
    public int insertGroup(GroupDto groupDto);

    //마지막 생성된 모임 가져오기
    public GroupDto selectGroup();

    //유저아이디, 그룹번호로 그룹권한체크
    public String selectGroupRoleNo(@Param("userid") String userid, @Param("group_no") String group_no);

    //그룹가입요청 인서트
    public int insertGroupJoinRequest(JoinRequestDto dto);

    public int deleteGroupUserRole(GroupUserRoleDto dto);

}
