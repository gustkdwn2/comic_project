<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
								<button data-toggle="modal"
									data-target="#bookRegister" type="button" class="btn btn-secondary" style="margin-bottom: 10px;">책
									등록</button>
								<form onsubmit="return remove();" action="/book/bookRemove" method="post">
									<table id="lossTable" class="table  table-striped">
										<thead>
											<tr>
												<th>책이름</th>
												<th>책위치</th>
												<th>책출판사</th>
												<th>책 저자</th>
												<th>책 소개</th>
												<th>책 분류</th>
												<th>마지막권</th>
												<th>연재상태</th>
												<th class="no-sort"></th>
											</tr>
										</thead>
	
										<c:forEach items="${bookList}" var="book">
											<tr>
												<td><a
													href='/book/bookGet?book_name=<c:out value="${book.book_name}" />'><c:out
															value="${book.book_name}" /></a></td>
												<td><c:out value="${book.book_loc}" /></td>
												<td><c:out value="${book.book_publisher}" /></td>
												<td><c:out value="${book.book_writer}" /></td>
												<td><c:out value="${book.book_content}" /></td>
												<td><c:out value="${book.book_category}" /></td>
												<td><c:out value="${book.book_lastbook}" /></td>
												<td><c:out value="${book.book_status}" /></td>
												<td><button name="removeBtn" value="${book.book_name}" type="submit" class="btn btn-danger">삭제</button></td>
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
	
	<jsp:include page="bookRegisterModal.jsp" />
</body>
<script type="text/javascript">

	$(document).ready(function() {
		
		$('#lossTable').DataTable({ // 페이징 처리, 검색, show entries
	    	pageLength: 10,
	        bPaginate: true,
	        bLengthChange: true,
	        lengthMenu : [ [ 10, 20, 30, -1 ], [ 10, 20, 30, "All" ] ],
	        bAutoWidth: false,
	        processing: true,
	        ordering: true,
	        serverSide: false,
	        searching: true,
	        bStateSave: true,
	        "iDisplayLength": 10,
	        "language": {
	          search: "Search :"
	        },
	        "columnDefs" : [{
				targets : 'no-sort',
				orderable : false
			}]
	    });

	});

	function remove() {

		if(!confirm("삭제 하시겠습니까?")){
			return false;
		}
		return true;
	}
	
</script>
</html>