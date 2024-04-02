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

<%--
<div class="text-center mt-4">
    <button type="button" class="btn btn-primary" id="submit-btn">운동 완료</button>
</div>
--%>

<%--<script>
    var statusChecks = document.querySelectorAll('.form-check-input');

    statusChecks.forEach(function(n) {
        n.addEventListener('click', function() {
            if (this.checked == true) {
                var checkNum = this.checked;
                checkNum = 1;
                // 체크되어 있을 때 실행할 코드
                console.log(checkNum+"번째가 체크되어 있습니다.");
            } else {
                checkNum = 1;
                // 체크되어 있지 않을 때 실행할 코드
                console.log(checkNum+"번째가 체크되어 있지 않습니다.");
            }
        });
    });
</script>--%>


<%
} else {	// 로그인이 되어있지 않을 때
%>

<%--<script>
    // 페이지 로드 시 실행되는 함수
    window.onload = function() {
        // 사용자에게 경고 메시지를 보여줌
        alert('로그인이 필요한 서비스입니다');
        // 로그인 페이지로 이동
        window.location.href = "<c:url value='/user/member/loginForm' />";
    };
</script>--%>


<%
    }
%>

</body>
</html>
