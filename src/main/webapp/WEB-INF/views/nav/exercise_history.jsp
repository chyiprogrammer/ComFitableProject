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

    <c:forEach items="${status}" var="vo">

            <tbody>
                <tr>
                    <td>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
                            <label class="form-check-label" for="flexCheckChecked">${vo.exer_name}
                            </label>
                        </div>
                    </td>
                    <td>${vo.exer_wgt}</td>
                    <td>${vo.exer_set}</td>
                    <td>${vo.exer_status}</td>


                    <td>
                        <c:url value='/user/member/exerCheck' var='detail_url'>
                        <c:param name='exer_no' value='${vo.exer_no}'/>
                        </c:url>

                        <c:if test="${vo.exer_status == '...ing'}">
                            <button type="button" class="btn btn-primary btn-sm" onclick="location.href='${detail_url}'" >확인 </button>
                        </c:if>
                        <c:if test="${vo.exer_status == 'done'}">
                            <button type="button">완료</button>
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
