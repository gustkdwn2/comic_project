<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	font-family: "맑은 고딕";
}

/* The grid: Three equal columns that floats next to each other */
.column {
	float: left;
	width: 30.0%;
	padding: 10px;
	/* text-align: center; */
	font-size: 16px;
	cursor: pointer;
	color: #555555;
	margin-left: 10px;
	height: 270px;
	border: 5px solid #b2caff; 
	border-radius: 30px;
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
	height: 80%;
	float: left;
	font-size: 30px;
	text-align: center;
	border-bottom: 5px solid #b2caff; 
	
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
	font-color: #686868;
	border-left: 5px solid #b2caff;
	border-bottom: 5px solid #b2caff; 
	/* //background-size:50%50%; */
	text-align: center-vertical;
}

.div_bottom_2 {
	width: 100%;
	/* height:100px; */
	height: 10%;
	clear: both;

}
</style>

</head>
<body style="overflow: scroll">
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="row">
	
				<%@ include file="./younghak_header.jsp"%>
				
				<div class="col-12 grid-margin stretch-card">
					<div class="card">
						<div class="row">
<div class="col-md-12">
	<div class="card-body">
		<div class="template-demo">
			<div class="row">
			
				<div class="column"">
	<button id ="roomClose">실험용 닫기</button>
	<div class="div_menu">1번방</div>

	<div class="div_con">
		사 용 자 : <font id="user1">없음</font><br> 사용시간 : <font
			id="user_time1">없음</font><br> 사용상태 : <font
			id="user_status1">없음</font><br> 주문상태 : <font
			id="order_status1">없음</font><br>
	</div>

	<div class="div_bottom_2">
		<input type="button" value="주문내역보기" class="btn btn btn-secondary btn-rounded btn-sm" 
				style="height: 40px; width:150px; margin-top:10px; margin-left:20px;"> 
		<input type="button" value="결제하기" class="btn btn btn-secondary btn-rounded btn-sm" 
				style="height: 40px; width:100px; margin: 10px 10px 0 20px;"> 
		<button type="button" value="1" class="btn btn btn-secondary btn-rounded btn-sm" 
				style="height: 40px; width:100px; margin: 10px 10px 0 10px;" name="chat">채팅하기</button>
	</div>

	<!-- </div> -->

</div>

<div class="column">
	<!-- <div class="div_root"> -->

	<div class="div_menu">2번방</div>

	<div class="div_con">
		사 용 자 : <font id="user2">없음</font><br> 사용시간 : <font
			id="user_time2">없음</font><br> 사용상태 : <font
			id="user_status2">없음</font><br> 주문상태 : <font
			id="order_status2">없음</font><br>
	</div>

	<div class="div_bottom_2">
		<input type="button" value="주문내역보기" class="btn btn btn-secondary btn-rounded btn-sm" 
				style="height: 40px; width:150px; margin-top:10px; margin-left:20px;"> 
		<input type="button" value="결제하기" class="btn btn btn-secondary btn-rounded btn-sm" 
				style="height: 40px; width:100px; margin: 10px 10px 0 20px;"> 
		<button type="button" value="2" class="btn btn btn-secondary btn-rounded btn-sm" 
				style="height: 40px; width:100px; margin: 10px 10px 0 10px;" name="chat">채팅하기</button>
	</div>

</div>

<div class="column">
	<!-- <div class="div_root"> -->

		<div class="div_menu">3번방</div>

		<div class="div_con">
			사 용 자 : <font id="user3">없음</font><br> 사용시간 : <font
				id="user_time3">없음</font><br> 사용상태 : <font
				id="user_status3">없음</font><br> 주문상태 : <font
				id="order_status3">없음</font><br>
		</div>

		<div class="div_bottom_2">
		<input type="button" value="주문내역보기" class="btn btn btn-secondary btn-rounded btn-sm" 
				style="height: 40px; width:150px; margin-top:10px; margin-left:20px;"> 
		<input type="button" value="결제하기" class="btn btn btn-secondary btn-rounded btn-sm" 
				style="height: 40px; width:100px; margin: 10px 10px 0 20px;"> 
		<button type="button" value="3" class="btn btn btn-secondary btn-rounded btn-sm" 
				style="height: 40px; width:100px; margin: 10px 10px 0 10px;" name="chat">채팅하기</button>
	</div>

	</div>
</div>
<br>

