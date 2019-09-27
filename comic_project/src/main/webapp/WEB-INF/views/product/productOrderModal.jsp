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
						<button type="button" data-dismiss="modal" class="btn btn-success">닫기</button>
					</form>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- End Modal -->