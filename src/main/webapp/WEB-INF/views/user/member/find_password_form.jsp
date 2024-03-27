<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="../../include/title.jsp" />

<%--
<link href="<c:url value='/resources/css/user/find_password_form.css' />" rel="stylesheet" type="text/css">
--%>

	<link href="/resources/choi_machine/css/bootstrap/bootstrap.min.css" rel="stylesheet">

<jsp:include page="../include/find_password_js.jsp" />

</head>
<body class="text-center">

	<jsp:include page="../../include/header.jsp" />
	
	<jsp:include page="../include/nav.jsp" />

	<main class="form-signin d-flex justify-content-center">

		<section>

	<div id="section_wrap">

		<img class="mb-4 mt-5" src="/resources/choi_machine/img/find_pw.png" alt="" width="72" height="60">
		<h1 class="h3 mb-3 fw-normal ms-5 me-5 ">비밀번호 찾기</h1>

		<form action="<c:url value='/user/member/findPasswordConfirm' />" name="find_password_form" method="post">

			<div class="form-floating mb-1">
				<input type="text" name="u_m_id" class="form-control" id="floatingInput" placeholder="aaaaa">
				<label for="floatingInput">아이디</label>
			</div>

			<div class="form-floating mb-1">
				<input type="text" name="u_m_name" class="form-control" id="floatingInput1" placeholder="hong gil dong">
				<label for="floatingInput1">이름</label>
			</div>

			<div class="form-floating">
				<input type="email" name="u_m_mail" class="form-control" id="floatingInput2" placeholder="email@example.com">
				<label for="floatingInput2">이메일</label>
			</div>

			<input type="button" class="mt-4 mb-4" value="입력" onclick="findPasswordForm();">

		</form>

		<div class="create_account_login">

			<a href="<c:url value='/user/member/createAccountForm' />" class="text-decoration-none me-3">계정 생성</a>
			<a href="<c:url value='/user/member/loginForm' />" class="text-decoration-none">로그인 화면</a>

		</div>

	</div>

		</section>

	</main>
		<%--<div id="section_wrap">
		
			<div class="word">
			
				<h3>FIND PASSWORD FORM</h3>
				
			</div>
			
			<div class="find_password_form">
			
				<form action="<c:url value='/user/member/findPasswordConfirm' />" name="find_password_form" method="post">
					
					<input type="text" name="u_m_id" placeholder="INPUT USER ID."> <br>
					<input type="text" name="u_m_name" placeholder="INPUT USER NAME."> <br>
					<input type="text" name="u_m_mail" placeholder="INPUT USER MAIL."> <br>
					<input type="button" value="입력" onclick="findPasswordForm();">
					<input type="reset" value="다시입력">
					
				</form>
				
			</div>
			
			<div class="create_account_login">
				
				<a href="<c:url value='/user/member/createAccountForm' />" class="text-decoration-none">계정 생성</a>
				<a href="<c:url value='/user/member/loginForm' />" class="text-decoration-none">로그인 화면</a>
				
			</div>
		
		</div>--%>
		

	<jsp:include page="../../include/footer.jsp" />
	
</body>
</html>