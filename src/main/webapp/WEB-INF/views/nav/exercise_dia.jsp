<%@page import="kr.co.namu.user.member.UserMemberVO"%>
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
    <div class="row text-center">
        <div class="col-md-8 offset-md-2">

            <form action="<c:url value='/user/member/hitoryConfirm'/> " name="exercise_dia" method="post">

                <table class="table table-dark table-bordered table-hover">
                    <thead>
                    <tr>
                        <th scope="col">운동 명</th>
                        <th scope="col">무게 (kg)</th>
                        <th scope="col">세트 수</th>
                        <th scope="col">상태</th>
                        <th scope="col">총 볼륨 (kg)</th>
                    </tr>
                    </thead>

                    <c:forEach items="${exerciseVOs}" var="vo">

                        <tbody>
                        <tr>
                            <td>${vo.exer_name}</td>
                            <td>${vo.exer_wgt}</td>
                            <td>${vo.exer_set}</td>
                            <td>${vo.exer_status}</td>
                            <td>${vo.exer_totalVolume}</td>
                        </tr>
                        </tbody>

                    </c:forEach>

                    <tfoot>

                    <tr>
                        <td colspan="4">총 볼륨 합계</td>
                        <td>${totalVolume}</td>
                    </tr>

                    </tfoot>

                </table>

            <!-- Submit Button -->
            <div class="text-center mt-4">
                <input type="submit" class="btn btn-primary" id="submit-btn" value="운동 시작">
            </div>

            </form>

    </div>
    </div>
    </div>


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
