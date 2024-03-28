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
    <title>운동 현황</title>
</head>
<body>

<jsp:include page="../include/header.jsp" />

<jsp:include page="../user/include/nav.jsp" />

<%
    UserMemberVO loginedUserMemberVo = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
    if (loginedUserMemberVo != null) {	//로그인이 되어있을 때
%>

<table class="table table-dark table-bordered table-hover">
    <thead>
    <tr>
        <th scope="col">운동 명</th>
        <th scope="col">무게 (kg)</th>
        <th scope="col">세트 수</th>
        <th colspan="2" scope="col">상태</th>
    </tr>
    </thead>

    <c:forEach items="${history}" var="vo">

        <tbody>
        <tr>
            <td>${vo.exer_name}</td>
            <td>${vo.exer_wgt}</td>
            <td>${vo.exer_set}</td>
            <td>${vo.exer_status}</td>
        </tr>
        </tbody>

    </c:forEach>


</table>


<%
} else {	// 로그인이 되어있지 않을 때
%>

<%
    }
%>


</body>
</html>
