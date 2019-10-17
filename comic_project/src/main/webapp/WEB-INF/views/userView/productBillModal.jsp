<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- The ProductOrderGet Modal -->
<div class="modal" id="productBillModal">
	<div class="modal-dialog">
		<div class="modal-content" align="center">

			<!-- Modal body -->
			<div class="modal-body">
				<div class="card">
					<div class="card-body">
						<div class="table-responsive pt-3">
							<table class="table table-bordered">
								<thead>
									<tr>
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
								<tbody>
									<tr>
										<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
										1
										</font></font></td>
										<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
										허먼 벡
										</font></font></td>
										<td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
										허먼 벡
										</font></font></td>
									</tr>
								</tbody>
							</table>
							<button id="productBillModalCloseBtn" type="button" class="btn btn-success">닫기</button>
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
		$("#productBillModal").hide();
	});
	
</script>