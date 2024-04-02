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

    <c:forEach items="${history}" var="vo">

        <tbody>
            <tr>
                <td class="fs-2">${vo.exer_name}</td>
                <td class="fs-2">${vo.exer_wgt}</td>
                <td class="fs-2">${vo.exer_cnt}</td>
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
                            label: "Sessions",
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
                        scales: {
                            xAxes: [{
                                time: {
                                    unit: 'date'
                                },
                                gridLines: {
                                    display: false
                                },
                                ticks: {
                                    maxTicksLimit: 7
                                }
                            }],
                            yAxes: [{
                                ticks: {
                                    min: 0,
                                    max: max,
                                    maxTicksLimit: 5
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
