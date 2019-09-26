<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/inhostyle.css">
<meta charset="UTF-8">
<title>재고 정산</title>
</head>
<body>
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-md-12 stretch-card">
					<div class="card">
						<div class="card-body">
							<p class="card-title">재고 확인</p>
							<div class="table-responsive">
								<table id="recent-purchases-listing"
									class="table  table-striped">
									<thead>
										<tr>
											<th>상품번호</th>
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
												<td><input type="text" class="currentqty" name="curqty"
													size="10"></td>
												<td><div id="a${settle.product_num-1}" name="a"></div></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div>
									<button id="btn1">오차확인</button>
									<button id="btn2">재고정산</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<p style="text-align: center; line-height: 3.5;">
				<span style="font-size: 14pt;"><b><span
						style="font-size: 24pt;">재고 변경</span></b></span>
			</p>
			<p style="text-align: center; line-height: 1.5;">
				<br />
			</p>
			<table>
				<c:forEach items="${settleList}" var="settle">
					<tr>
						<td>	
							<input type="hidden" value="${settle.product_num }" name="productNum">
							${settle.product_name }</td>
						<td>${settle.product_qty }-></td>
						<td><div id="b${settle.product_num-1}"></div></td>
					</tr>
				</c:forEach>
			</table>
			
			<p style="text-align: center; line-height: 1.5;">
				<br />
			</p>
			<div
				style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
				onclick="modify_product();">
				<span class="pop_bt" style="font-size: 13pt;"> 변경하기 </span>
			</div>
			<div
				style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
				onClick="close_pop();">
				<span class="pop_bt" style="font-size: 13pt;"> 닫기 </span>
			</div>
		</div>

	</div>
	<!--End Modal-->



	<script>
		$('#btn1').click(function() { // .blur() : focusout
			var list = new Array();
			$("input[name=curqty]").each(function(index, item) {
				list.push($(item).val());//push 데이터 넣기
			});
			console.log(list);
			var sendData = {
				'list' : list
			};
			$.ajax({
				url : 'http://localhost:8080/settlement/list.co',
				dataType : 'json',
				data : JSON.stringify(sendData),
				contentType : "application/json; charset=utf-8;",
				type : 'POST',
				success : function(data) {
					console.log("성공");
					for (var i = 0; i < Object.keys(data).length; i++) {
						$('#' + 'a' + i.toString()).html(data[i]);
						if (data[i] > 0) {
							$('#' + 'a' + i.toString()).css("color", "blue");
						} else if (data[i] < 0) {
							$('#' + 'a' + i.toString()).css("color", "red");
						} else {
							$('#' + 'a' + i.toString()).css("color", "black");
						}
					}
				},
				error : function(data) {
					console.log("실패");
				}
			});
		});

		$('#btn2').click(function() {
			var list = new Array();
			$("input[name=curqty]").each(function(index, item) {
				list.push($(item).val());
			});
			for (var i = 0; i < list.length; i++) {
				$('#' + 'b' + i.toString()).html(list[i]);
			}
			$('#myModal').show();
		});

		function close_pop() {
			$('#myModal').hide();

		};

		function modify_product() {
			var numList = new Array();
			var productList = new Array();
			$("input[name=productNum]").each(function(index, item) {
				numList.push($(item).val());
			});
			
			$("input[name=curqty]").each(function(index, item) {
				productList.push($(item).val());
			});
			
			console.log(numList);
			console.log(productList);
			
			var form = document.createElement("form"); // form을 만듬
			form.setAttribute("charset","UTF-8");
			form.setAttribute("method","Post");
			form.setAttribute("action","modify.co");
			document.body.appendChild(form);//body에 form을 넣음
			
			
			var hiddenInput = document.createElement("input");
			hiddenInput.setAttribute("type","hidden");
			hiddenInput.setAttribute("name","numList");
			hiddenInput.setAttribute("value",numList);
			/* <input type hidden name numList value ${numList}> */
			var hiddenInput2 = document.createElement("input");
			hiddenInput2.setAttribute("type","hidden");
			hiddenInput2.setAttribute("name","productList");
			hiddenInput2.setAttribute("value",productList);
			form.appendChild(hiddenInput);
			form.appendChild(hiddenInput2);
			
			form.submit();
			
			
			$('#myModal').hide();
		}
	</script>
</body>
</html>