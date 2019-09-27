<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
									<input type="text" class="form-control" name="product_category">
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