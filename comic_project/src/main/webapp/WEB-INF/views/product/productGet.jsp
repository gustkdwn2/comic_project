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
<title>상품 재고 수정</title>
</head>
<body>
	<div class="col-md-6 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">
					<font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">상품 수정</font></font>
				</h4>
				<form class="forms-sample" action="/product/productModify.co" method="post">
					<div class="form-group">
						<label for="exampleInputUsername1"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">상품 번호</font></font></label> <input name="product_num" readonly="readonly"
							class="form-control"
							value="<c:out value="${product.product_num}" />">
					</div>
					<div class="form-group">
						<label for="exampleInputUsername1"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">상품 이름</font></font></label> <input name="product_name" type="text"
							class="form-control"
							value="<c:out value="${product.product_name}" />">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">상품 판매가</font></font></label> <input name="product_price"
							type="number" class="form-control"
							value="<c:out value="${product.product_price}" />">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">상품 수량</font></font></label> <input name="product_qty"
							type="number" class="form-control"
							value="<c:out value="${product.product_qty}" />">
					</div>
					<div class="form-group">
						<label for="exampleInputConfirmPassword1"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">상품 종류</font></font></label> <input name="product_category"
							class="form-control"
							value="<c:out value="${product.product_category}" />">
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
				formObj.attr("action", "/product/productRemove.co");
			} else if(operation == 'list') {
				self.location = "/product/productList.co";
				return;
			}
			
			formObj.submit();
			
		});
		
	});
</script>
</html>