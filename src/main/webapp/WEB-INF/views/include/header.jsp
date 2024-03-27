<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
<link href="<c:url value='/resources/css/include/header.css' />" rel="stylesheet" type="text/css">
--%>



<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

<script type="text/javascript">

	$(function() {
		console.log('HEADER DOCUMENT READY!!');
		
		/*
		console.log('---> ' + $(location).attr('href'));
		console.log('---> ' + $(location).attr('pathname'));
		*/
		
		let pathname = $(location).attr('pathname');
		let isIncludeUser = pathname.includes('/user');
		
		if (isIncludeUser) {
			$('#header_wrap .menu ul li a.user').css('text-decoration', 'green wavy underline');
			
		} else {
			$('#header_wrap .menu ul li a.admin').css('text-decoration', 'red wavy underline');
		}
		
		
	});

</script>

<link href="<c:url value="/resources/choi_machine/css/bootstrap/bootstrap.min.css"/>" rel="stylesheet">

<header class="p-3 bg-dark text-white">
	<div class="container">
		<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
			<a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
				<svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
			</a>


				<a href="<c:url value='/' />" class="nav-link px-10 text-white">
					<img src="/resources/choi_machine/img/main_logo.png" class="img-fluid" width="178" height="178">
				</a>
			<h1 class="text-center text-warning me-3">ComFitable</h1>

			<h4 class="d-block">The best healthcare for everyone</h4>

<%--			<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
				<input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">
			</form>--%>


		</div>
	</div>
</header>