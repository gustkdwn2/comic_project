<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
font {
	font-weight: 500;
	font-size: large;
}
</style>

<!-- The ProductOrderGet Modal -->
<div class="modal" id="paymentModal">
	<div class="modal-dialog">
		<div class="modal-content" align="center" style="border: 3px solid #cdcdce;">

			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title">결제하기</h3>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="card-body">
					<div class="form-group">
						<label> <font
							style="vertical-align: inherit;">상품 요금</font>
						</label><br /> <input id="productpayment" readonly="readonly"
							class="form-control" style="width: 300px; float: left;">
						<button id="paymentBillModalBtn" type="button"
							class="btn btn-warning btn-sm"
							style="float: right; height: 45px;">
							<font style="color: white;">주문 내역</font>
						</button>
					</div>
					<br /> <br />
					<div class="form-group">
						<label> <font
							style="vertical-align: inherit;">방 요금</font>
						</label> <input id="roompayment" readonly="readonly" class="form-control">
					</div>
					<div class="form-group">
						<label> <font
							style="vertical-align: inherit;">전체 요금</font>
						</label> <input id="totalpayment" readonly="readonly" class="form-control">
					</div>
					
					<label> <font style="vertical-align: inherit;">결제 수단</font></label>
					
					<div class="form-group" style="margin-top: 10px;">
						<label style="float: left; font-size: 20px;"><input type="radio" name="opt" style="margin-right: 10px;">카카오 페이</label>
						<label style="font-size: 20px;"><input type="radio" name="opt" style="margin-right: 10px;">네이버 페이</label>
					</div>
					<button id="paymentBtn" type="button"
						class="btn btn-warning" style="float: left;" onclick="location.href='${path}/member/MemberLogout'">
						<font style="color: white;">결제</font>
					</button>
					<button id="paymentModalCloseBtn" type="button"
						class="btn btn-warning" style="float: right;">
						<font style="color: white;">닫기</font>
					</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- End ProductOrderGet Modal -->

<script type="text/javascript">
	$("#paymentModalCloseBtn").click(function() {
		$("#paymentModal").hide();
	});
</script>