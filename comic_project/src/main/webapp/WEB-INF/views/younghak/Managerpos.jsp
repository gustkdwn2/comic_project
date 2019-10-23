﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>

<%-- <%@ include file="./younghak_header.jsp"%> --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/managerposCss.css">

</head>
<body>
   <div class="main-panel">
      <div class="content-wrapper">
         <div class="row">
   
            <%@ include file="./younghak_header.jsp"%>
            <button id="roomClose">끄기 테스트</button>
            <div class="col-12 grid-margin stretch-card">
               <div class="card">
                  <div class="row">
<div class="col-md-12">
   <div class="card-body">
      <div class="template-demo">
      
         <c:forEach var="i" begin="1" end="6" step="1">
         
         <c:if test="${i%3==1}">
         <div class="row">
         </c:if>
<div class="column" >
   <!-- <div class="div_root"> -->

   <div class="div_menu">${i}번방</div>

   
   <div class="div_con">
      사 용 자 : <font id="user${i}">없음</font><br> 사용시간 : <font
         id="user_time${i}">없음</font><br> 사용상태 : <font
         id="user_status${i}">없음</font><br> 주문상태 : <font
         id="order_status${i}">없음</font><br>
   </div>
   
                     <div class="div_bottom">
                        <input type="button" value="주문내역보기"
                           class="btn btn-primary btn-sm"
                           style="height: 40px; width: 150px; margin: 10px 40px 0 100px;">
                     
                        <input type="button" value="채팅하기"
                           class="btn btn-danger btn-sm"
                           style="height: 40px; width: 100px; margin: 10px 0 0 0px;">
                     </div>
   
                  

<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: "맑은 고딕";
}

/* The grid: Three equal columns that floats next to each other */
.column {
	float: left;
	width: 500px;
	/* text-align: center; */
	font-size: 16px;
	cursor: pointer;
	color: #555555;
	height: 300px;
	border-right: 3px solid #f3f3f3;
	background-color: #686868;
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
	padding-top: 20%;
	height: 80%;
	float: left;
	font-size: 30px;
	text-align: center;
	border-right: 3px solid #f3f3f3;
	border-bottom: 3px solid #f3f3f3;
	color: white;
	height: 80%;
}

.div_con {
	width: 70%;
	/* height:100px ; */
	height: 80%;
	margin-right: auto;
	/* margin:10px; */
	padding-left: 3%;
	padding-top: 5%;
	float: left;
	font-size: 20px;
	color: white;
	/* //background-size:50%50%; */
	border-bottom: 3px solid #f3f3f3;
	text-align: center-vertical;
}

.div_bottom {
	width: 100%;
	/* height:100px; */
	height: 10%;
	clear: both;
}
</style>

