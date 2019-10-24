<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- The ProductOrderGet Modal -->
<div class="modal" id="adminproductBillModal">
	<div class="modal-dialog" id="product-bill-modal-dialog">
		<div class="modal-content" align="center" id="product-bill-modal-content">

			<!-- Modal body -->
				<div class="card" id="product-bill-card">
					<div class="card-body" id="product-bill-card-body" style="height: 650px;">
						<div class="table-responsive pt-3" style="text-align: center;" >
							<h2>상품 주문 상세 내역<button type="button" class="btn btn-warning" style="float: right;"><font style="color:white;">알림</font></button></h2>
							
							<table id="productBillTable" class="table" style="margin-top: 30px; height: 400px;">
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
							<button id="adminproductBillModalCloseBtn" 
							       type="button" class="btn btn-secondary">닫기</button>	
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
<!-- End ProductOrderGet Modal -->

<script type="text/javascript">
	
	$("#adminproductBillModalCloseBtn").click(function() {
		$("#product-bill-card-body").scrollTop(0);
		$("#adminproductBillModal").hide();
	});
	
</script>

<style>

table, thead{
border:3px solid #cdcdce;

}

tr, td, th{
border:1px solid #cdcdce;
}

#product-bill-modal-dialog{
  overflow-y: initial !important
  position: absolute;
  top: 37%;
  left: 8%;
  transform: translate(-50%, -50%) !important;
}
#product-bill-card-body{
	height: 800px;
    width: 700px;
    overflow-y: auto;
}
#product-bill-card {
	width: 700px;
}
#product-bill-modal-body, #product-bill-modal-content{
	width: 700px;
}
</style>