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
<title>상품 재고 수정</title>
</head>
<body>
	<div class="col-md-6 grid-margin stretch-card" style="margin-left: 300px; margin-top: 30px;">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">
					<font style="vertical-align: inherit;">상품 수정</font>
				</h4>
				<form onsubmit="return check();" class="forms-sample" action="/product/productModify" method="post" autocomplete="off">
					<div class="form-group">
						<label for="exampleInputUsername1">
							<font style="vertical-align: inherit;">상품 번호</font>
						</label>
						<input name="product_num" readonly="readonly" class="form-control" value="<c:out value="${product.product_num}" />">
					</div>
					<div class="form-group">
						<label for="exampleInputUsername1">
							<font style="vertical-align: inherit;">상품 이름</font>
						</label>
						<input name="product_name" readonly="readonly" type="text" class="form-control" value="<c:out value="${product.product_name}" />" required>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">
							<font style="vertical-align: inherit;">상품 판매가</font>
						</label>
						<input name="product_price" type="number" class="form-control" value="<c:out value="${product.product_price}" />" required>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">
							<font style="vertical-align: inherit;">상품 수량</font>
						</label>
						<input name="product_qty" type="number" class="form-control" value="<c:out value="${product.product_qty}" />" required>
					</div>
					<div class="form-group">
						<label for="exampleInputConfirmPassword1">
							<font style="vertical-align: inherit;">상품 종류</font>
						</label>
						<input id="product_category" name="product_category" class="form-control" value="<c:out value="${product.product_category}" />" required>
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
			self.location = "/product/productList";
		});
		
	});
		
	function check() {
			
		if($.trim($("#product_category").val()) != $("#product_category").val()) {
			alert("앞,뒤 공백을 지워주세요.");
			$("#product_category").val("");
			$("#product_category").focus();
			return false;
		}
		return true;
			
	}

</script>
</html>