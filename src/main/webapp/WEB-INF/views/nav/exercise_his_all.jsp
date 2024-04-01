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

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>


<%
    UserMemberVO loginedUserMemberVo = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
    if (loginedUserMemberVo != null) {	//로그인이 되어있을 때
%>

<canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>

<table class="table table-dark table-bordered table-hover">

    <thead>
        <tr>
            <th scope="col" class="fs-2">운동 명</th>
            <th scope="col" class="fs-2">무게 (kg)</th>
            <th scope="col" class="fs-2">세트 수</th>
            <th colspan="2" scope="col" class="fs-2">상태</th>
        </tr>
    </thead>

    <c:forEach items="${history}" var="vo">

        <tbody>
            <tr>
                <td class="fs-2">${vo.exer_name}</td>
                <td class="fs-2">${vo.exer_wgt_or_cnt}</td>
                <td class="fs-2">${vo.exer_set}</td>
                <td class="fs-1 text-success">${vo.exer_status}</td>
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

<script>
    (function () {
        'use strict'



        // Graphs
        var ctx = document.getElementById('myChart')
        // eslint-disable-next-line no-unused-vars
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: [
                    '일요일',
                    '월요일',
                    '화요일',
                    '수요일',
                    '목요일',
                    '금요일',
                    '토요일'
                ],
                datasets: [{
                    data: [
                        2000,
                        2500,
                        1800,
                        3000,
                        2800,
                        2400,
                        2800
                    ],
                    lineTension: 0,
                    backgroundColor: 'transparent',
                    borderColor: '#007bff',
                    borderWidth: 4,
                    pointBackgroundColor: '#007bff'
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: false
                        }
                    }]
                },
                legend: {
                    display: false
                }
            }
        })
    })()
</script>



</body>
</html>
