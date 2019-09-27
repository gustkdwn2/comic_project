<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<%-- <%@ include file="./younghak_header.jsp"%> --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: Arial, Helvetica, sans-serif;
}

/* The grid: Three equal columns that floats next to each other */
.column {
	float: left;
	width: 30.0%;
	padding: 10px;
	/* text-align: center; */
	font-size: 16px;
	cursor: pointer;
	color: gray;
	margin-left: 10px;
	height: 230px;
}

.containerTab {
	padding: 20px;
	color: white;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Closable button inside the container tab */
.closebtn {
	float: right;
	color: white;
	font-size: 35px;
	cursor: pointer;
}

.div_root {
	float: left;
	width: 30.0%;
	padding: 50px;
	text-align: center;
	font-size: 25px;
	cursor: pointer;
	color: gray;
	margin-left: 10px;
	height: 230px;
}

.div_menu {
	width: 30%;
	/* height:100px; */
	padding: 13% 0px;
	height: 90%;
	float: left;
	font-size: 30px;
	background-color: #ffac6a;
	text-align: center;
}

.div_con {
	width: 70%;
	/* height:100px ; */
	height: 90%;
	margin-right: auto;
	/* margin:10px; */
	padding-left: 3%;
	padding-top: 5%;
	float: left;
	font-size: 20px;
	background-color: #19f011;
	/* //background-size:50%50%; */
	text-align: center-vertical;
}

.div_bottom_2 {
	width: 100%;
	/* height:100px; */
	height: 10%;
	clear: both;
	background-color: #C8FE2E;
	text-align: center;
}
</style>

</head>
<body style="overflow: scroll">

	<div class="main-panel">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-12 grid-margin stretch-card">
					<div class="card">
						<div class="row">
							<div class="col-md-6">
								<div class="card-body">
									<%-- <h4 class="card-title">Single color buttons</h4>
                      <p class="card-description">Add class <code>.btn-{color}</code> for buttons in theme colors</p> --%>
									<div class="template-demo"></div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="card-body">

									<div class="template-demo">
										<button type="button"
											onclick="javascript:window.location.href='importdetail'"
											class="btn btn-primary btn-rounded btn-fw">수입 상세 검색</button>
										<button type="button"
											onclick="javascript:window.location.href='Managerpos'"
											class="btn btn-danger btn-rounded btn-fw">포스기 화면</button>
										<button type="button"
											onclick="javascript:window.location.href='login'"
											class="btn btn-secondary btn-rounded btn-fw">출퇴근하기</button>
										<button type="button"
											class="btn btn-success btn-rounded btn-fw">직원관리</button>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 grid-margin stretch-card">
					<div class="card">
						<div class="row">
							<div class="col-md-12">
								<div class="card-body">
									<h4 class="card-title">Outlined buttons</h4>
									<p class="card-description">
										Add class
										<code>.btn-outline-{color}</code>
										for outline buttons
									</p>
									<div class="template-demo">

										<div class="row">
											<div class="column" onclick="method_startnstop(1);"
												style="background: #F6CEF5;">

												<div class="div_menu">1번방</div>

												<div class="div_con">
													사 용 자 : <font id="user1">없음</font><br> 사용시간 : <font
														id="user_time1">없음</font><br> 사용상태 : <font
														id="user_status1">없음</font><br> 주문상태 : <font
														id="order_status1">없음</font><br>
												</div>

												<div class="div_bottom_2">
													<input type="button" value="주문내역보기"> <input
														type="button" value="결제하기"> <input type="button"
														value="채팅하기">
												</div>

												<!-- </div> -->

											</div>

											<div class="column" onclick="method_startnstop(2);"
												style="background: #E6E6E6;">
												<!-- <div class="div_root"> -->

												<div class="div_menu">2번방</div>

												<div class="div_con">
													사 용 자 : <font id="user2">없음</font><br> 사용시간 : <font
														id="user_time2">없음</font><br> 사용상태 : <font
														id="user_status2">없음</font><br> 주문상태 : <font
														id="order_status2">없음</font><br>
												</div>

												<div class="div_bottom_2">
													<input type="button" value="주문내역보기"> <input
														type="button" value="결제하기"> <input type="button"
														value="채팅하기">
												</div>

											</div>
											<div class="column" onclick="openTab('b3');"
												style="background: #EFF8FB;">Box 3</div>
										</div>
										<br>

										<div class="row">
											<div class="column" onclick="openTab('b1');"
												style="background: #58FAF4;">Box 4</div>
											<div class="column" onclick="openTab('b2');"
												style="background: #BEF781;">Box 5</div>
											<div class="column" onclick="openTab('b3');"
												style="background: #F3F781;">Box 6</div>
										</div>
									</div>
								</div>
							</div>
							<!-- <div class="col-md-0"> -->
							<div class="card-body">
								<%-- <h4 class="card-title">Inverse buttons</h4>
                      <p class="card-description">Add class <code>.btn-inverse-{color} for inverse buttons</code></p> --%>
								<div class="template-demo"></div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	</div>


	<div class="card-body">
		<h4 class="card-title">Social button with text</h4>
		<p class="card-description">
			Add class
			<code>.btn-social-icon-text</code>
		</p>
		<div class="template-demo">
			<button type="button" class="btn btn-social-icon-text btn-facebook">
				<i class="mdi mdi-facebook"></i>Facebook
			</button>
			<button type="button" class="btn btn-social-icon-text btn-youtube">
				<i class="mdi mdi-youtube"></i>Youtube
			</button>
			<button type="button" class="btn btn-social-icon-text btn-twitter">
				<i class="mdi mdi-twitter"></i>Twitter
			</button>
			<button type="button" class="btn btn-social-icon-text btn-dribbble">
				<i class="mdi mdi-dribbble"></i>Dribbble
			</button>
			<button type="button" class="btn btn-social-icon-text btn-linkedin">
				<i class="mdi mdi-linkedin"></i>Linkedin
			</button>
			<button type="button" class="btn btn-social-icon-text btn-google">
				<i class="mdi mdi-google-plus"></i>Google
			</button>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<!-- content-wrapper ends -->
	<!-- partial:../../partials/_footer.html -->

	</div>
	<!-- main-panel ends -->


	<script>
		function openTab(tabName) {
			var i, x;
			x = document.getElementsByClassName("containerTab");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			document.getElementById(tabName).style.display = "block";
		}

		function pos_start(roomnum) {
			alert(roomnum + "번 방 시작");

		}

		var hour = 0;
		var minute = 0;

		var check = new Array(7); //방의 개수보다 1크게

		array_init(check);

		function array_init(check) {
			for (var i = 0; i < check.length; i++) {
				check[i] = false;
			}
		}

		function method_startnstop(num) {

			if (!check[num]) {
				check[num] = true;
				time_start(0, num);
				/* 테스트용 */
				var user = "tmehfld";
				var user_status = "unavail";
				var order_status = "unavail";

				var roomuse_id = "tmehfld";
				var roomuse_num = num;
				var roomuse_status = "on";

				document.getElementById('user' + num).innerHTML = user;
				document.getElementById('user_status' + num).innerHTML = user_status;
				document.getElementById('order_status' + num).innerHTML = order_status;

				//ajaxtosenddb_COMIC_ROOM_USE(user,"THISTIME",user_status,order_status,num);
				ajaxtosenddb_comic_room_use2(roomuse_id, roomuse_num,
						roomuse_status);

			} else {

				check[num] = false;
				document.getElementById('user' + num).innerHTML = "대기중";
				document.getElementById('user_time' + num).innerHTML = "00:00:00";
				document.getElementById('user_status' + num).innerHTML = "사용가능";
				document.getElementById('order_status' + num).innerHTML = "대기중";

				//ajaxtosenddb_COMIC_ROOM_USE("대기중","사용가능","사용가능","대기중",num);
			}
		}

		function ajaxtosenddb_COMIC_ROOM_USE(user, starttime, user_status,
				order_status, room_number) {
			var list = [ user, starttime, user_status, order_status,
					room_number ];
			//사용자,시작시간,사용자 상태,주문 상태,방번호
			//alert("보내기전의 list" + list);
			var sendData = {
				'list' : list
			};

			$.ajax({
				url : '/managerpos/room_start',
				dataType : 'json',
				data : JSON.stringify(sendData),
				contentType : "application/json; charset=utf-8;",
				type : 'POST',
				success : function(data) {
					console.log("성공");
					alert("success!");
					
				},
				error : function(data) {
					console.log("실패");
				}
			});
		}

		function ajaxtosenddb_comic_room_use2(roomuse_id, roomuse_num,
				roomuse_status) {
			var list = [ roomuse_id, roomuse_num,
				roomuse_status];
			//사용자,시작시간,사용자 상태,주문 상태,방번호
			//alert("보내기전의 list" + list);
			var sendData = {
				'list' : list
			};

			$.ajax({
				url : '/managerpos/room_start2',
				dataType : 'json',
				data : JSON.stringify(sendData),
				contentType : "application/json; charset=utf-8;",
				type : 'POST',
				success : function(data) {
					console.log("성공");
					alert("success!");
					
				},
				error : function(data) {
					console.log("실패");
				}
			});
		}

		function time_start(time, num) {
			//	alert("0");
			if (!check[num]) {

			} else {

				time += 1;
				hour = Math.floor(time / 3600);
				hour = time_modify(hour);

				minute = Math.floor(time / 60);
				minute = time_modify(minute);

				var second = time % 60;
				second = time_modify(second);

				document.getElementById('user_time' + num).innerHTML = hour
						+ ":" + minute + ":" + second;

				//document.getElementById('test1_2').innerHTML="와쓰"+time;
				var t = setTimeout(function() {
					time_start(time, num)
				}, 1000)
			}

		}

		function time_modify(time) {

			if (time.toString().length == 1) {
				time = "0" + time;
			}
			return time;
		}

		function num_length() {
			var num = 123;
			var str = "123";
			alert("num.toString().length = " + num.toString().length + "\n"
					+ "str.length = " + str.length)
		}
	</script>


</body>
</html>