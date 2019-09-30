<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/style.css">
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
							<p class="card-title">상품 발주</p>
							<div class="table-responsive">
								<table id="lossTable" class="table  table-striped">
									<thead>
										<tr>
											<th>발주 번호</th>
											<th>상품 번호</th>
											<th>발주 구매가</th>
											<th>발주 수량</th>
											<th>발주 날짜</th>
										</tr>
									</thead>

									<c:forEach items="${productOrderList}" var="productOrder">
										<tr>
											<td><c:out value="${productOrder.productOrder_num}" /></td>
											<td>
												<a href='/product/productGet?product_num=<c:out value="${productOrder.productOrder_num}" />'><c:out
												value="${productOrder.productOrder_product_num}" /></a>
											</td>
											<td><c:out value="${productOrder.productOrder_cost}" /></td>
											<td><c:out value="${productOrder.productOrder_qty}" /></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd" value="${productOrder.productOrder_date}" /></td>
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
<script type="text/javascript">
	$(document).ready(function() {

		$('#lossTable').DataTable({ // 페이징 처리, 검색, show entries
			pageLength : 10,
			bPaginate : true,
			bLengthChange : true,
			lengthMenu : [ [ 10, 20, 30, -1 ], [ 10, 20, 30, "All" ] ],
			bAutoWidth : false,
			processing : true,
			ordering : true,
			serverSide : false,
			searching : true,
			bStateSave : true,
			"iDisplayLength" : 10,
			"language" : {
				search : "Search : "
			},
		});
		
	});
</script>
</html>