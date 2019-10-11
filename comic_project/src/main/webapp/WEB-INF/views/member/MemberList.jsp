<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/style.css">
<meta charset="UTF-8">
<title>회원 관리</title>
</head>
<body>
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-md-12 stretch-card">
					<div class="card">
						<div class="card-body">
							<p class="card-title">회원 관리</p>
							<div class="table-responsive" style="overflow: hidden;">
								<form action="/member/MemberRemove" method="post">
									<table id="memberTable" class="table  table-striped">
										<thead>
											<tr>
												<th>아이디</th>
												<th>이름</th>
												<th>이메일</th>
												<th>핸드폰번호</th>
												<th class="no-sort">수정/삭제</th>
											</tr>
										</thead>
	
										<c:forEach items="${MembertList}" var="member">
											<tr>
												<td><c:out value="${member.MEMBER_ID}" /></td>
												<td><c:out value="${member.MEMBER_NAME}" /><input type="hidden" name="MEMBER_ID" value="${member.MEMBER_ID}"></td>
												<td><c:out value="${member.MEMBER_EMAIL}" /></td>
												<td><c:out value="${member.MEMBER_PHONE_NUMBER}" /></td>
												<td style="width: 100px">
													<button name="GmodifyBtn" type="button" class="btn btn-info" value="${member.MEMBER_ID}">수정</button>
													<button name="removeBtn" value="${member.MEMBER_ID}" type="submit" class="btn btn-danger">삭제</button>
												</td>
											</tr>
										</c:forEach>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="MemberModifyModal.jsp" />
</body>
<script type="text/javascript">

	$(document).ready(function() {

		$('#memberTable').DataTable({ // 페이징 처리, 검색, show entries
			pageLength : 10,
			bPaginate : true,
			bLengthChange : true,
			lengthMenu : [ [ 10, 20, 30, -1 ], [ 10, 20, 30, "All" ] ],
			bAutoWidth : false,
			processing : true,
			ordering : true,
			serverSide : false,
			searching : true,
			bStateSave : true,
			"iDisplayLength" : 10,
			"language" : {
				search : "Search : "
			},
			"columnDefs": [{
		    	"targets": 'no-sort',
		    	"orderable": false,
		    }]
		});
	});
/* 	
	$('button[name=removeBtn]').click(function(){
    	var MEMBER_ID = $(this).attr('value');
    	var form = document.createElement("form"); // form을 만듬
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post");
		form.setAttribute("action", "/member/MemberRemove");
		document.body.appendChild(form);

		var hiddenInput = document.createElement("input");
		hiddenInput.setAttribute("type", "hidden");
		hiddenInput.setAttribute("name", "MEMBER_ID");
		hiddenInput.setAttribute("value", MEMBER_ID);

		form.appendChild(hiddenInput);

		form.submit();
    });
*/
	$('button[name=GmodifyBtn]').click(function(){
    	var MEMBER_ID = $(this).attr('value');
    	
    	$.ajax({
    	    type: 'get',
    	    url: "/member/MemberModify?MEMBER_ID="+MEMBER_ID,
    	    success: function(data) {
    	    	$('#MEMBER_ID').attr('value',data.getModify['member_ID']);
    	    	$('#MEMBER_NAME').attr('value',data.getModify['member_NAME']);
    	    	$('#MEMBER_EMAIL').attr('value',data.getModify['member_EMAIL']);
    	    	$('#MEMBER_PHONE_NUMBER').attr('value',data.getModify['member_PHONE_NUMBER']);
    	    	$('#MemberModifyModal').show();
    	    }
    	});
    });
	
	$('#modifyclose').click(function(){
    	$('#MemberModifyModal').hide();
    });
	
	$('button[name=removeBtn]').click(function(){

		if(!confirm("삭제 하시겠습니까?")){
			return false;
		}
		return true;
	});
	
</script>
</html>