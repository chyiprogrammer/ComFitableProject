<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="../../include/title.jsp" />

<%--
<link href="<c:url value='/resources/css/user/create_account_form.css' />" rel="stylesheet" type="text/css">
--%>
	<link href="/resources/choi_machine/css/bootstrap/bootstrap.min.css" rel="stylesheet">


	<jsp:include page="../include/create_account_form_js.jsp" />

</head>
<body class="text-center">

	<jsp:include page="../../include/header.jsp" />
	
	<jsp:include page="../include/nav.jsp" />

	<main class="form-signin d-flex justify-content-center">

	<section>

		<div id="section_wrap">
		
			<div class="create_account_form">

				<img class="mb-4 mt-5" src="/resources/choi_machine/img/create_act.png" alt="" width="72" height="60">
				<h1 class="h3 mb-3 ms-5 me-5 fw-normal">회원가입</h1>
			
				<form action="<c:url value='/user/member/createAccountConfirm' />" name="create_account_form" method="post">

					<div class="form-floating mb-1">
						<input type="text" name="u_m_id" class="form-control" id="floatingInput" placeholder="aaaaa">
						<label for="floatingInput">아이디 입력</label>
					</div>

					<div class="form-floating mb-1">
						<input type="password" name="u_m_pw" class="form-control" id="floatingInput1" placeholder="bbbbb">
						<label for="floatingInput1">비밀번호 입력</label>
					</div>

					<div class="form-floating mb-1">
						<input type="password" name="u_m_pw_again" class="form-control" id="floatingInput2" placeholder="bbbbb">
						<label for="floatingInput2">비밀번호 확인</label>
					</div>

					<div class="form-floating mb-1">
						<input type="text" name="u_m_name" class="form-control" id="floatingInput3" placeholder="hong gil dong">
						<label for="floatingInput3">이름 입력</label>
					</div>

					<div>
						<select class="form-select mb-1" name="u_m_gender" id="gender" required>
							<option value="">성별 선택</option>
							<option value="M">Man</option>
							<option value="W">Woman</option>
						</select>
						<div class="invalid-feedback">
							성별을 선택해주세요
						</div>
					</div>

					<div class="form-floating mb-1">
						<input type="email" name="u_m_mail" class="form-control" id="floatingInput5" placeholder="email@example.com">
						<label for="floatingInput5">이메일 입력</label>
					</div>

					<div class="form-floating">
						<input type="text" name="u_m_phone" class="form-control" id="floatingInput6" placeholder="010-xxxx-xxxx">
						<label for="floatingInput6">휴대폰번호 입력</label>
					</div>

					<input type="button"  class="mt-4" value="회원가입" onclick="createAccountForm();">

				</form>
				
			</div>
			
			<div class="login mt-4">
				
				<a href="<c:url value='/user/member/loginForm' />" class="text-decoration-none">로그인 화면</a>
				
			</div>
		
		</div>
		
	</section>
	</main>
	
	<jsp:include page="../../include/footer.jsp" />
	
</body>
</html>