<%--
  Created by IntelliJ IDEA.
  User: hyunsangjin
  Date: 2021/06/07
  Time: 2:42 오후
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset=UTF-8">
    <title>내가 가입한 모임 - 채팅</title>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Lato:100,300,400,700);
        @import url(https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css);

        html, body {
            background: #e5e5e5;
            margin: 0px auto;
        }

        ::selection {
            background: rgba(82, 179, 217, 0.3);
            color: inherit;
        }

        a {
            color: rgba(82, 179, 217, 0.9);
        }

        /* M E N U */

        .menu {
            top: 0px;
            left: 0px;
            right: 0px;
            width: 100%;
            height: 50px;
            background: rgba(82, 179, 217, 0.9);
            z-index: 100;
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
        }

        .back {
            position: absolute;
            width: 90px;
            height: 50px;
            top: 0px;
            left: 0px;
            color: #fff;
            line-height: 50px;
            font-size: 30px;
            padding-left: 10px;
            cursor: pointer;
        }

        .back img {
            position: absolute;
            top: 5px;
            left: 30px;
            width: 40px;
            height: 40px;
            background-color: rgba(255, 255, 255, 0.98);
            border-radius: 100%;
            -webkit-border-radius: 100%;
            -moz-border-radius: 100%;
            -ms-border-radius: 100%;
            margin-left: 15px;
        }

        .back:active {
            background: rgba(255, 255, 255, 0.2);
        }

        .name {
            position: absolute;
            top: 3px;
            left: 110px;
            font-family: 'Lato';
            font-size: 25px;
            font-weight: 300;
            color: rgba(255, 255, 255, 0.98);
            cursor: default;
        }

        .last {
            position: absolute;
            top: 30px;
            left: 115px;
            font-family: 'Lato';
            font-size: 11px;
            font-weight: 400;
            color: rgba(255, 255, 255, 0.6);
            cursor: default;
        }

        /* M E S S A G E S */

        .chat {
            list-style: none;
            background: none;
            margin: 0;
            padding: 0 0 50px 0;
            margin-top: 60px;
            margin-bottom: 10px;
        }

        .chat li {
            padding: 0.5rem;
            overflow: hidden;
            display: flex;
        }

        .chat .avatar {
            width: 40px;
            height: 40px;
            position: relative;
            display: block;
            z-index: 2;
            border-radius: 100%;
            -webkit-border-radius: 100%;
            -moz-border-radius: 100%;
            -ms-border-radius: 100%;
            background-color: rgba(255, 255, 255, 0.9);
        }

        .chat .avatar img {
            width: 40px;
            height: 40px;
            border-radius: 100%;
            -webkit-border-radius: 100%;
            -moz-border-radius: 100%;
            -ms-border-radius: 100%;
            background-color: rgba(255, 255, 255, 0.9);
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
        }

        .chat .day {
            position: relative;
            display: block;
            text-align: center;
            color: #c0c0c0;
            height: 20px;
            text-shadow: 7px 0px 0px #e5e5e5, 6px 0px 0px #e5e5e5, 5px 0px 0px #e5e5e5, 4px 0px 0px #e5e5e5, 3px 0px 0px #e5e5e5, 2px 0px 0px #e5e5e5, 1px 0px 0px #e5e5e5, 1px 0px 0px #e5e5e5, 0px 0px 0px #e5e5e5, -1px 0px 0px #e5e5e5, -2px 0px 0px #e5e5e5, -3px 0px 0px #e5e5e5, -4px 0px 0px #e5e5e5, -5px 0px 0px #e5e5e5, -6px 0px 0px #e5e5e5, -7px 0px 0px #e5e5e5;
            box-shadow: inset 20px 0px 0px #e5e5e5, inset -20px 0px 0px #e5e5e5, inset 0px -2px 0px #d7d7d7;
            line-height: 38px;
            margin-top: 5px;
            margin-bottom: 20px;
            cursor: default;
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
        }

        .other .msg {
            border: 1px solid black;
            order: 1;
            border-top-left-radius: 0px;
            box-shadow: -1px 2px 0px #D4D4D4;
        }

        .other:before {
            content: "";
            position: relative;
            top: 0px;
            right: 0px;
            left: 40px;
            width: 0px;
            height: 0px;
            border: 5px solid #fff;
            border-left-color: transparent;
            border-bottom-color: transparent;
        }

        .self {
            justify-content: flex-end;
            align-items: flex-end;
        }

        .self .msg {
            border: 1px solid black;
            order: 1;
            border-bottom-right-radius: 0px;
            box-shadow: 1px 2px 0px #D4D4D4;
        }

        .self .avatar {
            order: 2;
        }

        .self .avatar:after {
            content: "";
            position: relative;
            display: inline-block;
            bottom: 19px;
            right: 0px;
            width: 0px;
            height: 0px;
            border: 5px solid #fff;
            border-right-color: transparent;
            border-top-color: transparent;
            box-shadow: 0px 2px 0px #D4D4D4;
        }

        .msg {
            background: white;
            min-width: 50px;
            padding: 10px;
            border-radius: 2px;
            box-shadow: 0px 2px 0px rgba(0, 0, 0, 0.07);
        }

        .msg p {
            font-size: 0.8rem;
            margin: 0 0 0.2rem 0;
            color: #777;
        }

        .msg img {
            position: relative;
            display: block;
            width: 450px;
            border-radius: 5px;
            box-shadow: 0px 0px 3px #eee;
            transition: all .4s cubic-bezier(0.565, -0.260, 0.255, 1.410);
            cursor: default;
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
        }

        @media screen and (max-width: 800px) {
            .msg img {
                width: 300px;
            }
        }

        @media screen and (max-width: 550px) {
            .msg img {
                width: 200px;
            }
        }

        .msg time {
            font-size: 0.7rem;
            color: #ccc;
            margin-top: 3px;
            float: right;
            cursor: default;
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
        }

        .msg time:before {
            content: "\f017";
            color: #ddd;
            font-family: FontAwesome;
            display: inline-block;
        }

        #chattingArea {
            height: 500px;
            overflow-y: auto;
        }
    </style>
