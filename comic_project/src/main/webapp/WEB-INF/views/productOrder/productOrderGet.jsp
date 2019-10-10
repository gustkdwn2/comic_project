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
<title>발주 수정</title>
</head>
<body>
	<div class="col-md-6 grid-margin stretch-card" style="margin-left: 300px; margin-top: 30px;">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">
					<font style="vertical-align: inherit;">발주 수정</font>
				</h4>
				<form class="forms-sample" action="/productOrder/productOrderModify" method="post" autocomplete="off">
					<div class="form-group">
						<label for="exampleInputUsername1">
							<font style="vertical-align: inherit;">발주 번호</font>
						</label>
						<input name="productOrder_num" readonly="readonly" class="form-control" value="<c:out value="${productOrder.productOrder_num}" />">
					</div>
					<div class="form-group">
						<label for="exampleInputUsername1">
							<font style="vertical-align: inherit;">상품 이름</font>
						</label>
						<input name="productOrder_product_name" readonly="readonly" class="form-control" value="${productOrder.productOrder_product_name}" required>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">
							<font style="vertical-align: inherit;">발주 구매가</font>
						</label>
						<input name="productOrder_cost" type="number" class="form-control" value="<c:out value="${productOrder.productOrder_cost}" />" required>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">
							<font style="vertical-align: inherit;">발주 수량</font>
						</label>
						<input name="productOrder_qty" type="number" class="form-control" value="<c:out value="${productOrder.productOrder_qty}" />" required>
					</div>
					<div class="form-group">
						<label for="exampleInputConfirmPassword1">
							<font style="vertical-align: inherit;">발주 날짜</font>
						</label>
						<input readonly="readonly" class="form-control" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${productOrder.product_date}" />' required>
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
			self.location = "/productOrder/productOrderList";
		});
		
	});

</script>
</html>