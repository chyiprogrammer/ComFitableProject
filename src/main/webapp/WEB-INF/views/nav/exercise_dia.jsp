<%@page import="kr.co.namu.user.member.UserMemberVO"%>
<%@ page import="kr.co.namu.book.ExerciseVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
&lt;%&ndash;
  Created by IntelliJ IDEA.
  User: 6612
  Date: 2024-03-12
  Time: 오후 12:00
  To change this template use File | Settings | File Templates.
&ndash;%&gt;
--%>

<html>

<head>
    <!-- Font Awesome 아이콘 CDN -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <link href="<c:url value="/resources/choi_machine/css/bootstrap/bootstrap.min.css"/>" rel="stylesheet">

    <title>Title</title>

</head>


<body>

<jsp:include page="../include/header.jsp" />

<jsp:include page="../user/include/nav.jsp" />


<%
    UserMemberVO loginedUserMemberVo = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
    if (loginedUserMemberVo != null) {	//로그인이 되어있을 때
%>


<div class="container mt-5">

    <h1 class="text-center mb-4">고른 운동 리스트</h1>
    <div class="row">
        <div class="col-md-6 offset-md-3">

            <form action="<c:url value='/user/member/exerciseDiaConfirm'/> " name="exercise_dia" method="post">

                <c:forEach items="${exerciseVOs}" var="vo">

                    <hr>

                    <div class="mt-3">

                        <div class="input-group input-group-sm mb-3 row-cols-md-4 inform">
                            <span class="input-group-text" id="inputGroup-sizing-sm1">운동 명</span>
                            <input type="text" name="exer_name" value="${vo.exer_name}" class="form-control" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                        </div>

                        <div class="input-group input-group-sm mb-3 row-cols-md-4 inform">
                            <span class="input-group-text" id="inputGroup-sizing-sm2">무게 (kg)</span>
                            <input type="number" name="exer_wgt" value="${vo.exer_wgt}" class="form-control" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                        </div>

                        <div class="input-group input-group-sm mb-3 row-cols-md-4 inform">
                            <span class="input-group-text" id="inputGroup-sizing-sm3">세트 수</span>
                            <input type="number" name="exer_set" value="${vo.exer_set}" class="form-control" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                        </div>

                    </div>

                    <hr>

                </c:forEach>

            <!-- Submit Button -->
            <div class="text-center mt-4">
                <button type="button" class="btn btn-primary" id="submit-btn" onclick="goWork()">운동 시작</button>
            </div>

            </form>

    </div>
    </div>
    </div>


        <script>

            function goWork(){
            window.location.href = "<c:url value='/user/member/exerciseDiaConfirm' />";
        }

    // Submit 버튼 클릭 시 동작
    document.getElementById('submit-btn').addEventListener('click', function () {

        var startTime = document.getElementById('start-time').value;
        var endTime = document.getElementById('end-time').value;

        // 선택한 날짜와 시간 정보를 콘솔에 출력

        console.log("Start Time: " + startTime);
        console.log("End Time: " + endTime);

        // 여기서 선택한 날짜와 시간 정보를 서버로 전송하여 처리할 수 있습니다.
    });

</script>


<%--<jsp:include page="../user/js_jsp/exercise_dia_calender.jsp" />--%>



<%
} else {	// 로그인이 되어있지 않을 때
%>

<script>

    // 페이지 로드 시 실행되는 함수
    window.onload = function() {
        // 사용자에게 경고 메시지를 보여줌
        alert('로그인이 필요한 서비스입니다.');

        // 로그인 페이지로 이동
        window.location.href = "<c:url value='/user/member/loginForm' />";
    };

</script>

<%
}
%>

</body>
</html>
