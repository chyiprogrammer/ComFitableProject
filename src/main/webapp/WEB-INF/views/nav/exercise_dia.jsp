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


    <h1 class="text-center mt-4 mb-4">고른 운동 리스트</h1>

    <div class="row text-center">
        <div>

            <form action="<c:url value='/user/member/hitoryConfirm'/> " name="exercise_dia" method="post">

                <table class="table table-dark table-bordered table-hover">

                    <thead>
                        <tr>
                            <th scope="col" class="fs-2">운동 명</th>
                            <th scope="col" class="fs-2">무게 (kg)</th>
                            <th scope="col" class="fs-2">갯수</th>
                            <th scope="col" class="fs-2">세트 수</th>
                            <th scope="col" class="fs-2">상태</th>
                            <th scope="col" colspan="3" class="fs-2">총 볼륨</th>
                        </tr>
                    </thead>

                    <c:forEach items="${exerciseVOs}" var="vo">

                        <tbody>
                        <tr>
                            <td class="fs-2">${vo.exer_name}</td>
                            <td class="fs-2">${vo.exer_wgt}</td>
                            <td class="fs-2">${vo.exer_cnt}</td>
                            <td class="fs-2">${vo.exer_set}</td>
                            <td class="fs-1 text-primary">${vo.exer_status}</td>
                            <td class="fs-2 p-3" colspan="2">${vo.exer_totalVolume}</td>

                                <td class="text-center">

                                    <c:url value='/user/member/exerDeleteOne' var='detail_url'>
                                        <c:param name='exer_no' value='${vo.exer_no}'/>
                                    </c:url>

                                        <button type="button" class="btn btn-primary px-5 py-4" onclick="location.href='${detail_url}'">
                                            취소
                                        </button>
                                </td>

                        </tr>
                        </tbody>

                    </c:forEach>

                    <tfoot>

                    <tr>
                        <td colspan="5" class="fs-2">총 볼륨 합계</td>
                        <td colspan="2" class="fs-1">${totalVolume}</td>
                        <td class="text-center">

                            <c:url value='/user/member/exerDeleteAll' var='detail_url'>
                                <c:param name='exer_id' value='${vo.exer_id}'/>
                            </c:url>

                            <button type="button" class="btn btn-primary px-5 py-4" onclick="location.href='${detail_url}'">
                                전체 취소
                            </button>
                        </td>

                    </tr>

                    </tfoot>

                </table>

            <!-- Submit Button -->
            <div class="text-center mt-4">
                <input type="submit" class="btn btn-primary p-5" id="submit-btn" value="운동 시작">
            </div>

            </form>

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
