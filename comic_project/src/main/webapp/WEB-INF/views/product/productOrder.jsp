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
<title>상품 발주</title>
</head>
<body>
	<div class="col-md-6 grid-margin stretch-card">
		<div class="card">
			<div class="card-body" align="center">
				<h4 class="card-title">
					<font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">상품 발주</font></font>
				</h4>
				<p class="card-description">
					<font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"></font></font>
				</p>
				<form class="forms-sample" action="/product/productOrder"
					method="post">
					<div class="form-group row">
						<label for="exampleInputEmail2" class="col-sm-3 col-form-label"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">상품 번호</font></font></label>
						<div class="col-sm-9">
							<input type="number" class="form-control" name="productOrder_product_num">
						</div>
					</div>
					<div class="form-group row">
						<label for="exampleInputMobile" class="col-sm-3 col-form-label"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">발주 구매가</font></font></label>
						<div class="col-sm-9">
							<input type="number" class="form-control" name="productOrder_cost">
						</div>
					</div>
					<div class="form-group row">
						<label for="exampleInputPassword2" class="col-sm-3 col-form-label"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">발주 수량</font></font></label>
						<div class="col-sm-9">
							<input type="number" class="form-control" name="productOrder_qty">
						</div>
					</div>
					<div class="form-group row">
						<label for="exampleInputPassword2" class="col-sm-3 col-form-label"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">발주 날짜</font></font></label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="productOrder_date">
						</div>
					</div>
					<button type="submit" class="btn btn-primary mr-2">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">발주</font></font>
					</button>
					<button id="listBtn" type="button" class="btn btn-success">목록</button>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#listBtn").click(function() {

			self.location = "/product/productList";

		});
		
	});
</script>
</html>