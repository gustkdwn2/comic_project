<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<h1>order</h1>

	<div>
		<ul>
			<c:forEach items="${ OrderViewVO_List }" var="list">
				<li><button name="categoryButton" value="${ list.orderview_category }">${ list.orderview_category }</button></li>
			</c:forEach>
		</ul>
	</div>
	<hr>
	<div class="orderProduct">
		
	</div>
	<hr> 주문목록 <br>
	<table>
		<thead>
			<tr>
				<th>상품명</th>
				<th>금액</th>
				<th>수량</th> <!-- + - 기능추가 삭제기능 -->
				<th>취소</th>
			</tr>
		</thead>
		<tbody id="tableBody">
		</tbody>
	</table>
</body>
<script src="/resources/js/order.js?after"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var categoryValue = "";
		var orderProduct = $(".orderProduct");
		
		$("button[name = categoryButton]").on("click", function (e) {
			categoryValue = $(this).attr('value');
			orderProductShow(categoryValue);
		});

		function orderProductShow(category) {
			orderProductService.getList(category, function(data) {
				var str = "";
				
				if(data.length == 0 ) {
					str += " ";
					orderProduct.html(str);
					return;
				}
				str += "<ul>"; 
				for(var i = 0, len = data.length || 0; i < len; i++) {
					str += "<li>";
					str += "<button onclick='userProductBtn'>";
					str += "" + data[i].PRODUCT_NAME + " | 가격: " +data[i].PRODUCT_PRICE;
					str += "</button>";
					str += "</li>";
				}
				str += "</ul>";

				orderProduct.html(str);
			});
		}

		window.userProductBtn = function() {
			console.log("teat");
		};
	
	});
</script>
</html>