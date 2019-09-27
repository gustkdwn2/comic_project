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
							<div class="table-responsive">
								<button data-toggle="modal"
									data-target="#bookRegister" type="button" class="btn btn-secondary" style="margin-bottom: 10px;">책
									등록</button>
								<table id="lossTable"
									class="table  table-striped">

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
										</tr>
									</c:forEach>

								</table>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- The BookRegister Modal -->
	<div class="modal" id="bookRegister">
		<div class="modal-dialog">
			<div class="modal-content" align="center">

				<!-- Modal Header -->
				<div class="modal-header">
					<h3 class="modal-title">책 등록</h3>
				</div>

				<!-- Modal body -->
				<div class="card">
					<div class="card-body" align="center">
						<h4 class="card-title">
							<font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">책 재고 등록</font></font>
						</h4>
						<p class="card-description">
							<font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;"></font></font>
						</p>
						<form class="forms-sample" action="/book/bookRegister"
							method="post" autocomplete="off">
							<div class="form-group row">
								<label for="exampleInputUsername2" class="col-sm-3 col-form-label"><font
									style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">책 이름</font></font></label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="book_name">
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputEmail2" class="col-sm-3 col-form-label"><font
									style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">책위치</font></font></label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="book_loc">
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputMobile" class="col-sm-3 col-form-label"><font
									style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">책출판사</font></font></label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="book_publisher">
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputPassword2" class="col-sm-3 col-form-label"><font
									style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">책 저자</font></font></label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="book_writer">
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputPassword2" class="col-sm-3 col-form-label"><font
									style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">책 소개</font></font></label>
								<div class="col-sm-9">
									<textarea class="form-control" rows="20" name="book_content" ></textarea>
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputPassword2" class="col-sm-3 col-form-label"><font
									style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">책 분류</font></font></label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="book_category">
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputPassword2" class="col-sm-3 col-form-label"><font
									style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">마지막권</font></font></label>
								<div class="col-sm-9">
									<input type="number" class="form-control" name="book_lastbook">
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputPassword2" class="col-sm-3 col-form-label"><font
									style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">연재상태</font></font></label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="book_status">
								</div>
							</div>
							<button type="submit" class="btn btn-primary mr-2">
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">등록</font></font>
							</button>
							<button data-dismiss="modal" type="button" class="btn btn-success">닫기</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- End BookRegister Modal -->
	
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
	    });

	});
</script>
</html>