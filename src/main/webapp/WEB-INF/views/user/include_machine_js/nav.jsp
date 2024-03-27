<%@page import="kr.co.namu.user.member.UserMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<link href="<c:url value='/resources/css/user/include/nav.css' />" rel="stylesheet" type="text/css">--%>
<link href="/resources/choi_machine/css/bootstrap/bootstrap.min.css" rel="stylesheet">


<jsp:include page="./nav_js.jsp" />

<nav>

	<div id="nav_wrap">

		<%
			UserMemberVO loginedUserMemberVo = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
			if (loginedUserMemberVo != null) {
		%>
		<div class="menu">
			<ul class="d-flex float-end mt-3">
				<li><a href="<c:url value='/user/member/logoutConfirm' />" class="text-decoration-none me-3">로그아웃</a></li>
				<li><a href="<c:url value='/user/member/modifyAccountForm' />" class="text-decoration-none me-3">계정수정</a></li>
				<li><a href="<c:url value='/book/user/enterBookshelf' />" class="text-decoration-none me-3">나의책장</a></li>
			</ul>
		</div>
		<%
		} else {
		%>

		<%--		<div class="text-end">
                    <button type="button" class="btn btn-outline-light me-2">
                        <li><a href="<c:url value='/user/member/loginForm' />">로그인</a></li>
                    </button>
                    <button type="button" class="btn btn-warning">
                        <li><a href="<c:url value='/user/member/createAccountForm' />">회원가입</a></li>
                    </button>
                </div>--%>


		<%--		<div class="menu">
                    <ul>
                        <li><a href="<c:url value='/user/member/loginForm' />">로그인</a></li>
                        <li><a href="<c:url value='/user/member/createAccountForm' />">회원가입</a></li>
                    </ul>
                </div>--%>
		<%
			}
		%>

		<header class="d-flex justify-content-center py-3">
			<ul class="nav nav-pills row row-cols-1 row-cols-sm-4 align-items-sm-center">
				<li class="nav-item text-center"><a href="#" class="nav-link">운동 목록</a></li>
				<li class="nav-item text-center"><a href="#" class="nav-link">기구 목록</a></li>
				<li class="nav-item text-center"><a href="#" class="nav-link">운동 일지</a></li>
				<li class="nav-item text-center"><a href="#" class="nav-link">운동 현황</a></li>
			</ul>
		</header>

	</div>

</nav>