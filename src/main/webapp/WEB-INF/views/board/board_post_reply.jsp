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
                            <textarea style="width: 900px" rows="3" cols="30" id="content" name="content"
                                      placeholder="1000자 이내로 입력해주세요 :)"
                                      onfocus="this.placeholder = ''"
                                      onblur="this.placeholder = '1000자 이내로 입력해주세요 :)'"></textarea>
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
        <table id="replyArea">
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
    <b3 id="cCnt"></b3>
</div>
</body>
<script src="assets/js/jquery.min.js"></script>
<script>
    $(document).ready(getReplyList());

    /*
     * 댓글 등록하기(Ajax)
     */
    function replyWrite() {
        let json = { "post_no" : '${plist.post_no}', "userid" : userid , "content" : $('#content').val()};
        $.ajax({
            url: 'board_replyWrite.do',
            data: JSON.stringify(json),
            type: 'post',
            dataType: "text",
            contentType : "application/json",
            success: function (response) {
                console.log('123123');
                getReplyList();
            },
            error: function (request, status, error) {
                console.log(request + "," + status + "," + error);
            }

        });
        $('#content').val('');
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
                        console.log(reply);
                        such += "<tr><td>" + reply.reply_no + "/ </td>&nbsp;&nbsp;&nbsp;&nbsp;<td>" + reply.userid + " / </td>&nbsp;&nbsp;&nbsp;&nbsp;<td>" + reply.formatdate + " / </td><br><td>" + reply.content + " / </td></tr>";
                    });
                } else {
                    nosuch += "<div>";
                    nosuch += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
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

</script>
</html>
