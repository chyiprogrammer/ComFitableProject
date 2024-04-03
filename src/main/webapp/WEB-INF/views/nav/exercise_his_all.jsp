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

<input type="hidden" id="startDate1" value="">
<input type="hidden" id="endDate1" value="">


<h1 class="text-center mt-4 mb-4">완료한 운동 리스트</h1>


<canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>

<c:set var="previousDate" value="" />

<table class="table table-dark table-striped">
    <c:forEach items="${history}" var="vo">
        <c:if test="${!vo.exer_end.substring(0,10).equals(previousDate)}">
            <tbody>
            <tr>
                <td>
                    <details>
                        <summary class="fw-bold fs-1 p-3">
                                ${vo.exer_end.substring(0,10)}
                        </summary>
                        <div>
                            <table class="table table-dark table-striped">
                                <thead class="text-white fs-2">
                                <tr>
                                    <th>운동 이름</th>
                                    <th>무게</th>
                                    <th>횟수</th>
                                    <th>세트</th>
                                    <th>상태</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${history}" var="exercise">
                                    <c:if test="${exercise.exer_end.substring(0,10).equals(vo.exer_end.substring(0,10))}">
                                        <tr class="text-white fs-2">
                                            <td>${exercise.exer_name}</td>
                                            <td>${exercise.exer_wgt}</td>
                                            <td>${exercise.exer_cnt}</td>
                                            <td>${exercise.exer_set}</td>
                                            <td class="text-success">${exercise.exer_status}</td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </details>
                </td>
            </tr>
            </tbody>
        </c:if>
        <c:set var="previousDate" value="${vo.exer_end.substring(0,10)}" />
    </c:forEach>
</table>

<%
} else {	// 로그인이 되어있지 않을 때
%>

<%
    }
%>

<script>

    window.onload = function() {
        getchart1();
    };

    function getchart1() {
        var start = document.getElementById("startDate1").value;
        var end = document.getElementById("endDate1").value;

        if(start == ""){
            var currentDate = new Date();
            var sevenDaysAgo = new Date(currentDate);
            sevenDaysAgo.setDate(currentDate.getDate() - 7);

            var year = sevenDaysAgo.getFullYear();
            var month = ('0' + (sevenDaysAgo.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 1을 더합니다.
            var day = ('0' + sevenDaysAgo.getDate()).slice(-2);

            var formattedDate = year + '-' + month + '-' + day;
            start = formattedDate
        }
        if(end == ""){
            var currentDate = new Date();

            var year = currentDate.getFullYear();
            var month = ('0' + (currentDate.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 1을 더합니다.
            var day = ('0' + currentDate.getDate()).slice(-2);

            var formattedDate = year + '-' + month + '-' + day;
            end = formattedDate
        }
        $.ajax({
            type: 'GET',
            url: '/user/member/chartSee',
            data: {
                "start" : start,
                "end" : end
            },
            dataType: 'json',
            success: function (result) {
                console.log(result);
                var labels = [];
                var datas = [];
                for(var i = 0;i<result.length-1; i++){
                    labels.push(result[i].chart_date);
                    datas.push(result[i].chart_value);
                }
                var max = result[result.length-1].chart_value;

                var ctx = document.getElementById('myChart');
                var myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: "총 볼륨",
                            lineTension: 0.3,
                            backgroundColor: "rgba(2,117,216,0.2)",
                            borderColor: "rgba(2,117,216,1)",
                            pointRadius: 5,
                            pointBackgroundColor: "rgba(2,117,216,1)",
                            pointBorderColor: "rgba(255,255,255,0.8)",
                            pointHoverRadius: 5,
                            pointHoverBackgroundColor: "rgba(2,117,216,1)",
                            pointHitRadius: 50,
                            pointBorderWidth: 2,
                            data: datas,
                        }],
                    },
                    options: {
                        tooltips: {
                            titleFontSize: 20, // 툴팁 제목의 글자 크기를 조절합니다.
                            bodyFontSize: 20, // 툴팁 내용의 글자 크기를 조절합니다.
                        },
                        scales: {
                            xAxes: [{
                                time: {
                                    unit: 'date'
                                },
                                gridLines: {
                                    display: false
                                },
                                ticks: {
                                    maxTicksLimit: 7,
                                    fontSize: 20
                                }
                            }],
                            yAxes: [{
                                ticks: {
                                    min: 0,
                                    max: max,
                                    maxTicksLimit: 5,
                                    fontSize: 20
                                },
                                gridLines: {
                                    color: "rgba(0, 0, 0, .125)",
                                }
                            }],
                        },
                        legend: {
                            display: false
                        }
                    }
                });

            },
            error: function (error) {
                console.log('Error:', error);
            }
        });

    }

</script>




</body>
</html>
