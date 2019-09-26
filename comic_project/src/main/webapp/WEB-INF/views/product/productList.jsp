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
								<button style="margin-bottom: 10px;" id="registerBtn"
									data-toggle="modal" type="button" class="btn btn-secondary">상품
									등록</button>
								<button data-toggle="modal" data-target="#myModal" style="margin-bottom: 10px;" type="button" class="btn btn-warning">상품 발주</button>
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
	<!-- The Modal -->
	<div class="modal" id="myModal" align="center">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h3 class="modal-title">상품 발주</h3>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <div class="card-body" align="center">
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
					<button type="button" data-dismiss="modal" class="btn btn-success">닫기</button>
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

		$("#registerBtn").click(function() {

			self.location = "/product/productRegister";

		});
		
	});
</script>
</html>