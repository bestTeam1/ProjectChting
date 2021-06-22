<%--
  Created by IntelliJ IDEA.
  User: hyunsangjin
  Date: 2021/06/19
  Time: 12:01 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>댓글</title>
</head>
<body>

<%-- 댓글달기 --%>
<div class="container">
    <form id="commentForm" name="commentForm" method="post">
        <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">
                    <tr>
                        <td>
                            <textarea style="width: 900px" rows="3" cols="30" id="comment" name="comment" placeholder="1000자 이내로 입력해주세요 :)"
                                      onfocus="this.placeholder = ''"
                                      onblur="this.placeholder = '1000자 이내로 입력해주세요 :)'"></textarea>
                            <br>
                            <div style="text-align: center">
                                <%-- <a href='#' onClick="fn_comment('${result.code }')" class="btn pull-right btn-success">등록</a>--%>
                                <input type="button" onclick="location.href='board_replyList.do?post_no='" value="댓글등록"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="b_code" name="b_code" value="" />
    </form>
</div>


<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
            <table>

                <c:forEach var="preply" items="${reply}">
                    <tr>
                        <td>${preply.reply_no}</td>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <td>${preply.post_no}</td>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <td>${preply.userid}</td>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <td>${preply.writedate}</td>
                        <br>
                        <td>${preply.content}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </form>
</div>

<script>
    /*
     * 댓글 등록하기(Ajax)
     */
    function fn_comment(code){

        $.ajax({
            type:'POST',
            url : "<c:url value='/board_replyWrite.do'/>",
            data:$("#commentForm").serialize(),
            success : function(data){
                if(data=="success")
                {
                   getCommentList();
                    $("#comment").val("");
                }
            },
            error:function(request,status,error){
                //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }

        });
    }

    /**
     * 초기 페이지 로딩시 댓글 불러오기
     */
    $(function(){

        getCommentList();

    });

    /**
     * 댓글 불러오기(Ajax)
     */
    function getCommentList(){

        $.ajax({
            type:'GET',
            url : "<c:url value='/board_replyList.do'/>",
            dataType : "json",
            data:$("#commentForm").serialize(),
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success : function(data){

                var html = "";
                var cCnt = data.length;

                if(data.length > 0){

                    for(i=0; i<data.length; i++){
                        html += "<div>";
                        html += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong></h6>";
                        html += data[i].comment + "<tr><td></td></tr>";
                        html += "</table></div>";
                        html += "</div>";
                    }

                } else {

                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                    html += "</table></div>";
                    html += "</div>";

                }

                $("#cCnt").html(cCnt);
                $("#commentList").html(html);

            },
            error:function(request,status,error){

            }

        });
    }

</script>

</body>
</html>
