<%@page import="kr.co.namu.user.member.UserMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="./nav_js.jsp" />

<script src="<c:url value="/resources/choi_machine/js/bootstrap.bundle.min.js"/>"></script>

<div id="nav_wrap">

	<%
		UserMemberVO loginedUserMemberVo = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
		if (loginedUserMemberVo != null) {
	%>

	<div class="text-center text-md-end">

		<button type="button" class="btn btn-warning me-5 p-4">
			<a href="<c:url value='/user/member/logoutConfirm' />" class="text-decoration-none">로그아웃</a>
		</button>

		<button type="button" class="btn btn-light me-2 p-4">
			<a href="<c:url value='/user/member/modifyAccountForm' />" class="text-decoration-none">계정수정</a>
		</button>

<%--
		<button type="button" class="btn btn-light me-2">
			<a href="<c:url value='/book/user/enterBookshelf' />" class="text-decoration-none">나의책장</a>
		</button>
--%>

	</div>

	<nav class="navbar navbar-expand-lg navbar-light bg-light rounded" aria-label="Twelfth navbar example">

		<div class="container-fluid">

			<div class="navbar-collapse justify-content-md-center" id="navbarsExample10">
				<ul class="navbar-nav">

					<li class="nav-item text-center p-3"><a href="<c:url value='/user/member/exerciseType/Main' />" class="nav-link fw-bold fs-2">운동 목록</a></li>

					<c:if test="${list eq 1}">
						<li class="nav-item dropdown text-center" id="list_name">

							<a class="nav-link dropdown-toggle" href="#" id="dropdown10" data-bs-toggle="dropdown" aria-expanded="false">
								<p id="body_section" class="fw-bold fs-2 mt-3">운동 부위</p>
							</a>

							<ul class="dropdown-menu text-center" aria-labelledby="dropdown10">
								<li><a class="dropdown-item chest fs-2 p-3" href="<c:url value='/user/member/exerciseType/chest_yet' />">가슴</a></li>
								<li><a class="dropdown-item shoulder fs-2 p-3" href="<c:url value='/user/member/exerciseType/shoulder_yet' />">어깨</a></li>
								<li><a class="dropdown-item back fs-2 p-3" href="<c:url value='/user/member/exerciseType/core_yet' />">코어</a></li>
								<li><a class="dropdown-item arm fs-2 p-3" href="<c:url value='/user/member/exerciseType/arm_yet' />">팔</a></li>
								<li><a class="dropdown-item low fs-2 p-3" href="<c:url value='/user/member/exerciseType/low_yet' />">하체</a></li>
							</ul>

						</li>
					</c:if>

					<li class="nav-item text-center p-3"><a href="#" class="nav-link fw-bold fs-2">맨몸 운동</a></li>
					<li class="nav-item text-center p-3"><a href="<c:url value='/user/member/exerciseDia' />" class="nav-link fw-bold fs-2">오늘 할 운동</a></li>
					<li class="nav-item text-center p-3"><a href="<c:url value='/user/member/exerStatus' />" class="nav-link fw-bold fs-2">운동 현황</a></li>
					<li class="nav-item text-center p-3"><a href="<c:url value='/user/member/exerHisAll' />" class="nav-link fw-bold fs-2">전체 현황</a></li>

				</ul>
			</div>

		</div>

	</nav>


	<%
	} else {
	%>

	<div class="text-center">

		<button type="button" class="btn btn-light me-5 p-4">
			<a href="<c:url value='/user/member/loginForm' />" class="text-decoration-none">
				로그인
			</a>
		</button>

		<button type="button" class="btn btn-warning p-4">
			<a href="<c:url value='/user/member/createAccountForm' />" class="text-decoration-none">
				회원가입
			</a>
		</button>

	</div>


	<%
		}
	%>

</div>



<%--
<nav class="navbar navbar-expand-lg navbar-light bg-light rounded" aria-label="Twelfth navbar example">

	<div class="container-fluid">

		<div class="navbar-collapse justify-content-md-center" id="navbarsExample10">
			<ul class="navbar-nav">

				<li class="nav-item text-center"><a href="<c:url value='/user/member/exerciseType' />" class="nav-link">운동 목록</a></li>

				<c:if test="${list eq 1}">
					<li class="nav-item dropdown text-center" id="list_name">

						<a class="nav-link dropdown-toggle" href="#" id="dropdown10" data-bs-toggle="dropdown" aria-expanded="false">
							<p id="body_section">운동 부위</p>
						</a>

						<ul class="dropdown-menu text-center" aria-labelledby="dropdown10">
							<li><a class="dropdown-item chest" href="<c:url value='/user/member/exerciseTypeConfirm/chest' />">가슴</a></li>
							<li><a class="dropdown-item shoulder" href="<c:url value='/user/member/exerciseTypeConfirm/sholder' />">어깨</a></li>
							<li><a class="dropdown-item back" href="<c:url value='/user/member/exerciseTypeConfirm/back' />">등</a></li>
							<li><a class="dropdown-item arm" href="<c:url value='/user/member/exerciseTypeConfirm/arm' />">팔</a></li>
							<li><a class="dropdown-item low" href="<c:url value='/user/member/exerciseTypeConfirm/low' />">하체</a></li>
						</ul>

					</li>
				</c:if>

				<li class="nav-item text-center"><a href="#" class="nav-link">기구 목록</a></li>
				<li class="nav-item text-center"><a href="<c:url value='/user/member/exerciseDia' />" class="nav-link">오늘 할 운동</a></li>
				<li class="nav-item text-center"><a href="<c:url value='/user/member/exerciseDiaConfirm' />" class="nav-link">운동 현황</a></li>


			</ul>
		</div>

	</div>

</nav>
--%>
