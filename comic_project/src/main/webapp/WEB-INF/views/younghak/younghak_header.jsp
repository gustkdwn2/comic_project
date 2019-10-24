<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
table {
	table-layout: fixed;
}

table, tr {
	font-size: medium;
}

.td_y_header {
	text-align: center;
	height: 50px;
	width: 150px;
}
</style>
</head>
<body>

	<div class="content-wrapper" style="height: 150px;">
		<div class="col-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<div class="template-demo">
					
						<button type="button"
							onclick="javascript:window.location.href='/managerpos/Managerpos'"
							class="btn btn-danger btn-rounded btn-fw">포스기 화면</button>
						<button type="button"
							onclick="javascript:window.location.href='/managerpos/login'"
							class="btn btn-secondary btn-rounded btn-fw">출퇴근하기</button>
						
						<c:if test="${sessionScope.EMPPOSITION=='사장'}">
						<button type="button"
							onclick="javascript:window.location.href='/managerpos/Manager_management'"
							class="btn btn-success btn-rounded btn-fw">직원관리</button>
							</c:if>
						<button type="button" id="commute"
							onclick=" <%-- <% session.removeAttribute("EMPID"); %> --%> "
							class="btn btn-warning btn-rounded btn-fw">오늘 출퇴근</button>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div class="modal fade" id="commuteModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="ModalLabel">오늘 출결표</h4>
				</div>
				<div class="modal-body">

					<table style="width: 100%; text-align: center; 	border: 1px solid #dadfe4;">
						<tr>
							<td class="td_y_header"><font>사번/이름</font></td>
							<td class="td_y_header"><font>출근시간</font></td>
							<td class="td_y_header"><font>퇴근시간</font></td>
						</tr>
					</table>
					<div id="todaycummute"></div>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<script>

//	checksession();
	
		$("#commute").on("click", function() {
			$("#commuteModal").modal("show");
			gettodaycommute();
		});
		
		function sessioninvalid(){
			alert("세션삭제");
		
			sessionStorage.removeItem( "EMPID" );

		}
		
		function gettodaycommute() {

			$.ajax({
				url : '/managerpos/gettodaycommute',
				dataType : 'json',
				contentType : "application/json; charset=utf-8;",
				type : 'POST',
				success : function(data) {

					console.log(data);
					/* var text="";
					console.log(data[0]);*/
					var htmlStr = "";
					
					htmlStr += "<table style='width: 100%; text-align:center; border: 1px solid #dadfe4;'>";
					$.each(data, function(index, list) {
						htmlStr += "<tr>";
						htmlStr += "<td class='td_y_header'>" + list.empnum +"/"+list.empname +"</td>"
						htmlStr += "<td class='td_y_header'>" + list.starttime + "</td>"
						htmlStr += "<td class='td_y_header'>" + list.endtime + "</td>"
						htmlStr += "</tr>";
					});
					htmlStr += "</table>";
					$("#todaycummute").html(htmlStr);
					
				},
				error : function(data) {
					console.log("실패");
				}
			});

		}
	</script>



</body>
</html>
