<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출</title>
</head>
<body>
<div class="main-panel">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-md-12 stretch-card">
					<div class="card" style="margin-bottom: 20px;">
						<div class="card-body">
							<p class="card-title">순이익 확인</p>
							<div class="table-responsive">
								<table id="salesTable" class="table table-striped">
									<thead>
										<tr>
											<th>날짜</th>
											<th>상품 총매출</th>
											<th>방 총매출</th>
											<th>손실</th>
											<th>순 이익</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="row">
				<div class="col-md-12 stretch-card">
					<div class="card" style="margin-bottom: 20px;">
						<div class="card-body">
							<p class="card-title">매출 확인</p>
							<div class="form-inline" style="float: right; margin-bottom: 20px;">
								<select name="type" class="form-control">
					     			<option selected value="all">전체</option>
									<option value="roomsales_id">ID별 검색</option>
									<option>날짜별 검색</option>
									<option value="roomsales_num">방 번호별 검색</option>
									<option value="productsales_product">물품별 검색</option>
								 </select>
								 <input type="text" name="keyword" class="form-control" >&nbsp;
					    		 <button type="submit" id="salesSearchBtn" class="btn btn-primary btn-md">검색</button>
							 </div>
							<div class="table-responsive">
								<table id="salesSearchTable" class="table table-striped">
									<thead>
										<tr>
											<th>날짜</th>
											<th>ID</th>
											<th>상품</th>
											<th>상품 매출</th>
											<th>방 번호</th>
											<th>방 매출</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		salesTableinit();
		salesSearchTableinit();
	});
	
	function salesTableinit() {
		$('#salesTable').DataTable(
			{ // 페이징 처리, 검색, show entries
				pageLength : 10, //처음 페이지에 처리 개수
				bPaginate : true, // 페이징 기능
				bLengthChange : true,
				lengthMenu : [ [ 10, 20, 30, -1 ],
						[ 10, 20, 30, "All" ] ], //show entries
				bAutoWidth : false,
				processing : true,
				ordering : true,
				serverSide : false,
				searching : true, // 검색 기능
				bStateSave : true,
				"iDisplayLength" : 10,
				"columnDefs" : [ {
					targets : 'no-sort',
					orderable : false
				} ],
				ajax : {
					url : "/salesstatistics/salesdata.json",
					type : "get",
					dataSrc : '',
				},
				"language": {
				      search: "Search :"
				},
				aoColumns : [
						{
							data : "salestime"
						},
						{
							data : "productsales_order_price"
						},
						{
							data : "roomsales_totalprice"
						},
						{
							data : "loss_pay"
						},
						{
							mRender : function(
									data, type, row) {
								data = row['productsales_order_price']
										+ row['roomsales_totalprice']
										+ row['loss_pay']
								return data;
							}
						} ],
				order : [ [ 0, 'desc' ] ]
			});
	}
	
	
	function salesSearchTableinit(){
		$('#salesSearchTable').DataTable(
			{ // 페이징 처리, 검색, show entries
				pageLength : 10, //처음 페이지에 처리 개수
				bPaginate : true, // 페이징 기능
				bLengthChange : true,
				lengthMenu : [ [ 10, 20, 30, -1 ],
						[ 10, 20, 30, "All" ] ], //show entries
				bAutoWidth : false,
				processing : true,
				ordering : true,
				serverSide : false,
				searching : false, // 검색 기능
				bStateSave : true,
				"iDisplayLength" : 10,
				ajax: {
					url : "/salesstatistics/salesSearchdata.json",
					type : "get",
					dataSrc : '',
				},
				aoColumns : [
					{ data: "roomsales_time", 
			    		"render": function (data) {
			    			var date = new Date(data); var month = date.getMonth() + 1; 
			    			return  date.getFullYear() + "-" + (month.toString().length > 1 ? month : "0" + month) + "-" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds(); } 
				    },
					{
						data : "roomsales_id"
					},
					{
						data : "productsales_product"
					},
					{
						data : "productsales_order_price"
					},
					{
						data : "roomsales_num"
					},
					{
						data : "roomsales_totalprice"
					}
				],
				"columnDefs" : [ {
					targets : 'no-sort',
					orderable : false
				} ],
				
				order : [ [ 0, 'desc' ] ]
			});
	}
	
	function salesSearchTableReset() {
		$('#salesSearchTable').DataTable().clear().draw();
	}
	
	function salesSearchTableData(data) {
		$('#salesSearchTable').DataTable().rows.add(data).draw();
	}
	
	
	$('#salesSearchBtn').click(function(){
		var type = $('select[name=type]').val();      // option value 값
		var keyword = $('input[name=keyword]').val(); // input text 값
		
		$.ajax({
			type: 'get',
		    url: "/salesstatistics/searchsales.json?type="+type+"&keyword="+keyword,
		    success: function(data) {
		    	salesSearchTableReset();
		    	salesSearchTableData(data);
		    }
		});
	});
	
	$('input[name=keyword]').keypress(function(event){
		if (event.which == 13) {/* enter키 코드 13번 */
			$('#salesSearchBtn').click();
			return false;
		}	
	});
	
	
</script>
</html>