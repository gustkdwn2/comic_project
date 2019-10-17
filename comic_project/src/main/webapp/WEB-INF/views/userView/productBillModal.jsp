<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- The ProductOrderGet Modal -->
<div class="modal" id="productBillModal">
	<div class="modal-dialog" id="product-bill-modal-dialog">
		<div class="modal-content" align="center" id="product-bill-modal-content">

			<!-- Modal body -->
			<div class="modal-body" id="product-bill-modal-body">
				<div class="card" id="product-bill-card">
					<div class="card-body" id="product-bill-card-body">
						<div class="table-responsive pt-3">
							<table id="productBillTable" class="table table-bordered">
								<thead>
									<tr>
										<th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
										주문 시간
										</font></font></th>
										<th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
										상품 이름
										</font></font></th>
										<th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
										상품 갯수
										</font></font></th>
										<th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
										상품 가격
										</font></font></th>
									</tr>
								</thead>
								<tbody id="productBillTbody">
									<tr>
										
									</tr>
								</tbody>
							</table><br/>
							<button id="productBillModalCloseBtn" type="button" class="btn btn-warning"><font style="color:white;">닫기</font></button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- End ProductOrderGet Modal -->

<script type="text/javascript">
	
	$("#productBillModalCloseBtn").click(function() {
		$("#product-bill-card-body").scrollTop(0);
		$("#productBillModal").hide();
	});
	
</script>

<style>
#product-bill-modal-dialog{
  overflow-y: initial !important
  position: absolute;
  top: 30%;
  left: 0%;
  transform: translate(-50%, -50%) !important;
}

#product-bill-card-body{
	height: 400px;
    width: 900px;
    overflow-y: auto;
}
#product-bill-card {
	width: 900px;
}

#product-bill-modal-body, #product-bill-modal-content{
	width: 1000px;
}
</style>