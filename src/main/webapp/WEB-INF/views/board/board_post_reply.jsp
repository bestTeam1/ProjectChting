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
    <br><br>
    <div>
        <b1><strong>Reply</strong></b1>
        <div>
            <table class="table">
                <tr>
                    <td>
                            <textarea style="width: 900px" rows="3" id="content" name="content"
                                      placeholder="댓글사용시 로그인이 필요합니다."
                                      onfocus="this.placeholder = ''"
                                      onblur="this.placeholder = '댓글사용시 로그인이 필요합니다.'"></textarea>
                        <br>
                        <div style="text-align: center">
                            <%-- <a href='#' onClick="fn_comment('${result.code }')" class="btn pull-right btn-success">등록</a>--%>
                            <input type="button" id="submit" onclick="replyWrite()" value="댓글등록"/>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <input type="hidden" id="b_code" name="b_code" value=""/>
</div>


<div class="container">
    <div id="commentList">

    </div>
    <b3 id="cCnt"></b3>

    <div class="text" id="text">

    </div>

</div>
</body>
<script src="assets/js/jquery.min.js"></script>
<script>
    $(document).ready(getReplyList());

    /*
     * 댓글 등록하기(Ajax)
     */
    function replyWrite() {
        let json = {"post_no": '${plist.post_no}', "userid": userid, "content": $('#content').val()};
        $.ajax({
            url: 'board_replyWrite.do',
            data: JSON.stringify(json),
            type: 'post',
            dataType: "text",
            contentType: "application/json",
            success: function (response) {
                getReplyList();
            },
            error: function (request, status, error) {
                console.log(request + "," + status + "," + error);
            }

        });
        $('#content').val('');
    }

    /*
     * 댓글 삭제하기(Ajax)
     */
    function replyDel(reply_no) {
        var paramData = {"reply_no": reply_no};

        $.ajax({
            url: 'board_replyDelete.do'
            , data: paramData
            , type: 'GET'
            , dataType: 'text'
            , success: function (response) {
                getReplyList();
            }
            , error: function (request, status, error) {
                console.log("에러 : " + request + status + error);
            }
        });

    }

    /**
     * 댓글 불러오기(Ajax)
     */
    function getReplyList() {
        $.ajax({
            url: 'board_replyList.do',
            data: {
                post_no: '${plist.post_no}'
            },
            type: 'get',
            dataType: "json",
            success: function (response) {
                let nosuch = "";
                let such = "";

                if (response.length > 0) {
                    response.forEach(reply => {
                        console.log(reply.userid);
                        if(reply.userid == '${nickname}') {
                            such += "<div>";
                            such += "<div><h5><strong>" + reply.userid + "&nbsp;&nbsp;&nbsp;(" + reply.formatdate + ")" + "</strong></h5>"; //"+reply.reply_no+","+reply.content+","+reply.userid+"
                            such += "<div id='reply" + reply.reply_no +"'>" + "✔️ " + reply.content + "&nbsp;&nbsp;&nbsp;<a href='javascript:void(0)' id='replyUpdate' class='replyUpdate' onclick='replyEdit(" + reply.reply_no + "," + "\"" + reply.content + "\"" + ")'>수정</a>&nbsp;&nbsp;<a href='javascript:void(0)' id='replyDelete' class='replyDelete' onclick='replyDel(" + reply.reply_no + ")'>삭제" + "</a>" + "</div>" + "<tr><hr></tr>";
                            such += "</div>";
                            such += "</div>";
                        } else {
                            such += "<div>";
                            such += "<div><h5><strong>" + reply.userid + "&nbsp;&nbsp;&nbsp;(" + reply.formatdate + ")" + "</strong></h5>"; //"+reply.reply_no+","+reply.content+","+reply.userid+"
                            such += "✔️ " + reply.content + "<tr><hr></tr>";
                            such += "</div>";
                            such += "</div>";
                        }
                    });

                } else {
                    nosuch += "<div>";
                    nosuch += "<div><table class='table'><h5><strong>등록된 댓글이 없습니다.</strong></h5>";
                    nosuch += "</table></div>";
                    nosuch += "</div>";

                }
                $("#cCnt").html(nosuch);
                $("#commentList").html(such);
            },
            error: function (request, status, error) {
                console.log(request + "," + status + "," + error);
            }
        });

    }

    /*
       * 댓글 수정하기(view)
       */
    function replyEdit(reply_no, content){
        let id = "#reply" + reply_no;
        var such = "";

        such += "<a href='javascript:void(0)' onclick='updateReply("+ reply_no + ","+ userid + ")'>저장</a>&nbsp;&nbsp;<a href='javascript:void(0)' onclick='getReplyList()'>취소"+"</a>";
        such += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
        such +=  content;
        such += "</textarea>";

        $(id).html(such);
    }

    function updateReply(reply_no, userid){
        var replyEditContent = $('#editContent').val();

        $.ajax({
            url: 'board_replyUpdate.do',
            data : {
                "content": replyEditContent,
                "reply_no": reply_no
            },
            type : 'POST',
            dataType : 'text',
            success: function(response){
                getReplyList();
            }
            , error: function (request, status, error) {
                console.log("에러 : " + request + status + error);
            }

        });


    }

</script>
</html>
