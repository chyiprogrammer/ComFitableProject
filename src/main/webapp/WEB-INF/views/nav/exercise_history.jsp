<%@ page import="kr.co.namu.user.member.UserMemberVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: 6612
  Date: 2024-03-18
  Time: 오후 4:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>

    <style>
        #timer {
            font-size: 2em;
            margin-bottom: 20px;
        }

        #startButton {
            padding: 10px 20px;
            font-size: 1.2em;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        #startButton:disabled {
            background-color: #cccccc;
            cursor: not-allowed;
        }

    </style>

    <title>운동 현황</title>
</head>
<body>

<jsp:include page="../include/header.jsp" />

<jsp:include page="../user/include/nav.jsp" />

<%
    UserMemberVO loginedUserMemberVo = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
    if (loginedUserMemberVo != null) {	//로그인이 되어있을 때
%>

<h1 class="text-center mt-4 mb-4">진행중인 운동 리스트</h1>


    <table class="table table-dark table-bordered table-hover">
            <thead>
                <tr>
                    <th scope="col" class="fs-2">운동 명</th>
                    <th scope="col" class="fs-2">무게 (kg)</th>
                    <th scope="col" class="fs-2">갯수</th>
                    <th scope="col" class="fs-2">세트 수</th>
                    <th colspan="2" scope="col" class="fs-2">상태</th>
                </tr>
            </thead>

    <c:forEach items="${status}" var="vo">

            <tbody>
                <tr>
                    <td class="fs-2">${vo.exer_name}</td>
                    <td class="fs-2">${vo.exer_wgt}</td>
                    <td class="fs-2">${vo.exer_cnt}</td>
                    <td class="fs-2">${vo.exer_set}</td>
                    <td class="fs-1 text-warning">${vo.exer_status}</td>
                    <td class="text-center">
                        <c:url value='/user/member/exerCheck' var='detail_url'>
                            <c:param name='exer_no' value='${vo.exer_no}'/>
                            <c:param name='exer_wgt' value='${vo.exer_wgt}'/>
                        </c:url>

                        <c:if test="${vo.exer_status == '...ing'}">
                            <button type="button" class="btn btn-primary btn-sm px-5 py-4" onclick="location.href='${detail_url}'" >확인 </button>
                        </c:if>
                    </td>

                </tr>
            </tbody>

    </c:forEach>


    </table>

        <div id="timer" class="text-center">01:00
            <button id="startButton">쉬는 시간</button>
        </div>
<script>
    function startTimer(duration, display) {
        var timer = duration, minutes, seconds;
        var isTimerRunning = true;


        var intervalId = setInterval(function () {
            minutes = parseInt(timer / 60, 10);
            seconds = parseInt(timer % 60, 10);

            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;

            display.textContent = minutes + ":" + seconds;

            if (--timer < 0) {
                clearInterval(intervalId);
                isTimerRunning = false;
                timer = duration;
                display.textContent = "다시 시작!";
                document.getElementById('startButton').disabled = false;
            }
        }, 1000);

        document.getElementById('startButton').disabled = true;
    }

    document.getElementById('startButton').addEventListener('click', function () {
        var oneMinute = 60,
            display = document.querySelector('#timer');
        startTimer(oneMinute, display);
    });
</script>


<%
} else {	// 로그인이 되어있지 않을 때
%>


<%
    }
%>

</body>
</html>
