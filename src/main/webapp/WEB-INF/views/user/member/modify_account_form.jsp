<%@page import="kr.co.namu.user.member.UserMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="../../include/title.jsp" />

<%--
<link href="<c:url value='/resources/css/user/modify_account_form.css' />" rel="stylesheet" type="text/css">
--%>

	<link href="/resources/choi_machine/css/bootstrap/bootstrap.min.css" rel="stylesheet">


	<jsp:include page="../include/modify_account_form_js.jsp" />

</head>
<body class="text-center">

	<jsp:include page="../../include/header.jsp" />
	
	<jsp:include page="../include/nav.jsp" />

	<main class="form-signin d-flex justify-content-center">

	<section>
		
		<div id="section_wrap">

			<img class="mb-4 mt-5" src="/resources/choi_machine/img/modify_act.png" alt="" width="77" height="55">
			<h1 class="h3 mb-3 fw-normal ms-5 me-5 ">정보수정</h1>

			<div class="modify_account_form">

				<form action="<c:url value='/user/member/modifyAccountConfirm' />" name="modify_account_form" method="post">
					
					<input type="hidden" name="u_m_no" value="${loginedUserMemberVo.u_m_no}">

					<div class="form-floating mb-1">
						<input type="text" name="u_m_id" value="${loginedUserMemberVo.u_m_id}" readonly disabled>
					</div>

					<div class="form-floating mb-1">
						<input type="password" name="u_m_pw" value="******" readonly disabled>
					</div>

					<div class="form-floating mb-1">
						<input type="text" name="u_m_name" value="${loginedUserMemberVo.u_m_name}" placeholder="INPUT USER NAME.">
					</div>

<%--					<select name="u_m_gender">
						<option value="">SELECET USER GENDER.</option>
						<option value="M" <c:if test="${loginedUserMemberVo.u_m_gender eq 'M'}"> selected </c:if>>Man</option>
						<option value="W" <c:if test="${loginedUserMemberVo.u_m_gender eq 'W'}"> selected </c:if>>Woman</option>
					</select>--%>

					<div>
						<select class="form-select mb-1" name="u_m_gender">
							<option value="M" <c:if test="${loginedUserMemberVo.u_m_gender eq 'M'}"> selected </c:if>>Man</option>
							<option value="W" <c:if test="${loginedUserMemberVo.u_m_gender eq 'W'}"> selected </c:if>>Woman</option>
						</select>
					</div>

					<div class="form-floating mb-1">
						<input type="email"	name="u_m_mail" value="${loginedUserMemberVo.u_m_mail}" placeholder="INPUT USER MAIL." >
					</div>

					<div class="form-floating mb-1">
						<input type="text" name="u_m_phone"	value="${loginedUserMemberVo.u_m_phone}" placeholder="INPUT USER PHONE.">
					</div>

					<input type="button" class="mt-4" value="수정하기" onclick="modifyAccountForm();">

				</form>
				
			</div>
		
		</div>
		
	</section>
	</main>
	
	<jsp:include page="../../include/footer.jsp" />
	
</body>
</html>