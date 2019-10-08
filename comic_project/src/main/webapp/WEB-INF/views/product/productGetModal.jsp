<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- The Modal -->
<div class="modal" id="productOrder">
	<div class="modal-dialog">
		<div class="modal-content" align="center">

			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title">상품 발주</h3>
			</div>

			<!-- Modal body -->
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">
						<font style="vertical-align: inherit;">상품 수정</font>
					</h4>
					<form class="forms-sample" action="/product/productModify"
						method="post" autocomplete="off">
						<div class="form-group">
							<label for="exampleInputUsername1"><font
								style="vertical-align: inherit;">상품 번호</font></label> <input
								name="product_num" readonly="readonly" class="form-control"
								value="<c:out value="${product.product_num}" />">
						</div>
						<div class="form-group">
							<label for="exampleInputUsername1"><font
									style="vertical-align: inherit;">상품 이름</font></label> <input
								name="product_name" type="text" class="form-control"
								value="<c:out value="${product.product_name}" />">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1"><font
								style="vertical-align: inherit;">상품 판매가</font></label> <input
								name="product_price" type="number" class="form-control"
								value="<c:out value="${product.product_price}" />">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1"><font
								style="vertical-align: inherit;">상품 수량</font></label> <input
								name="product_qty" type="number" class="form-control"
								value="<c:out value="${product.product_qty}" />">
						</div>
						<div class="form-group">
							<label for="exampleInputConfirmPassword1"><font
								style="vertical-align: inherit;">상품 종류</font></label> <input
								name="product_category" class="form-control"
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
	</div>
</div>
<!-- End Modal -->