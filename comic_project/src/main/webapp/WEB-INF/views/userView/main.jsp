<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/userHeader.jsp"%>

<style type="text/css">
.content-wrapper {
	padding-top: 30px;
}
</style>
<body>
	<!-- Header -->
	<div class="main-penal">
		<div class="content-wrapper">
			<div style="background-color: #37363a; height: 150px;">
				<img src="/resources/images/comic_image.png" alt="" style="width: 200px; height: 100px; margin-left:370px; margin-top:20px; float: left "/>
				<div class="content-section-heading text-center" style="width: 700px; height: 100px; margin-top:30px; float: left;"><br/>
					<h1 style="color:white;">${ roomNum } 번방 홈 &emsp;&emsp; 02:15:39</h1>
				</div> 
				<div style="width: 600px; height: 100px; float: right; color:#f4e362; margin-top:60px; font-size: 20px;">
				 회원 수정 
				</div>
				<br/><br/>
			</div>
			<div class="container">
				<div class="row no-gutters" style="margin-top: 50px;"> 				
					<div style="border: 10px solid #f4e362; width: 1300px; height: 80px; border-radius: 70px / 30px; margin-bottom: 30px;">
					여기에 알림이 오도록 할건지 아님 어떻게 할건지 ??!!
					</div>
					
					<div class="col-lg-4">
						<a class="portfolio-item" id="userOrderView"> <span class="caption"> <span class="caption-content">
									<h3>상품 주문</h3>
									<p class="mb-0">상품을 주문하실 수 있습니다</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/orderIcon.png" alt="" style="width:370px; height:250px;">
						</a>
					</div>
					<div class="col-lg-4">
						<a class="portfolio-item" id="userSearchbook"> <span class="caption"> <span class="caption-content">
									<h3>도서 검색</h3>
									<p class="mb-0">코믹 서기의 도서를 검색할 수 있습니다</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/searchIcon.png" alt="" style="width:370px; height:250px;">
						</a>
					</div>
					<div class="col-lg-4">
						<a class="portfolio-item" id="billModalBtn"> <span class="caption"> <span class="caption-content">
									<h3>상세 요금</h3>
									<p class="mb-0">현재 사용한 요금을 보실 수 있습니다</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/moneyIcon.png" alt="" style="width:370px; height:250px;">
						</a>
					</div>
					<div class="col-lg-4">
						<a class="portfolio-item" id="userChat"> <span class="caption"> <span class="caption-content">
									<h3>채팅 하기</h3>
									<p class="mb-0">실시간 대화를 나눌 수 있습니다</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/chatIcon.png" alt="" style="width:370px; height:250px;">
						</a>
					</div> 
					<div class="col-lg-4">
						<a class="portfolio-item" id="userBoard"> <span class="caption"> <span class="caption-content">
									<h3>건의 게시판</h3>
									<p class="mb-0">건의 사항을 적는 게시판입니다</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/boardIcon.png" alt="" style="width:370px; height:250px;">
						</a>
					</div>
					<div class="col-lg-4"> 
						<a class="portfolio-item" href="#"> <span class="caption"> <span class="caption-content">
									<h3>사용 종료</h3>
									<p class="mb-0">사용 종료를 하면 로그아웃되고 결제 페이지로 넘어갑니다</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/exitIcon.png" alt="" style="width:370px; height:250px;">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="billModal.jsp" />
	<jsp:include page="productBillModal.jsp" />
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

	$("#userSearchbook").on("click", function(e){
		operForm.attr("method", "get");
		operForm.attr("action","/SearchBook/searchList");
		operForm.submit();
	});

	$("#userBoard").on("click", function(e){
		operForm.attr("method", "get");
		operForm.attr("action","/userView/board/boardList");
		operForm.submit();
	});

	$("#billModalBtn").on("click", function(e){
		$.ajax({
			type: 'get',
			url: '/userView/userBill?userId=${Memberlogin.MEMBER_ID}',
			dataType: 'json',
			success: function(data) {
				$('#productBill').attr('value',data.product_bill);
				$('#roomBill').attr('value',data.room_bill);
				$('#totalBill').attr('value',data.total_bill);
			}
		});
		
		
		$("#productBillModalBtn").click(function() {
			$.ajax({
				type: 'get',
				url: '/userView/userProductBill?userId=${Memberlogin.MEMBER_ID}',
				dataType: 'json',
				success: function(data) {
					console.log(data);
					$("#productBillTbody").html("");
		            var str = '<tr>';
		            $.each(data , function(i){
		            	var date = new Date(data[i].order_time); var month = date.getMonth() + 1; 
		                str += '<td>' + date.getFullYear() + "-" + (month.toString().length > 1 ? month : "0" + month) + "-" + date.getDate() +
		                "<br>" + date.getHours() + " : " + date.getMinutes() + ' : ' + date.getSeconds() + '</td><td>' + data[i].product_name + '</td><td>' + data[i].order_qty + '</td><td>' + data[i].order_bill + '</td>';
		                str += '</tr>';
		           });
		           $("#productBillTbody").append(str);
					
				}
			});
			/* $("#productBillModal").modal('show').css({
			    'margin-top': function () { //vertical centering
			        return -($(this).height() / 100);
			    },
			    'margin-left': function () { //Horizontal centering
			        return -($(this).width() / 100);
			    }
			}); */
			$("#productBillModal").show();
		});

		$('#billModal').show();
	});

	
});
</script>
</html>
