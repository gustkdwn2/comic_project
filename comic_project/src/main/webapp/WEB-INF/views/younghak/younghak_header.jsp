<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="content-wrapper">
		<div class="row">
			<div class="col-12 grid-margin stretch-card">
				<div class="card">
					<div class="row">
						<div class="col-md-6">
							<div class="card-body">

								<div class="template-demo"></div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card-body">

		<div class="template-demo">
			<button type="button"
				onclick="javascript:window.location.href='/managerpos/importdetail'"
				class="btn btn-primary btn-rounded btn-fw">수입 상세 검색</button>
			<button type="button"
				onclick="javascript:window.location.href='/managerpos/Managerpos'"
				class="btn btn-danger btn-rounded btn-fw">포스기 화면</button>
			<button type="button"
				onclick="javascript:window.location.href='/managerpos/login'"
				class="btn btn-secondary btn-rounded btn-fw">출퇴근하기</button>
			<button type="button"
				onclick="javascript:window.location.href='/managerpos/Manager_management'"
				class="btn btn-success btn-rounded btn-fw">직원관리</button>
			<button type="button" id="commute"
				class="btn btn-warning btn-rounded btn-fw">오늘 출퇴근</button>
								</div>
							</div>
						</div>
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
				
				<table id="calendar" border="3" align="center"
									style="border-color: #3333FF; width:100%">
									<tr >
					<td align="center"><font size=5 face="굴림체" color="green"
					style="font-weight: bold">사번/이름</td>
					<td align="center"><font size=5 face="굴림체" 
					style="font-weight: bold">출근시간</td>
					<td align="center"><font size=5 face="굴림체"
					style="font-weight: bold">퇴근시간</td>
									</tr>
					<font id="todaycummute"size=5 face="굴림체"
					style="font-weight: lighter">
					</table>
					
						<div class="form-group">
							<label>시급/월급</label> <input type="text"
								class="form-control form-control-lg" name="EMPLOYEE_PAY"
								placeholder="Pay">
						</div>
					</form>
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
	$("#commute").on("click", function() {
		   $("#commuteModal").modal("show");  
		   gettodaycommute(); 
		});

	function gettodaycommute(){
		
		$.ajax({
			url : '/managerpos/gettodaycommute',
			dataType : 'json',
			contentType : "application/json; charset=utf-8;",
			type : 'POST',
			success : function(data) {


				console.log(data);
				/* var text="";
				console.log(data[0]);*/
				var htmlStr ="";
				$.each(data, function(index,list){
					htmlStr+="<tr>";
					htmlStr+="<td>"+list.empnum+"</td>"
					htmlStr+="<td>"+list.starttime+"</td>"
					htmlStr+="<td>"+list.endtime+"</td>"
					htmlStr+="</tr>";
				}); 
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