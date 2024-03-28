<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="../../include/title.jsp" />

<%--
<link href="<c:url value='/resources/css/user/login_form.css' />" rel="stylesheet" type="text/css">
--%>

	<link href="/resources/choi_machine/css/bootstrap/bootstrap.min.css" rel="stylesheet">

<jsp:include page="../include/login_js.jsp" />

</head>
<body class="text-center">

	<jsp:include page="../../include/header.jsp" />

	<jsp:include page="../include/nav.jsp" />


	<main class="form-signin d-flex justify-content-center">

		<section>

		<div id="section_wrap" class="p-5">

		<img class="mb-4 mt-5" src="/resources/choi_machine/img/login.png" alt="" width="55" height="72">
		<h1 class="h3 mb-3 fw-normal ms-5 me-5 ">로그인</h1>

		<form action="<c:url value='/user/member/loginConfirm' />" name="login_form" method="post">

			<div class="form-floating mb-1">
				<input type="text" name="u_m_id" class="form-control" id="floatingInput" placeholder="aaaaa">
				<label for="floatingInput">아이디</label>
			</div>

			<div class="form-floating">
				<input type="password" name="u_m_pw" class="form-control" id="floatingPassword" placeholder="Password">
				<label for="floatingPassword">패스워드</label>
			</div>

			<button type="button" class="btn btn-warning m-5 mt-4 p-3" onclick="loginForm();">로그인</button>

		</form>

		<div class="find_password_create_account mt-4">

			<a href="<c:url value='/user/member/findPasswordForm' />" class="text-decoration-none me-3">비밀번호 찾기</a>
			<a href="<c:url value='/user/member/createAccountForm' />" class="text-decoration-none">회원가입</a>

		</div>

		</div>

		</section>

	</main>

	<jsp:include page="../../include/footer.jsp" />


<script>

	window.onload = function() {
		document.getElementById("floatingInput").focus();
	};

</script>


</body>

</html>