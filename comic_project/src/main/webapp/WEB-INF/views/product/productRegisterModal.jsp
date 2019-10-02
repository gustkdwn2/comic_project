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
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상품 재고 등록</font></font>
						</h4>
						<p class="card-description">
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font>
						</p>
						<form onsubmit="return check();" class="forms-sample" action="/product/productRegister" method="post" autocomplete="off">
							<div class="form-group row">
								<label for="exampleInputUsername2" class="col-sm-3 col-form-label">
									<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상품 이름</font></font>
								</label>
								<div class="col-sm-9">
									<input id="product_name" type="text" class="form-control" name="product_name" required>
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputEmail2" class="col-sm-3 col-form-label">
									<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상품 판매가</font></font>
								</label>
								<div class="col-sm-9">
									<input type="number" class="form-control" name="product_price" required>
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputMobile" class="col-sm-3 col-form-label">
									<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상품 수량</font></font>
								</label>
								<div class="col-sm-9">
									<input type="number" class="form-control" name="product_qty" required>
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputPassword2" class="col-sm-3 col-form-label">
									<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">상품 종류</font></font>
								</label>
								<div class="col-sm-9">
									<input id="product_category" type="text" class="form-control" name="product_category" required>
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
	
	function check() {
		
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
		
		if($.trim($("#product_name").val()) != $("#product_name").val()) {
		      alert("앞,뒤 공백을 지워주세요.");
		      $("#product_name").val("");
		      $("#product_name").focus();
		      return false;
		}
		if(nameCheck > 0) {
			alert("이미 있는 상품입니다.");
			 $("#product_name").val("");
		     $("#product_name").focus();
		     return false;
		}
		if($.trim($("#product_category").val()) != $("#product_category").val()) {
		      alert("앞,뒤 공백을 지워주세요.");
		      $("#product_category").val("");
		      $("#product_category").focus();
		      return false;
		}
		return true;
		
	}
	
</script>