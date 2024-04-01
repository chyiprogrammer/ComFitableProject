<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%--

<jsp:include page="../include/title.jsp" />
--%>


</head>

<jsp:include page="../include/header.jsp" />
<jsp:include page="./include/nav.jsp" />

<body>


<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
	<div class="carousel-indicators">
		<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
		<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
	</div>
	<div class="carousel-inner">

		<div class="carousel-item active bg-dark">
			<img src="/resources/choi_machine/img/Dumbell.jpg" class="bd-placeholder-img d-block mt-5 mb-5 w-75 mx-auto" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
				<rect width="100%" height="100%" fill="#777"/>
			</img>

			<div class="container">
				<div class="carousel-caption text-start">
					<h1 class="text-danger">운동에는 정답이 없습니다</h1>
					<p class="text-white fs-3">본인만의 운동 루틴을 만들어보세요.</p>
				</div>
			</div>

		</div>

		<div class="carousel-item bg-dark">
			<img src="/resources/choi_machine/img/Dumbell4.jpg" class="bd-placeholder-img d-block mt-5 mb-5 w-75 mx-auto" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
				<rect width="100%" height="100%" fill="#777"/>
			</img>

			<div class="container">
				<div class="carousel-caption">
					<h1 class="text-warning">덤벨이 없어도 가능합니다</h1>
					<p class="text-white fs-3">운동은 시간과 공간의 제약을 덜 받습니다.</p>
				</div>
			</div>
		</div>

		<div class="carousel-item bg-dark">
			<img src="/resources/choi_machine/img/Kettlebell.jpg" class="bd-placeholder-img d-block mt-5 mb-5 w-75 mx-auto" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
				<rect width="100%" height="100%" fill="#777"/>
			</img>

			<div class="container">
				<div class="carousel-caption text-end">
					<h1 class="text-info">당신은 할 수 있습니다</h1>
					<p class="text-white fs-3">원한다면 여러분도 충분히 할 수 있습니다.</p>
				</div>
			</div>
		</div>

	</div>

	<button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Previous</span>
	</button>

	<button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Next</span>
	</button>

</div>

<br>


<!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->

<div class="container marketing">

	<%--<!-- Three columns of text below the carousel -->
	<div class="row">
		<div class="col-lg-4">
			<svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

			<h2>Heading</h2>
			<p>Some representative placeholder content for the three columns of text below the carousel. This is the first column.</p>
			<p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
		</div><!-- /.col-lg-4 -->
		<div class="col-lg-4">
			<svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

			<h2>Heading</h2>
			<p>Another exciting bit of representative placeholder content. This time, we've moved on to the second column.</p>
			<p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
		</div><!-- /.col-lg-4 -->
		<div class="col-lg-4">
			<svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

			<h2>Heading</h2>
			<p>And lastly this, the third column of representative placeholder content.</p>
			<p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
		</div><!-- /.col-lg-4 -->
	</div><!-- /.row -->--%>


	<!-- START THE FEATURETTES -->

	<hr class="featurette-divider">

	<div class="row featurette">
		<div class="col-md-7">
			<h3 class="featurette-heading">물이 어떻게 흐르든 강물은 결국 바다로 향한다.
				<br><br>
				<span class="fs-1 fw-bold">목표</span></h3>
			<br>
			<p class="lead" style="line-height: 1.6">인간은 <span class="text-success fw-bold">성취감</span>을 통해 가장 많이 성장합니다.

			</p>
		</div>
		<div class="col-md-5">
			<img src="/resources/choi_machine/img/main_feat1.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" preserveAspectRatio="xMidYMid slice" focusable="false">
				<title>Placeholder</title>
				<rect width="100%" height="100%" fill="#eee"/>
			</img>

		</div>
	</div>

	<hr class="featurette-divider">

	<div class="row featurette">
		<div class="col-md-7 order-md-2">
			<h3 class="featurette-heading">바람이 어떻든 비행은 새의 마음에서 비롯된다.
				<br><br>
				<span class="fs-1 fw-bold">내면의 힘</span></h3>
			<br>
			<p class="lead" style="line-height: 1.6">
				<span class="text-success fw-bold">자신의 가치</span>를 이해하려 노력합니다.<br>
			</p>
		</div>
		<div class="col-md-5">
			<img src="/resources/choi_machine/img/main_feat2.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" preserveAspectRatio="xMidYMid slice" focusable="false">
				<title>Placeholder</title>
				<rect width="100%" height="100%" fill="#eee"/>
			</img>

		</div>
	</div>

	<hr class="featurette-divider">

	<div class="row featurette">
		<div class="col-md-7">
			<h2 class="featurette-heading">달리기는 항상 끝이 있다.
				<br><br>
				<span class="fs-1 fw-bold">성장</span></h2>
			<br>
			<p class="lead" style="line-height: 1.6">

				<span class="text-success fw-bold">희망</span>하는 목표를 향해 조금씩 나아가봅니다.

			</p>
		</div>
		<div class="col-md-5">
			<img src="/resources/choi_machine/img/main_feat3.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false">
				<title>Placeholder</title>
				<rect width="100%" height="100%" fill="#eee"/>
			</img>

		</div>
	</div>

	<hr class="featurette-divider">

	<!-- /END THE FEATURETTES -->

</div><!-- /.container -->

	<jsp:include page="../include/footer.jsp" />


</body>
</html>