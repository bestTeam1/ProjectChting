<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<body>

<%-- 댓글달기 --%>
<div>
    <br><br>
    <div style="text-align: center">
        <div style="text-align: -webkit-center">
            <div class="card text-center" style="margin-bottom: 10px;">
                <div class="card-body text-muted">
                    <textarea rows="3" id="content" name="content"
                              class="border w-100"
                              style="resize: none;"
                              placeholder="댓글사용시 로그인이 필요합니다."
                              onfocus="this.placeholder = ''"
                              onblur="this.placeholder = '댓글사용시 로그인이 필요합니다.'"></textarea>
                    <input type="button" class="btn rounded-pill btn-primary mb-5 float-end"
                           id="submit" onclick="replyWrite()" value="댓글등록"/>


                <div id="commentList">

                </div>
                <b3 id="cCnt"></b3>

                <div class="text" id="text">

                </div>

                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="b_code" name="b_code" value=""/>
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
                        if (reply.userid == '${nickname}') {
                            such += "<div class='mt-5'>";
                            such += "<div class='text-start'><h7><strong><i class='far fa-comments'>&nbsp;</i>" + reply.userid + "&nbsp;&nbsp;(" + reply.formatdate + ")" + "</strong></h7>";
                            such += "<div class='m-3' id='reply" + reply.reply_no + "'>" + "&nbsp;" + reply.content + "&nbsp;&nbsp;&nbsp;";
                            such += "<a href='javascript:void(0)' id='replyUpdate' class='btn btn-sm btn-outline-dark m-2' onclick='replyEdit(" + reply.reply_no + "," + "\"" + reply.content + "\"" + ")'>수정</a>";
                            such += "<a href='javascript:void(0)' id='replyDelete' class='btn btn-sm btn-outline-dark' onclick='replyDel(" + reply.reply_no + ")'>삭제" + "</a></div><hr>";
                            such += "</div>";
                            such += "</div>";
                        } else {
                            such += "<div class='mt-5'>";
                            such += "<div class='text-start'><h7><strong><i class='far fa-comments'>&nbsp;</i>" + reply.userid + "&nbsp;&nbsp;(" + reply.formatdate + ")" + "</strong></h7>";
                            such += "<div class='m-3' id='reply" + reply.reply_no + "'>" + "&nbsp;" + reply.content + "<hr>";
                            such += "</div>";
                            such += "</div>";

                        }
                    });

                } else {
                    nosuch += "";
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
    function replyEdit(reply_no, content) {
        let id = "#reply" + reply_no;
        var such = "";

        such += "<a href='javascript:void(0)' class='btn btn-sm btn-outline-dark m-2' onclick='updateReply(" + reply_no + "," + userid + ")'>저장</a>";
        such += "<a href='javascript:void(0)' class='btn btn-sm btn-outline-dark' onclick='getReplyList()'>취소" + "</a>";
        such += '<textarea name="editContent" id="editContent" class="form-control" style="resize: none;" rows="3">';
        such += content;
        such += "</textarea>";

        $(id).html(such);
    }

    function updateReply(reply_no, userid) {
        var replyEditContent = $('#editContent').val();

        $.ajax({
            url: 'board_replyUpdate.do',
            data: {
                "content": replyEditContent,
                "reply_no": reply_no
            },
            type: 'POST',
            dataType: 'text',
            success: function (response) {
                getReplyList();
            }
            , error: function (request, status, error) {
                console.log("에러 : " + request + status + error);
            }

        });


    }

</script>
</html>
