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
	<div class="col-md-6 grid-margin stretch-card" style="margin-left: 300px; margin-top: 30px;">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">
					<font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">책 수정</font></font>
				</h4>
				<form onsubmit="return check();" class="forms-sample" action="/book/bookModify" method="post">
					<div class="form-group">
						<label for="exampleInputUsername1">
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">책이름</font></font>
						</label><input name="book_name" readonly="readonly" class="form-control" value="<c:out value="${book.book_name}" />">
					</div>
					<div class="form-group">
						<label for="exampleInputUsername1">
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">책위치</font></font>
						</label>
						<input id="book_loc" name="book_loc" type="text" class="form-control" value="<c:out value="${book.book_loc}" />" required>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">책출판사</font></font>
						</label>
						<input id="book_publisher" name="book_publisher" type="text" class="form-control" value="<c:out value="${book.book_publisher}" />" required>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">책 저자</font></font>
						</label>
						<input id="book_writer" name="book_writer" type="text" class="form-control" value="<c:out value="${book.book_writer}" />" required>
					</div>
					<div class="form-group">
						<label for="exampleInputConfirmPassword1">
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">책 소개</font></font>
						</label>
						<textarea name="book_content" class="form-control" rows="20"><c:out value="${book.book_content}" /></textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">책 분류</font></font>
						</label>
						<input id="book_category" name="book_category" type="text" class="form-control" value="<c:out value="${book.book_category}" />" required>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">마지막권</font></font>
						</label>
						<input name="book_lastbook" type="number" class="form-control" value="<c:out value="${book.book_lastbook}" />" required>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">연재상태</font></font>
						</label>
						<select id="book_status" class="form-control" name="book_status" >
							<option value="${book.book_status}" hidden>
								<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${book.book_status}</font></font>
							</option>
		                	<option value="연재중"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">연재중</font></font></option>
		                	<option value="완결"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">완결</font></font></option>
	                	</select>
					</div>
					<div class="form-group" align="center">
						<button type="submit" class="btn btn-info">수정</button>
						<button id="listBtn" type="button" class="btn btn-success">목록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('#listBtn').click(function() {
			self.location = "/book/bookList";
		});
		
	});

	function check() {
		
		if($.trim($("#book_loc").val()) != $("#book_loc").val()) {
		      alert("앞,뒤 공백을 지워주세요.");
		      $("#book_loc").val("");
		      $("#book_loc").focus();
		      return false;
		}
		if($.trim($("#book_publisher").val()) != $("#book_publisher").val()) {
		      alert("앞,뒤 공백을 지워주세요.");
		      $("#book_publisher").val("");
		      $("#book_publisher").focus();
		      return false;
		}
		if($.trim($("#book_writer").val()) != $("#book_writer").val()) {
		      alert("앞,뒤 공백을 지워주세요.");
		      $("#book_writer").val("");
		      $("#book_writer").focus();
		      return false;
		}
		if($.trim($("#book_category").val()) != $("#book_category").val()) {
		      alert("앞,뒤 공백을 지워주세요.");
		      $("#book_category").val("");
		      $("#book_category").focus();
		      return false;
		}
		return true;
	}
		
</script>
</html>