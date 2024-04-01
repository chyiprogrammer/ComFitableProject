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
					<h1 class="text-white">덤벨만 있으면 어디서나 쉽게.</h1>
					<p class="text-white">어렵게 생각하시지 않으셔도 됩니다. 처음부터 잘하는 사람은 어디에도 없습니다.</p>
				</div>
			</div>

		</div>

		<div class="carousel-item bg-dark">
			<img src="/resources/choi_machine/img/Dumbell4.jpg" class="bd-placeholder-img d-block mt-5 mb-5 w-75 mx-auto" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
				<rect width="100%" height="100%" fill="#777"/>
			</img>

			<div class="container">
				<div class="carousel-caption">
					<h1 class="text-white">덤벨 없이도 가능합니다.</h1>
					<p class="text-white">차근차근 눈으로 먼저 운동을 익히셔도 좋습니다. 올바른 자세는 운동의 핵심입니다.</p>
				</div>
			</div>
		</div>

		<div class="carousel-item bg-dark">
			<img src="/resources/choi_machine/img/Kettlebell.jpg" class="bd-placeholder-img d-block mt-5 mb-5 w-75 mx-auto" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
				<rect width="100%" height="100%" fill="#777"/>
			</img>

			<div class="container">
				<div class="carousel-caption text-end">
					<h1 class="text-white">당신은 할 수 있습니다.</h1>
					<p class="text-white">여러분과 같은 "사람"이 만든 운동입니다. 여러분도 충분히 할 수 있습니다.</p>
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
				<span class="text-muted" style="line-height: 1.5">우리도 어떤 어려움이든 마음을 다잡고 꾸준히<br>
					노력하면 결국 우리의 목표를 이룰 수 있습니다.</span></h3>
			<br>
			<p class="lead" style="line-height: 1.6">인간은 <span class="text-success fw-bold">성취감</span>을 통해 가장 많이 성장합니다.
				<br>
				성취감은 우리에게 <span class="text-success fw-bold">목표</span>를 설정하고 이루기 위해 노력하고
			성공했을 때 느끼는 <span class="text-success fw-bold">만족감</span>이며, 이는 우리에게 자신감과 자아존중감을 부여합니다.
			</p>
		</div>
		<div class="col-md-5">
			<img src="/resources/choi_machine/img/main_feat1.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false">
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
				<span class="text-muted" style="line-height: 1.5">우리는 내면의 힘을 통해 충분히 우리가 원하는 <br> 방식으로 살아갈 수 있습니다.</span></h3>
			<br><br>
			<p class="lead" style="line-height: 1.6">
				자기를 잘 알고 <span class="text-success fw-bold">자신의 가치</span>를 이해하는 것은 내면의 힘을 키우는 데에 중요한 요소입니다.<br>
				또한, 내면의 힘은 우리의 감정을 조절하고 <span class="text-success fw-bold">긍정적인 마인드셋</span>을 <br>유지하는 데에도 도움을 줍니다.<br>
			</p>
		</div>
		<div class="col-md-5 order-md-1">
			<img src="/resources/choi_machine/img/main_feat2.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false">
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
				<span class="text-muted" style="line-height: 1.5">우리는 방법에 상관없이 걷거나 뛰며 <br> 끝을 향해 차근차근 다가가기만 하면 됩니다.</span></h2>
			<br><br>
			<p class="lead" style="line-height: 1.6">
				모든 것에는 단계가 있다는 것을 잊지 말아야 합니다.<br>
				<span class="text-success fw-bold">희망</span>하는 목표를 향해 조금씩 나아가는 것은
				<br>
				차근차근 노력하여 <span class="text-success fw-bold">성취를 향해</span> 걸어가는 것입니다.
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