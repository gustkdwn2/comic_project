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
<title>상품 재고</title>
</head>
<body>
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-md-12 stretch-card">
					<div class="card">
						<div class="card-body">
							<p class="card-title">상품 재고</p>
							<div class="table-responsive">
								<table id="recent-purchases-listing"
									class="table  table-striped">
									<thead>
										<tr>
											<th>상품 번호</th>
											<th>상품 이름</th>
											<th>상품 판매가</th>
											<th>상품 수량</th>
											<th>상품 종류</th>
										</tr>
									</thead>
									
									<c:forEach items="${productList}" var="product">
										<tr>
											<td><c:out value="${product.product_num}" /></td>
											<td><c:out value="${product.product_name}" /></td>
											<td><c:out value="${product.product_price}" /></td>
											<td><c:out value="${product.product_qty}" /></td>
											<td><c:out value="${product.product_category}" /></td>
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

</body>
</html>