</head>
<body class="is-preload">


<!-- Wrapper -->
<div id="wrapper">

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <jsp:include page="/WEB-INF/views/include/header.jsp"/>
            <!-- Banner -->
            <section>
                <div class="content">
                    <header>
                        <h2>${group_name} - 채팅</h2>
                    </header>
                    <div class="container">
                        <%--                        <div class="col-6">
                                                    <label><b>채팅방</b></label>
                                                </div>
                                                <div id="msgArea" class="col">

                                                </div>
                                                <div class="col-6">
                                                    <div class="input-group mb-3">
                                                        <input type="text" id="msg" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
                                                        <div class="input-group-append">
                                                            <button class="btn btn-outline-secodary" type="button" id="button-send">전송</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                </div>--%>
                        <ol id="chattingArea" class="chat">
                        </ol>
                        <input class="textarea" type="text" placeholder="Type here!" id="msg" />
                        <button class="btn btn-outline-secodary" type="button" id="button-send">전송</button>
                    </div>
                </div>
            </section>

        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    </div>
    <jsp:include page="/WEB-INF/views/include/sidebar.jsp"/>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript">
    var sock = new SockJS('http://localhost:8090/chting_war_exploded/chatting?group_no=${group_no}');
    sock.onmessage = onMessage;
    sock.onclose = onClose;
    sock.onopen = onOpen;

    function onMessage(msg) {
        var data = msg.data;
        var sessionId = null;
        var message = null;
        var date = null;
        var group_no = null;
        var messageType= null;

        var json = JSON.parse(data);
        console.log(json);

        var cur_session = '${userid}';
        sessionId = json.userid;
        message = json.message;
        date = json.writeDate;
        group_no = json.group_no;
        messageType = json.messageType;

        if('${group_no}' == group_no) {
            if(messageType == 'chat') {
                if (sessionId == cur_session) {
                    var str = "<li class='self'><div class='msg'><p><b>" + sessionId + "</b></p><p>" + message + "</p><time>" + date + "</time> </div> </li>";
                    $("#chattingArea").append(str).animate({scrollTop: $('#chattingArea')[0].scrollHeight });

                } else {
                    var str = "<li class='other'><div class='msg'><p><b>" + sessionId + "</b></p><p>" + message + "</p><time>" + date + "</time> </div> </li>";
                    $("#chattingArea").append(str).stop().animate({scrollTop: $('#chattingArea')[0].scrollHeight });

                }
            } else if(messageType == 'enter') {
                var str = "<div style='text-align:center;background-color:lightslategray; color:whitesmoke'>" + "-" + sessionId + " 님이 입장하셨습니다." + "-" + "</div>";
                $("#chattingArea").append(str).animate({scrollTop: $('#chattingArea')[0].scrollHeight });

            } else if(messageType == 'leave') {
                var str = "<div style='text-align:center;background-color:lightslategray; color:whitesmoke'>" + "-" + sessionId + " 님이 퇴장하셨습니다." + "-" + "</div>";
                $("#chattingArea").append(str).animate({scrollTop: $('#chattingArea')[0].scrollHeight });

            }
        }
    }

    function onClose(evt) {
        sock.send(JSON.stringify({message : '', messageType : 'leave', userid : '${userid}', group_no : '${group_no}'}));
    }

    function onOpen(evt) {
        sock.send(JSON.stringify({message : '', messageType : 'enter', userid : '${userid}', group_no : '${group_no}'}));
    }

    function sendMessage() {
        sock.send(JSON.stringify({message : $('#msg').val(), messageType : 'chat', userid : '${userid}', group_no : '${group_no}'}));
    }

    $('#button-send').on("click", function (e) {
        sendMessage();
        $('#msg').val('');
    });
</script>
</html>