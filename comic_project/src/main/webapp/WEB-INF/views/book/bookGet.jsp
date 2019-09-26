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
<title>책 재고 수정</title>
</head>
<body>
	<div class="col-md-6 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">
					<font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">책 수정</font></font>
				</h4>
				<form class="forms-sample" action="/book/bookModify" method="post">
					<div class="form-group">
						<label for="exampleInputUsername1"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">책이름</font></font></label> <input name="book_name" readonly="readonly"
							class="form-control"
							value="<c:out value="${book.book_name}" />">
					</div>
					<div class="form-group">
						<label for="exampleInputUsername1"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">책위치</font></font></label> <input name="book_loc" type="text"
							class="form-control"
							value="<c:out value="${book.book_loc}" />">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">책출판사</font></font></label> <input name="book_publisher"
							type="text" class="form-control"
							value="<c:out value="${book.book_publisher}" />">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">책 저자</font></font></label> <input name="book_writer"
							type="text" class="form-control"
							value="<c:out value="${book.book_writer}" />">
					</div>
					<div class="form-group">
						<label for="exampleInputConfirmPassword1"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">책 소개</font></font></label> <textarea name="book_content"
							class="form-control" rows="20"
							><c:out value="${book.book_content}" /></textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">책 분류</font></font></label> <input name="book_category"
							type="text" class="form-control"
							value="<c:out value="${book.book_category}" />">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">마지막권</font></font></label> <input name="book_lastbook"
							type="number" class="form-control"
							value="<c:out value="${book.book_lastbook}" />">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">연재상태</font></font></label> <input name="book_status"
							type="text" class="form-control"
							value="<c:out value="${book.book_status}" />">
					</div>
					<div class="form-group" align="center">
						<button type="submit" data-oper='modify' class="btn btn-info">수정</button>
						<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
						<button type="submit" data-oper='list' class="btn btn-success">목록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		
		var formObj = $("form");
		
		$('button').click(function(e) {
			
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			if(operation == 'remove') {
				formObj.attr("action", "/book/bookRemove");
			} else if(operation == 'list') {
				self.location = "/book/bookList";
				return;
			}
			
			formObj.submit();
			
		});
		
	});
</script>
</html>