<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 재고</title>
</head>
<body>
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-md-12 stretch-card">
					<div class="card">
						<div class="card-body">
							<p class="card-title">책 재고</p>
							<div class="table-responsive" style="overflow: hidden;">
								<button data-toggle="modal" data-target="#bookRegister" type="button" class="btn btn-secondary" 
								style="margin-bottom: 10px;" data-backdrop="static" data-keyboard="false">책 등록</button>
								
								<table id="bookTable" class="table  table-striped">
									<thead>
										<tr>
											<th>책이름</th>
											<th>책위치</th>
											<th>책출판사</th>
											<th>책 저자</th>
											<th style="width: 10px;">책 소개</th>
											<th>책 분류</th>
											<th>마지막권</th>
											<th>연재상태</th>
											<th class="no-sort">수정/삭제</th>
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
	
	<jsp:include page="bookRegisterModal.jsp" />
	<%-- <jsp:include page="bookGetModal.jsp" /> --%>
	<script src="/resources/js/bookTable.js"></script>
</body>
<!-- <script type="text/javascript">

	function remove() {

		if(!confirm("삭제 하시겠습니까?")){
			return false;
		}
		return true;
	}
	
</script> -->
</html>