<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/userHeader.jsp"%>

<style type="text/css">
body {
	background-image: url("/resources/images/bg-masthead.jpg");
	background-size: cover;
}

.content-wrapper {
	padding-top: 30px;
}

.btn {
	margin: 10px;
}

.orderProduct{
	text-align: center;
}
#orderTest {
	padding-top: 10px;	
	padding-bottom: 10px;
	text-align: center;
}
.container {
	background-color: #F2D68A;
}

h2 {
	padding-top:15px;
	color: #F3F2EC; 
}

table {
	width: 100%;
	border-top: 1px solid #C49F7B;
	border-collapse: collapse;
}
th, td {
	border-bottom: #C49F7B;
	padding: 10px;
	text-align: center;
}

th {
	background-color: #F0C03D;
}

td {

}
</style>
<body>

	<!-- Header -->
	<div class="main-penal">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-md-2 text-center">
					<h1>${ roomNum }번방</h1>
					<p>시간</p>
				</div>
			</div>
			<div class="container">
				<div class="content-section-heading text-center">
					<h2 class="mb-5">상품 주문</h2>
				</div>
				<div class="row no-gutters">
					<div>
						<span> 
						<c:forEach items="${ OrderViewVO_List }" var="list">
							<button class="btn btn-secondary btn-rounded btn-fw" name="categoryButton" value="${ list.orderview_category }">${ list.orderview_category }</button>
						</c:forEach>
						</span>
					</div>
				</div>
				<div class="orderProduct"></div>
				<div class="row">
					<div class="col-md-6">
						주문목록 <br>
						<table>
							<thead>
								<tr>
									<th>상품명</th>
									<th>금액</th>
									<th>수량</th>
									<th>취소</th>
								</tr>
							</thead>
							<tbody id="tableBody">
							</tbody>
						</table>
					</div>
					<div class="col-md-6">
						<label>총금액</label> <input id="finalPrice" readonly> <label>총수량</label> <input id="orderQty" readonly>
						<button onclick="productAllDelete();">전체취소</button>
						<button id="resultOrder">상품주문</button>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- hidden form -->
	<form id="operForm"></form>
	
	<div class="modal" id="successModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">주문 완료</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div> 
            <div class="modal-footer">
                <button type="button" id="OK" class="btn btn-primary">확인</button>
            </div>
        </div>
    </div>
</div>
</body>
<script src="/resources/js/userOrderManeger.js?after"></script> 
<script type="text/javascript">
	$(document).ready(function() {
		var categoryValue = "";
		var orderProduct = $(".orderProduct");
		
		$("button[name = categoryButton]").on("click", function (e) {
			categoryValue = $(this).attr('value');
			orderProductShow(categoryValue);
		});

		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		function orderProductShow(category) {
			orderProductService.getList(category, function(data) {
				var str = "";
				
				if(data.length == 0 ) {
					str += " ";
					orderProduct.html(str);
					return;
				}
				str += '<div class="row order-list">'; 
				for(var i = 0, len = data.length || 0; i < len; i++) {
					var fileCallPath =  encodeURIComponent( data[i].ORDERVIEW_UPLOADPATH+ "/"+data[i].ORDERVIEW_UUID +"_"+data[i].ORDERVIEW_FILENAME);
					str += "<div class='col-sm-6 col-md-4 col-lg-3' id='orderTest'>";
					str += "<br/>"; 
					str += "<img onclick='userProductBtn(" + data[i].PRODUCT_NUM + ",\"" + data[i].PRODUCT_NAME + "\"," +data[i].PRODUCT_PRICE + ");' src='/userOrderManager/display?fileName=" + fileCallPath + "' width='150' height='200'/>";
					str += "<br/>";
					str += "" + data[i].PRODUCT_NAME;
					str += "<br/>";
					str += "" + numberWithCommas(data[i].PRODUCT_PRICE);
					str += "</div>";
				}
				str += "</div>";

				orderProduct.html(str); 
			});
		}

		var orderArray = {};
		var qty = 0;
		var index = 0;
		var tableBody = $("#tableBody");
		var finalPrice = $("#finalPrice");
		var orderQty = $("#orderQty");

		window.userProductBtn = function(productNum, productName, productPrice) {
			for(key in orderArray) {
				if(orderArray[key].productNum == productNum) {
					orderArray[key].qty = (orderArray[key].qty + 1);
					orderArray[key].finalPrice = (orderArray[key].qty * orderArray[key].productPrice);
					console.log(orderArray);
					showUserProduct();
					return;
				}
			}
			orderArray[index] = {productNum: productNum, qty : 1, productName : productName, productPrice : productPrice, finalPrice: productPrice};
			index += 1;
			console.log(orderArray);
			showUserProduct();
			
		};

		window.productAdd = function(key) {
			orderArray[key].qty = (orderArray[key].qty + 1);
			orderArray[key].finalPrice = (orderArray[key].qty * orderArray[key].productPrice);
			showUserProduct();
		}

		window.productSub = function(key) {
			orderArray[key].qty = (orderArray[key].qty - 1);
			orderArray[key].finalPrice = (orderArray[key].qty * orderArray[key].productPrice);
			if(orderArray[key].qty <= 0) {
				delete orderArray[key];
			}
			console.log(orderArray);
			showUserProduct();
		}
 
		function showUserProduct(){
			var finalPriceSum = 0;
			var qtySum = 0;
			str = "";

			for(key in orderArray) {
				finalPriceSum += orderArray[key].finalPrice;
				qtySum += orderArray[key].qty;
				str += "<tr>"
				str += "<td>" + orderArray[key].productName + "</td>";
				str += "<td>" + orderArray[key].finalPrice + "</td>";
				str += "<td>" + orderArray[key].qty + "</td>";
				str += "<td>[ <a href='#' onclick='productAdd(" + key + ");'>+</a> , ";
				str += "<a href='#' onclick='productSub(" + key + ");'>-</a> ] </td>";
				str += "</tr>";
			}
			finalPrice.val(finalPriceSum);
			orderQty.val(qtySum)
			tableBody.html(str); 	
		}

		window.productAllDelete = function(){
			for(key in orderArray) {
				delete orderArray[key];
			}
			showUserProduct()
		}

		
		$("#resultOrder").on("click", function(){
			console.log(orderArray);
			orderProductService.resultOrder(orderArray, function(e) {
				productAllDelete();
				$("#successModal").modal("show");
			}); 
		});

		$("#OK").on("click", function(){
				$("#successModal").modal("hide");
		});
	});
</script>
</html>
