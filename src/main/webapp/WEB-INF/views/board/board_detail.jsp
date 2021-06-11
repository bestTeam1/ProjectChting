<%--
  Created by IntelliJ IDEA.
  User: hyunsangjin
  Date: 2021/06/07
  Time: 2:42 오후
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset=UTF-8">
    <title>내가 가입한 모임 - 상세보기</title>
    <style>

        html,
        body {
            position: relative;
            height: 100%;
        }
        body {
            background: #eee;
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 14px;
            color: #000;
            margin: 0;
            padding: 0;
        }
        .swiper-container {
            width: 100%;
            height: 100%;
        }
        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;
            /* Center slide text vertically */
            display: -webkit-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -webkit-align-items: center;
            align-items: center;
        }
        .swiper-slide img {
            display: block;
            width: 100%;
            height: 50%;
            object-fit: cover;
        }
        a { text-decoration:none !important }
        a:hover { text-decoration:none !important }


    </style>
    <script type="text/javascript" src="http://code.jquery.com/jquery.jas"></script>
<%--    <script type="text/javascript">--%>
<%--        let i=0;--%>
<%--        $(function(){--%>
<%--            $('.upBtn').click(function(){--%>
<%--                $('.update').hide();--%>
<%--                let no=$(this).attr("data-no");--%>
<%--                if(i==0)--%>
<%--                {--%>
<%--                    $(this).text("취소");--%>
<%--                    $('#reply_up'+no).show();--%>
<%--                    i=1;--%>
<%--                }--%>
<%--                else--%>
<%--                {--%>
<%--                    $(this).text("수정");--%>
<%--                    $('#reply_up'+no).hide();--%>
<%--                    i=0;--%>
<%--                }--%>
<%--                // 대댓글 작성 공간--%>
<%--                $('.comment_Insert_area').hide();--%>

<%--                $('.bring_comment_tab').click(function(){				// bring_comment_tab 클릭시--%>
<%--                    let no = $(this).attr('id')						// 변수 no는 클릭한 bring_comment_tab의 value값--%>
<%--                    $('#comment_Insert_area' + no).toggle(); 			// #comment_Insert_area + no를 토글--%>
<%--                });--%>

<%--                // 댓글 수정 공간--%>
<%--                $('.comment_Update_area').hide();--%>

<%--                $('.bring_comment_update_tab').click(function(){				// bring_comment_tab 클릭시--%>
<%--                    let no = $(this).attr('id')						// 변수 no는 클릭한 bring_comment_tab의 value값--%>
<%--                    $('#comment_Update_area' + no).toggle(); 			// #comment_Insert_area + no를 토글--%>
<%--                });--%>


<%--                // 댓글 삭제 공간--%>
<%--                $('.inputPwdComment').hide();--%>

<%--                $('.deleteCommentButton').click(function(){				// bring_comment_tab 클릭시--%>
<%--                    let comment_no = $(this).attr('id')								// 변수 no는 클릭한 bring_comment_tab의 value값--%>
<%--                    $('#inputPwdComment' + comment_no).toggle(); 			// #comment_Insert_area + no를 토글--%>
<%--                });--%>
<%--            })--%>
<%--        });--%>
<%--    </script>--%>
</head>
<body class="is-preload">


<!-- Wrapper -->
<div id="wrapper">

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <jsp:include page="/WEB-INF/views/include/header.jsp" />
            <!-- Banner -->
            <section>
                <div class="content">
                    <header>
                        <table class="table table-striped">
                            <select id="post_catename" name="post_catename" style="width: 170px; float: right">
                                <option value="">===카테고리===</option>
                                <option value="자유글">자유글</option>
                                <option value="정모후기">정모후기</option>
                                <option value="가입인사">가입인사</option>
                                <option value="공지사항">공지사항</option>
                            </select>

                            <tr>
                                <th width=30%  class="text-center danger">제목</th>
                                <td colspan="3" class="text-left">${plist.subject }</td>
                            </tr>
                            </table>

                        <table>
                            <tr>
                                <th>내용</th>
                                <td colspan="4" class="text-left" valign="top" height=200>
                                    ${plist.content }
                                </td>
                            </tr>
                        </table>

                        <div style="display: flex; justify-content: center">
                            <input type="button" onclick="" value="수정"/> &nbsp;
                            <input type="button" onclick="" value="삭제"/> &nbsp;
                            <button type="button" onclick="location.href='#'">목록</button>
                        </div>

<%--                <div style=“display:flex; justify-content: center;“>--%>

<%--                    <button>--%>
<%--                        <a href="update.do?no=${plist.post_no}" >수정</a>--%>
<%--                    </button>--%>
<%--                    &nbsp;&nbsp;--%>
<%--                    <button>--%>
<%--                        <a type="button" href="delete.do?no=${plist.post_no}" >삭제</a>--%>
<%--                    </button>--%>
<%--                    &nbsp;&nbsp;--%>
<%--                    <button>--%>
<%--                        <a type="button" href="board_list.do">목록</a>--%>
<%--                    </button>--%>
<%--                </div>--%>

                    </header>
                </div>
            </section>
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
</div>
</div>
</body>
</html>

