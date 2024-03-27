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
					<h1 class="text-white">Example headline.</h1>
					<p class="text-white">Some representative placeholder content for the first slide of the carousel.</p>
				</div>
			</div>

		</div>

		<div class="carousel-item bg-dark">
			<img src="/resources/choi_machine/img/Dumbell4.jpg" class="bd-placeholder-img d-block mt-5 mb-5 w-75 mx-auto" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
				<rect width="100%" height="100%" fill="#777"/>
			</img>

			<div class="container">
				<div class="carousel-caption">
					<h1 class="text-white">Another example headline.</h1>
					<p class="text-white">Some representative placeholder content for the second slide of the carousel.</p>
				</div>
			</div>
		</div>

		<div class="carousel-item bg-dark">
			<img src="/resources/choi_machine/img/Kettlebell.jpg" class="bd-placeholder-img d-block mt-5 mb-5 w-75 mx-auto" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
				<rect width="100%" height="100%" fill="#777"/>
			</img>

			<div class="container">
				<div class="carousel-caption text-end">
					<h1 class="text-white">One more for good measure.</h1>
					<p class="text-white">Some representative placeholder content for the third slide of this carousel.</p>
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
			<h2 class="featurette-heading">First featurette heading. <span class="text-muted">It’ll blow your mind.</span></h2>
			<p class="lead">Some great placeholder content for the first featurette here. Imagine some exciting prose here.</p>
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
			<h2 class="featurette-heading">Oh yeah, it’s that good. <span class="text-muted">See for yourself.</span></h2>
			<p class="lead">Another featurette? Of course. More placeholder content here to give you an idea of how this layout would work with some actual real-world content in place.</p>
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
			<h2 class="featurette-heading">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>
			<p class="lead">And yes, this is the last block of representative placeholder content. Again, not really intended to be actually read, simply here to give you a better view of what this would look like with some actual content. Your content.</p>
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