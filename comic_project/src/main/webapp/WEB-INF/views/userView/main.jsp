<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/userHeader.jsp"%>

<style type="text/css">
body {
	background-image: url("/resources/images/bg-masthead.jpg");
	background-size: cover;
}

.content-wrapper {
	padding-top: 30px;
}
</style>
<body>

	<!-- Header -->
	<div class="main-penal">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-md-2 text-center">
					<h1>${ roomNum } 번방</h1>
					<p>시간</p>
				</div>
			</div>
			<div class="container">
				<div class="content-section-heading text-center">
					<h2 class="mb-5">Comic Clerk♥</h2>
				</div> 
				<div class="row no-gutters"> 
					<div class="col-lg-4">
						<a class="portfolio-item" id="userOrderView"> <span class="caption"> <span class="caption-content">
									<h3>상품 주문</h3>
									<p class="mb-0">A yellow pencil with envelopes on a clean, blue backdrop!</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/portfolio-1.jpg" alt="">
						</a>
					</div>
					<div class="col-lg-4">
						<a class="portfolio-item" href="#"> <span class="caption"> <span class="caption-content">
									<h3>도서 검색</h3>
									<p class="mb-0">A yellow pencil with envelopes on a clean, blue backdrop!</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/portfolio-1.jpg" alt="">
						</a>
					</div>
					<div class="col-lg-4">
						<a class="portfolio-item" href="#"> <span class="caption"> <span class="caption-content">
									<h3>상세 요금</h3>
									<p class="mb-0">A yellow pencil with envelopes on a clean, blue backdrop!</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/portfolio-1.jpg" alt="">
						</a>
					</div>
					<div class="col-lg-4">
						<a class="portfolio-item" id="userChat"> <span class="caption"> <span class="caption-content">
									<h3>문의 하기</h3>
									<p class="mb-0">Strawberries are such a tasty snack, especially with a little sugar on top!</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/portfolio-3.jpg" alt="">
						</a>
					</div> 
					<div class="col-lg-4">
						<a class="portfolio-item" href="#"> <span class="caption"> <span class="caption-content">
									<h3>게시판</h3>
									<p class="mb-0">A yellow workspace with some scissors, pencils, and other objects.</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/portfolio-4.jpg" alt="">
						</a>
					</div>
					<div class="col-lg-4"> 
						<a class="portfolio-item" href="#"> <span class="caption"> <span class="caption-content">
									<h3>사용 종료</h3>
									<p class="mb-0">A yellow workspace with some scissors, pencils, and other objects.</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/portfolio-4.jpg" alt="">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- hidden form -->
	<form id="operForm"></form>
</body>

<script type="text/javascript">
$(document).ready(function(){
	var operForm = $("#operForm");
	
	$("#userOrderView").on("click", function(e){
		operForm.attr("method", "get");
		operForm.attr("action","/userView/order");
		operForm.submit();
	});

	$("#userChat").on("click", function(e){
		operForm.attr("method", "get");
		operForm.attr("action","/userView/chatting");
		operForm.submit();
	});
});
</script>
</html>