<div class="row">
	<div class="column">
	<!-- <div class="div_root"> -->

	<div class="div_menu">4번방</div>

	<div class="div_con">
		사 용 자 : <font id="user4">없음</font><br> 사용시간 : <font
			id="user_time4">없음</font><br> 사용상태 : <font
			id="user_status4">없음</font><br> 주문상태 : <font
			id="order_status4">없음</font><br>
	</div>

	<div class="div_bottom_2">
		<input type="button" value="주문내역보기" class="btn btn btn-secondary btn-rounded btn-sm" 
				style="height: 40px; width:150px; margin-top:10px; margin-left:20px;"> 
		<input type="button" value="결제하기" class="btn btn btn-secondary btn-rounded btn-sm" 
				style="height: 40px; width:100px; margin: 10px 10px 0 20px;"> 
		<button type="button" value="4" class="btn btn btn-secondary btn-rounded btn-sm" 
				style="height: 40px; width:100px; margin: 10px 10px 0 10px;" name="chat">채팅하기</button>
	</div>

</div>
<div class="column">
	<!-- <div class="div_root"> -->

	<div class="div_menu">5번방</div>

	<div class="div_con">
		사 용 자 : <font id="user5">없음</font><br> 사용시간 : <font
			id="user_time5">없음</font><br> 사용상태 : <font
			id="user_status5">없음</font><br> 주문상태 : <font
			id="order_status5">없음</font><br>
	</div>
	<div class="div_bottom_2">
		<input type="button" value="주문내역보기" class="btn btn btn-secondary btn-rounded btn-sm" 
				style="height: 40px; width:150px; margin-top:10px; margin-left:20px;"> 
		<input type="button" value="결제하기" class="btn btn btn-secondary btn-rounded btn-sm" 
				style="height: 40px; width:100px; margin: 10px 10px 0 20px;"> 
		<button type="button" value="5" class="btn btn btn-secondary btn-rounded btn-sm" 
				style="height: 40px; width:100px; margin: 10px 10px 0 10px;" name="chat">채팅하기</button>
	</div>

</div>
<div class="column">
	<!-- <div class="div_root"> -->

	<div class="div_menu">6번방</div>

	<div class="div_con">
		사 용 자 : <font id="user6">없음</font><br> 사용시간 : <font
			id="user_time6">없음</font><br> 사용상태 : <font
			id="user_status6">없음</font><br> 주문상태 : <font
			id="order_status6">없음</font><br>
	</div>

	<div class="div_bottom_2">
		<input type="button" value="주문내역보기" class="btn btn btn-secondary btn-rounded btn-sm" 
				style="height: 40px; width:150px; margin-top:10px; margin-left:20px;"> 
		<input type="button" value="결제하기" class="btn btn btn-secondary btn-rounded btn-sm" 
				style="height: 40px; width:100px; margin: 10px 10px 0 20px;"> 
		<button type="button" value="6" class="btn btn btn-secondary btn-rounded btn-sm" 
				style="height: 40px; width:100px; margin: 10px 10px 0 10px;" name="chat">채팅하기</button>
	</div>

				</div>
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
	<!-- main-panel ends -->
	<!-- content-wrapper ends -->
	<!-- partial:../../partials/_footer.html -->


	

	<script>
	//초기화작업
	
	var check_arr = new Array(7); //방의 개수보다 1크게
	
	array_init(check_arr);

	ajaxtogetdb_comic_room_uselist(); 
	//초기화작업
	
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

			if (!check_arr[num]) {
				check_arr[num] = true;
				time_start(0, num);
				
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
			/*console.log("1 방 "+check_arr[0]);
			console.log("2 방 "+check_arr[1]);
			console.log("3 방 " + check_arr[2]);
			console.log("4 방 " + check_arr[3]);
			console.log("5 방 " + check_arr[4]);
			console.log("6 방 " +check_arr[5]);*/
			//console.log("6 방 " +status); 
			//alert(" 방 넘버 : "+  num+"방상태"+status+"방 불리언"+check_arr[num]);
			if(status=="on"){
				check_arr[num]=false;
				}
			
			if (!check_arr[num]) {
				check_arr[num] = true;
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
				//if(time%10==0){					
					
					//setTimeout(function() {
						//ajaxtogetdb_comic_room_uselist();
					//}, 1000)
					//}
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
	</script>
	<!-- 상주 -->
	<script type="text/javascript">
	$(document).ready(function(){
		$("button[name='chat']").on("click", function() {
			var roomNum = $(this).attr('value');
			window.open("/chat/chatting?room=" + roomNum,"_blank","height=550px, width=800px, left=300px, top=120px, location=no, scrollbars=no, menubar=no, status=no, resizable=no");
		});
		$("#roomClose").on("click", function() {
			method_startnstop(1, "user");
		});
	});
	</script>
</body>
</html>