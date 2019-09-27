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
							<p class="card-title">상품 재고</p>
							<div class="table-responsive">
								<button style="margin-bottom: 10px;" data-toggle="modal"
									data-target="#productRegister" type="button"
									class="btn btn-secondary">상품 등록</button>
								<button data-toggle="modal" data-target="#productOrder"
									style="margin-bottom: 10px;" type="button"
									class="btn btn-warning">상품 발주</button>
								<table id="lossTable" class="table  table-striped">
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
											<td><a
												href='/product/productGet?product_num=<c:out value="${product.product_num}" />'><c:out
														value="${product.product_name}" /></a></td>
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

	<!-- The ProductRegister Modal -->
	<div class="modal" id="productRegister">
		<div class="modal-dialog">
			<div class="modal-content" align="center">

				<!-- Modal Header -->
				<div class="modal-header">
					<h3 class="modal-title">상품 등록</h3>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">상품 재고 등록</font></font>
							</h4>
							<p class="card-description">
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;"></font></font>
							</p>
							<form class="forms-sample" action="/product/productRegister"
								method="post" autocomplete="off">
								<div class="form-group row">
									<label for="exampleInputUsername2"
										class="col-sm-3 col-form-label"><font
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
									<label for="exampleInputPassword2"
										class="col-sm-3 col-form-label"><font
										style="vertical-align: inherit;"><font
											style="vertical-align: inherit;">상품 종류</font></font></label>
									<div class="col-sm-9">
										<input type="text" class="form-control"
											name="product_category">
									</div>
								</div>
								<button type="submit" class="btn btn-primary mr-2">
									<font style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">등록</font></font>
								</button>
								<button data-dismiss="modal" type="button"
									class="btn btn-success">닫기</button>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- End ProductRegister Modal -->

	<!-- The Modal -->
	<div class="modal" id="productOrder">
		<div class="modal-dialog">
			<div class="modal-content" align="center">

				<!-- Modal Header -->
				<div class="modal-header">
					<h3 class="modal-title">상품 발주</h3>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="card-body">
						<form class="forms-sample" action="/product/productOrder"
							method="post" autocomplete="off">
							<div class="form-group row">
								<label for="exampleInputEmail2" class="col-sm-3 col-form-label"><font
									style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">상품 번호</font></font></label>
								<div class="col-sm-9">
									<input type="number" class="form-control"
										name="productOrder_product_num">
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputMobile" class="col-sm-3 col-form-label"><font
									style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">발주 구매가</font></font></label>
								<div class="col-sm-9">
									<input type="number" class="form-control"
										name="productOrder_cost">
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputPassword2"
									class="col-sm-3 col-form-label"><font
									style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">발주 수량</font></font></label>
								<div class="col-sm-9">
									<input type="number" class="form-control"
										name="productOrder_qty">
								</div>
							</div>
							<button type="submit" class="btn btn-primary mr-2">
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">발주</font></font>
							</button>
							<button type="button" data-dismiss="modal"
								class="btn btn-success">닫기</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- End Modal -->
	
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