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
        #myButton {
            padding: 40px 40px;
            font-size: 1.2em;
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;

        }

        #myButton:disabled {
            background-color: #cccccc;
            cursor: not-allowed;
        }

        #myButton {
            font-size: 60px; /* 버튼의 텍스트 크기를 80px로 설정합니다. */
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
<hr>
    <div class="text-center">
        <button id="myButton" class="btn btn-primary">쉬는 시간</button>
    </div>
<hr>
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

<br><br>

<script>
    let button = document.getElementById('myButton'); // HTML에서 버튼을 가져옵니다.
    let timerRunning = false; // 타이머가 실행 중인지 여부를 나타내는 변수를 선언합니다.

    button.addEventListener('click', function() {
        if (!timerRunning) { // 타이머가 실행 중이 아닌 경우에만 버튼을 클릭할 수 있습니다.
            timerRunning = true; // 타이머가 실행 중임을 표시합니다.
            button.disabled = true; // 버튼을 비활성화합니다.
            let secondsRemaining = 60; // 초기 시간을 60초로 설정합니다.

            let countdownInterval = setInterval(function() {
                secondsRemaining--; // 남은 시간을 1초씩 감소시킵니다.
                button.innerText = secondsRemaining + '초'; // 버튼의 텍스트를 업데이트하여 남은 시간을 표시합니다.

                if (secondsRemaining < 0) { // 남은 시간이 0 이하인 경우
                    clearInterval(countdownInterval); // 감소 인터벌을 중지합니다.
                    timerRunning = false; // 타이머가 종료되었음을 표시합니다.
                    button.disabled = false; // 버튼을 다시 활성화합니다.
                    button.innerText = '다시 시작'; // 버튼의 텍스트를 초기화합니다.
                }
            }, 1000); // 1초마다 남은 시간을 업데이트합니다.
        }
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
