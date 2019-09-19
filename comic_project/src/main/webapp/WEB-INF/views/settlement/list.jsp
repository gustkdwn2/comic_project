<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/inhostyle.css">
<title>재고 정산</title>
</head>
<body>
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="inho1">
				<div class="row">
					<div class="col-md-12 stretch-card">
						<div class="card">
							<div class="card-body">
								<p class="card-title">재고 정산</p>
								<div class="table-responsive">
									<table id="recent-purchases-listing" class="table table-striped">
										<thead>
											<tr>
												<th>번호</th>
												<th>종류</th>
												<th>상품명</th>
												<th>재고수량</th>
												<th>실제수량</th>
												<th>오차수량</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${settleList}" var="settle">
											
												<tr>
													<td>${settle.product_num }</td>
													<td>${settle.product_category }</td>
													<td>${settle.product_name }</td>
													<td>${settle.product_qty }</td>
													<td><input type="text" class="currentqty" name="curqty" size="10"></td>
													<td><div id="a${settle.product_num}"></div></td>
												</tr>
											
											</c:forEach>
												<tr><td><button id="btn1" onclick="">확인</button></td></tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	$('#btn1').click(function() {  // .blur() : focusout
		var list = new Array();
		$("input[name=curqty]").each(function(index,item){
			list.push($(item).val());
		});
		var sendData = {
				'list': list
			};
 		$.ajax({
			url : 'http://localhost:8090/settlement/list.co',
			dataType:'json',
			data : JSON.stringify(sendData),
			contentType: "application/json; charset=utf-8;",
			type : 'POST',
			success : function(data) {
				console.log("성공");
				for (var i = 1; i <= Object.keys(data).length; i++) {
					$('#'+'a'+i.toString()).html(data[i-1]);
					if(data[i-1]>0) {
						$('#'+'a'+i.toString()).css("color","blue");
					} else if (data[i-1]<0) {
						$('#'+'a'+i.toString()).css("color","red");
					}
				}
			}, error: function(data) {
				console.log("실패"); 
			}
		});
	});
	
</script>
</body>
</html>