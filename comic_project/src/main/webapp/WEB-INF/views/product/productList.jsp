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
							<div class="table-responsive" style="overflow: hidden;">
								<button style="margin-bottom: 10px;" data-toggle="modal" data-target="#productRegister" type="button"
									class="btn btn-secondary">상품 등록</button>
								<button id="orderBtn" style="margin-bottom: 10px;" type="button"
									class="btn btn-warning">상품 발주</button>
								<form onsubmit="return remove();" action="/product/productRemove" method="post">
									<table id="productTable" class="table  table-striped">
										<thead>
											<tr>
												<th>상품 번호</th>
												<th>상품 이름</th>
												<th>상품 판매가</th>
												<th>상품 수량</th>
												<th>상품 종류</th>
												<td class="no-sort"></td>
											</tr>
										</thead>
	
										<c:forEach items="${productList}" var="product">
											<tr>
												<td><c:out value="${product.product_num}" /></td>
												<td>
													<a href='/product/productGet?product_num=<c:out value="${product.product_num}" />'><c:out
													value="${product.product_name}" /></a>
												</td>
												<td><c:out value="${product.product_price}" /></td>
												<td><c:out value="${product.product_qty}" /></td>
												<td><c:out value="${product.product_category}" /></td>
												<td>
													<button name="getBtn" value="${product.product_num}" type="button" class="btn btn-info">수정</button>
													<button name="removeBtn" value="${product.product_num}" type="submit" class="btn btn-danger">삭제</button>
												</td>
											</tr>
										</c:forEach>
	
									</table>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="productRegisterModal.jsp" />
	<jsp:include page="productGetModal.jsp" />
</body>
<script type="text/javascript">

	$(document).ready(function() {

		$('#lossTable').DataTable({ // 페이징 처리, 검색, show entries
	    	pageLength: 10, //처음 페이지에 처리 개수
	        bPaginate: true, // 페이징 기능
	        bLengthChange: true,
	        lengthMenu : [ [ 10, 20, 30, -1 ], [ 10, 20, 30, "All" ] ], //show entries
	        bAutoWidth: false,
	        processing: true,
	        ordering: true,
	        serverSide: false,
	        searching: true, // 검색 기능
	        bStateSave: true, // 이전페이지 저장
	        "iDisplayLength": 10,
	        "language": {
	          search: "Search :"
	        },
	        "columnDefs" : [{
				targets : 'no-sort',
				orderable : false
			}]
	    });

		$('button[name=getBtn]').click(function(){
	    	var product_num = $(this).attr('value');	
	    	
	    	$.ajax({
	    	    type: 'get',
	    	    url: "/product/productGet?product_num="+product_num,
	    	    dataType : "json",
	    	    success: function(data) {
		    	    
	    	    	$('#product_num').attr('value',data.product_num);
	    	    	$('#product_name').attr('value',data.product_name);
	    	    	$('#product_price').attr('value',data.product_price);
	    	    	$('#product_qty').attr('value',data.product_qty);
	    	    	$('#product_category').attr('value',data.product_category);
	    	    	$('#productGet').show();
	    	    	
	    	    }
	    	});
	    });


		$('#orderBtn').click(function() {
			self.location = "/productOrder/productOrderList";
		});
		
	});

	function remove() {

		if(!confirm("삭제 하시겠습니까?")){
			return false;
		}
		return true;
	}
	
</script>
</html>