</head>
<body>
	<div class="main-panel">
		<%@ include file="./younghak_header.jsp"%>
		<div class="col-12 grid-margin stretch-card">
			<div class="card">
				<div class="row">
					<div class="col-md-12">
						<div class="card-body">
							<div class="template-demo">
								<c:forEach var="i" begin="1" end="6" step="1">

									<c:if test="${i%3==1}">
										<div class="row">
									</c:if>

									<div class="column">
										<!-- <div class="div_root"> -->

										<div class="div_menu">${i}번방</div>


										<div class="div_con">
											사 용 자 : <font id="user${i}">없음</font><br> 사용시간 : <font id="user_time${i}">없음</font><br> 사용상태 : <font id="user_status${i}">없음</font><br>
											주문상태 : <font id="order_status${i}">없음</font><br>
										</div>
										<div class="div_bottom">
											<input type="button" value="주문내역보기"
												class="btn btn-primary btn-sm"
												style="height: 40px; width: 150px; margin: 10px 40px 0 100px;">

											<input type="button" value="채팅하기"
												class="btn btn-success btn-sm"
												style="height: 40px; width: 100px; margin: 10px 0 0 0px;">
										</div>


											<input type="button" value="주문내역보기" class="btn btn-primary btn-sm" style="height: 40px; width: 150px; margin: 10px 40px 0 100px;">

											<input type="button" value="채팅하기" class="btn btn-success btn-sm" style="height: 40px; width: 100px; margin: 10px 0 0 0px;">
										</div>
									</div>
									<c:if test="${i%3==0}">
							</div>
							<br>
							</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>

			<!-- 실시간 주문 테이블 -->
			<div class="row">
				<div class="col-md-12 stretch-card">
					<div class="card" style="margin-bottom: 20px;">
						<div class="card-body">
							<p class="card-title">주문 현황</p>
							<div class="table-responsive">
								<table id="realOrderTable" class="table table-striped">
									<thead>
										<tr>
											<th>번호</th>
											<th>날짜</th>
											<th>방번호</th>
											<th>ID</th>
											<th>상품</th>
											<th>수량</th>
											<th>가격</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- main-panel ends -->

	<script>
	
	array_init(check);

	ajaxtogetdb_comic_room_uselist();
	//초기화작업
	
	realOrder();
	
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

		function array_init(check_arr) {
			for (var i = 0; i < check_arr.length; i++) {
				check_arr[i] = false;
			}
		}

		
		function method_startnstop(num, id) {
			// 시작시간
			if (!check_arr[num]) {
				check_arr[num] = true;
				time_start(0, num);
				var user = "id";
				var user_status = "unavail";
				var order_status = "unavail";

				var roomuse_id = "id";
				var roomuse_num = num;
				var roomuse_status = "on";

				document.getElementById('user' + num).innerHTML = user;
				document.getElementById('user_status' + num).innerHTML = roomuse_status;
				document.getElementById('order_status' + num).innerHTML = order_status;

				ajaxtosenddb_comic_room_use2(id, num, "on");

			} else {

				check_arr[num] = false;

				var roomuse_id = "없음";
				var roomuse_num = num;
				var roomuse_status = "off";
				
				document.getElementById('user' + num).innerHTML = "대기중";
				document.getElementById('user_time' + num).innerHTML = "00:00:00";
				document.getElementById('user_status' + num).innerHTML = roomuse_status;
				document.getElementById('order_status' + num).innerHTML = "대기중";

				ajaxtosenddb_comic_room_use2(roomuse_id, roomuse_num,
						roomuse_status);
			}
		}

		function startnstop_init(id,num,starttime,status) {

			if(status=="on"){
				check_arr[num]=false;
				}
			
			if (!check_arr[num]) {
				check_arr[num] = true;
			
			if (!check[num]) {
				check[num] = true;
				time_start(starttime, num);
				/* 테스트용 */
				var order_status = "unavail";

				document.getElementById('user'+ num).innerHTML = id;
				document.getElementById('user_status' + num).innerHTML = status;
				document.getElementById('order_status' + num).innerHTML = order_status;
				
			} else {
				check_arr[num] = false;

				var roomuse_id = "없음";
				var roomuse_num = num;
				var roomuse_status = "off";
				
				document.getElementById('user' + num).innerHTML = "대기중";
				document.getElementById('user_time' + num).innerHTML = "00:00:00";
				document.getElementById('user_status' + num).innerHTML = roomuse_status;
				document.getElementById('order_status' + num).innerHTML = "대기중";

			}
		}
		
		function time_start(time, num) {
			//	alert("0");
			if (!check_arr[num]) {

			} else {
				//console.log(time);
				time =parseInt(time)//가끔 여기서 사용된 파라미터가 string형태로 읽어와져서 형변환을 한번해준다.

				time += 1;
				hour = Math.floor(time / 3600);
				hour = time_modify(hour);

				minute = Math.floor(time%3600 / 60);
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

			if(time==null){
			time=0;
				}
			
			return time;
		}

		function num_length() {
			var num = 123;
			var str = "123";
			alert("num.toString().length = " + num.toString().length + "\n"
					+ "str.length = " + str.length)
		}
		
		
		function realOrder() {
			$('#realOrderTable').DataTable(
					{ // 페이징 처리, 검색, show entries
						pageLength : 10, //처음 페이지에 처리 개수
						bPaginate : true, // 페이징 기능
						bLengthChange : true,
						lengthMenu : [ [ 10, 20, 30, -1 ],
								[ 10, 20, 30, "All" ] ], //show entries
						bAutoWidth : false,
						processing : true,
						ordering : true,
						serverSide : false,
						searching : true, // 검색 기능
						bStateSave : true,
						"iDisplayLength" : 10,
						"columnDefs" : [ {
							targets : 'no-sort',
							orderable : false
						} ],
						ajax : {
							url : "/realorder/realOrderData.json",
							type : "get",
							dataSrc : '',
						},
						"language": {
						      search: "Search :"
						},
						aoColumns : [
								{
									data : "order_num"
								},
								{ data: "order_time", 
						    		"render": function (data) {
						    			var date = new Date(data); var month = date.getMonth() + 1; 
						    			return  date.getFullYear() + "-" + (month.toString().length > 1 ? month : "0" + month) + "-" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds(); } 
							    },
								{
									data : "order_roomnum"
								},
								{
									data : "order_id"
								},
								{
									data : "product_name"
								},
								{
									data : "order_qty"
								},
								{
									data : "product_price"
								},],
						order : [ [ 0, 'desc' ] ]
					});
			}
			
	$(document).ready(function(){
		$("button[name='chat']").on("click", function() {
			var roomNum = $(this).attr('value');
			window.open("/chat/chatting?room=" + roomNum,"_blank","height=550px, width=800px, left=300px, top=120px, location=no, scrollbars=no, menubar=no, status=no, resizable=no");
		});
		$("#roomClose").on("click", function() {
			method_startnstop(1, "user");
		});

		
	</script>
</body>
</html>