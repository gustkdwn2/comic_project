<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/inhostyle.css">
<meta charset="UTF-8">
<title>상품 재고 등록</title>
</head>
<body>
	<div class="col-md-6 grid-margin stretch-card">
		<div class="card">
			<div class="card-body" align="center">
				<h4 class="card-title">
					<font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">상품 재고 등록</font></font>
				</h4>
				<p class="card-description">
					<font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"></font></font>
				</p>
				<form class="forms-sample" action="/stock/productRegister.co"
					method="post">
					<div class="form-group row">
						<label for="exampleInputUsername2" class="col-sm-3 col-form-label"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">상품 이름</font></font></label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="product_name">
						</div>
					</div>
					<div class="form-group row">
						<label for="exampleInputEmail2" class="col-sm-3 col-form-label"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">상품 판매가</font></font></label>
						<div class="col-sm-9">
							<input type="number" class="form-control" name="product_price">
						</div>
					</div>
					<div class="form-group row">
						<label for="exampleInputMobile" class="col-sm-3 col-form-label"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">상품 수량</font></font></label>
						<div class="col-sm-9">
							<input type="number" class="form-control" name="product_qty">
						</div>
					</div>
					<div class="form-group row">
						<label for="exampleInputPassword2" class="col-sm-3 col-form-label"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">상품 종류</font></font></label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="product_category">
						</div>
					</div>
					<div class="form-check form-check-flat form-check-primary">
						<label class="form-check-label"> <input type="checkbox"
							class="form-check-input"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;"></font></font><i class="input-helper"></i></label>
					</div>
					<button type="submit" class="btn btn-primary mr-2">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">등록</font></font>
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

			self.location = "/stock/productList.co";

		});
		
	});
</script>
</html>