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

.td_y_header {
	width: 100px;
	height: 50px;
	text-align: top;
	font-size: 20px;
	font-family: 굴림;
	font-weight: bold;
	border: 5px border-color:#3333FF;
	border-radius: 8px; /*모서리 둥글게*/
	border-weight: bold;
}


</style>
</head>
<body>

	<div class="content-wrapper">
		<div class="col-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<div class="template-demo">
					
						<button type="button"
							onclick="javascript:window.location.href='/managerpos/Managerpos'"
							class="btn btn-danger btn-rounded btn-fw">포스기 화면</button>
						<button type="button"
							onclick="javascript:window.location.href='/managerpos/login'"
							class="btn btn-secondary btn-rounded btn-fw">출퇴근등록</button>
						
						<c:if test="${sessionScope.EMPPOSITION=='사장'}">
						<button type="button"
							onclick="javascript:window.location.href='/managerpos/Manager_management'"
							class="btn btn-success btn-rounded btn-fw">직원관리</button>
							</c:if>
						<button type="button" id="commute"
							onclick=" <%-- <% session.removeAttribute("EMPID"); %> --%> "
							class="btn btn-warning btn-rounded btn-fw">근태 기록표</button>
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

					<table border=3 
						style="border-color: #3333FF; width: 100%;table-layout:fixed;align:center">
						<tr>
							<td class="td_y_header" align="center">
							<font style="font-weight: bold;size:5;face:굴림체; color:green;">사번/이름</font>
							</td>
							<td class="td_y_header" align="center">
							<font style="font-weight: bold;size:5;face:굴림체; ">출근시간</font>
							</td>
							<td class="td_y_header"  align="center">
							<font style="font-weight: bold;size:5;face:굴림체; ">퇴근시간</font>
							</td>
						</tr>
					</table>
					<font id="todaycummute" style="face:굴림체;"></font>
					
											
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
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
					
					htmlStr += "<table border=3 style=\"border-color: #3333FF;height:51px;width: 100%;table-layout:fixed;align:center\">";
					$.each(data, function(index, list) {
						htmlStr += "<tr>";
						htmlStr += "<td class=\"td_y_header\" align=\"center\">" + list.empnum +"/"+list.empname +"</td>"
						htmlStr += "<td class=\"td_y_header\" align=\"center\">" + list.starttime + "</td>"
						htmlStr += "<td class=\"td_y_header\" align=\"center\">" + list.endtime + "</td>"
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