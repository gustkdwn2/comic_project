<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- The ProductRegister Modal -->
<div class="modal" id="productOrderRegister">
	<div class="modal-dialog">
		<div class="modal-content" align="center">

			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title">발주 등록</h3>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">발주 등록</font></font>
						</h4>
						<p class="card-description">
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font>
						</p>
						<form class="forms-sample" action="/product/productOrderRegister" method="post" autocomplete="off">
							<div class="form-group row">
								<label for="exampleInputUsername2" class="col-sm-3 col-form-label">
									<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상품 이름</font></font>
								</label>
								<div class="col-sm-9">
									<select id="productOrder_product_name" class="form-control" name="productOrder_product_name">
		                            	<c:forEach items="${productList}" var="productList">
		                            		<option value="${productList.product_name}">
		                            			<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${productList.product_name}</font></font>
		                            		</option>
		                            	</c:forEach>
	                            	</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputEmail2" class="col-sm-3 col-form-label">
									<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">발주 구매가</font></font>
								</label>
								<div class="col-sm-9">
									<input type="number" class="form-control" name="productOrder_cost" required>
								</div>
							</div>
								<div class="form-group row">
								<label for="exampleInputEmail2" class="col-sm-3 col-form-label">
									<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">발주 수량</font></font>
								</label>
								<div class="col-sm-9">
									<input type="number" class="form-control" name="productOrder_qty" required>
								</div>
							</div>
							<button type="submit" class="btn btn-primary mr-2">
								<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">등록</font></font>
							</button>
							<button data-dismiss="modal" type="button" class="btn btn-success">닫기</button>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- End ProductRegister Modal -->
<script type="text/javascript">
	
	/* function check() {
		
		var product_name = $('#product_name').val();
		var nameCheck = 0;
		
		$.ajax({
			type : 'POST',
			data : {product_name : product_name},
			async: false,
			url : "/product/productNameCheck",
			dataType : "json",
			success : function(result) {

				nameCheck = result;

				return;
			}
		});
		
	} */
	
</script>