<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/userHeader.jsp"%>

<style type="text/css">
.content-wrapper {
	padding-top: 30px;
}

.btn {
	margin: 10px;
}

.orderProduct {
	text-align: center;
}

#orderTest {
	padding-top: 10px;
	padding-bottom: 10px;
	text-align: center;
}

.container {
	margin-top: 50px;
	border:5px solid #dadfe4;
	border-radius: 10px;
}

h2 {
	padding-top: 15px;
	color: black;
}

table {
	width: 100%;
	border-top: 1px solid #f4e362;
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
			<div style="background-color: #37363a; height: 150px;">
				<img src="/resources/images/comic_image.png" alt=""
					style="width: 200px; height: 100px; margin-left: 550px; margin-top: 20px; float: left" />
				<div class="content-section-heading text-center" style="width: 700px; height: 100px; margin-top: 30px; float: left; ">
					<br/><h1 style="color: white;">${ roomNum }번방&emsp;상품 주문&emsp;&emsp; 02:15:39</h1>
				</div><br /><br />
			</div>

			<div class="container"><br/><br/>
				<div style="background-color: #dadfe4;">
					
						<span> <c:forEach items="${ OrderViewVO_List }" var="list">
								<button class="btn btn-secondary btn-rounded btn-fw"
									name="categoryButton" value="${ list.orderview_category }">${ list.orderview_category }</button>
							</c:forEach>
						</span>
					
				</div>
				<div class="orderProduct" style="border:3px solid #dadfe4;">
				<!-- 사이다 등 상세제품이 나온다. -->
				</div>
				<div class="row">
					<div class="col-md-12"  style="text-align: center;"><br/>
						<h2>주문목록</h2><br/>
						<table style="width:900px; margin-left:90px;">
							<thead>
								<tr>
									<th>상품명</th>
									<th>금액</th>
									<th>수량</th>
									<th>취소</th>
								</tr>
							</thead>
							<tbody id="tableBody">
							<!-- 클릭한 제품의 상세보기가 생긴다. -->
							</tbody>
						</table>
					</div><br/><hr/>
					
					<div class="col-md-12" style="margin-top:50px;">
						<div style="width:800px; height:200px; float:right; margin:20px 170px 0 0;">
						 	<div style="width:350px; float:left;">
								<h4 style="color:black; font-weight: 600;">&emsp;&emsp;&nbsp;총수량</h4>
								<input id="orderQty" class="form form-control" style="width:300px; float:right;" readonly>
							</div>
							<div style="width:350px; float:right">
								<h4 style="color:black; font-weight: 600;">&emsp;&emsp;&nbsp;총금액</h4>
								<input id="finalPrice" class="form form-control" style="width:300px; float:right;" readonly> 
							</div>
						<div style="margin-top: 100px; text-align: center;">
							<button class="btn btn-secondary btn-lg" id="resultOrder" style="background-color: #686868;">상품주문</button>
							<button class="btn btn-secondary btn-lg" onclick="productAllDelete();">전체취소</button>
						</div>
						</div>
					</div>
				</div>
			</div>
			
		<div style="border-radius: 5px;"></div>
		</div>
		<!-- hidden form -->
		<form id="operForm"></form>

		<div class="modal" id="successModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">주문 완료</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-footer">
						<button type="button" id="OK" class="btn btn-primary">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="/resources/js/userOrderManeger.js?after"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var categoryValue = "";
						var orderProduct = $(".orderProduct");

						$("button[name = categoryButton]").on("click",
								function(e) {
									categoryValue = $(this).attr('value');
									orderProductShow(categoryValue);
								});

						function numberWithCommas(x) {
							return x.toString().replace(
									/\B(?=(\d{3})+(?!\d))/g, ",");
						}

						//상품 카테고리
						function orderProductShow(category) {
							orderProductService
									.getList(
											category,
											function(data) {
												var str = "";

												if (data.length == 0) {
													str += " ";
													orderProduct.html(str);
													return;
												}
												str += '<div class="row order-list" style="width:1150px;">';
												for (var i = 0, len = data.length || 0; i < len; i++) {
													var fileCallPath = encodeURIComponent(data[i].ORDERVIEW_UPLOADPATH
															+ "/"
															+ data[i].ORDERVIEW_UUID
															+ "_"
															+ data[i].ORDERVIEW_FILENAME);
													str += "<div class='col-sm-6 col-md-4 col-lg-3' id='orderTest'>";
													str += "<br/>";
													str += "<img onclick='userProductBtn("
															+ data[i].PRODUCT_NUM
															+ ",\""
															+ data[i].PRODUCT_NAME
															+ "\","
															+ data[i].PRODUCT_PRICE
															+ ");' src='/userOrderManager/display?fileName="
															+ fileCallPath
															+ "' width='150' height='200'/>";
													str += "<br/>";
													str += ""
															+ data[i].PRODUCT_NAME;
													str += "<br/>";
													str += ""
															+ numberWithCommas(data[i].PRODUCT_PRICE);
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

						window.userProductBtn = function(productNum,
								productName, productPrice) {
							for (key in orderArray) {
								if (orderArray[key].productNum == productNum) {
									orderArray[key].qty = (orderArray[key].qty + 1);
									orderArray[key].finalPrice = (orderArray[key].qty * orderArray[key].productPrice);
									console.log(orderArray);
									showUserProduct();
									return;
								}
							}
							orderArray[index] = {
								productNum : productNum,
								qty : 1,
								productName : productName,
								productPrice : productPrice,
								finalPrice : productPrice
							};
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
							if (orderArray[key].qty <= 0) {
								delete orderArray[key];
							}
							console.log(orderArray);
							showUserProduct();
						}

						//주문목록
						function showUserProduct() {
							var finalPriceSum = 0;
							var qtySum = 0;
							str = "";

							for (key in orderArray) {
								finalPriceSum += orderArray[key].finalPrice;
								qtySum += orderArray[key].qty;
								str += "<tr style='border:1px solid #dadfe4'>"
								str += "<td style='width:500px;'>" + orderArray[key].productName
										+ "</td>";
								str += "<td style='width:200px;'>" + orderArray[key].finalPrice
										+ "</td>";
								str += "<td style='width:100px;'>" + orderArray[key].qty + "</td>";
								str += "<td style='width:200px;'><a href='#' onclick='productAdd("
										+ key + ");'><button class='btn btn-sm btn-outline-dark' style='width:50px;'>+</button></a>  ";
								str += "<a href='#' onclick='productSub(" + key
										+ ");'><button class='btn btn-sm btn-outline-dark' style='width:50px;'>-</button></a></td>";
								str += "</tr>";
							}
							finalPrice.val(finalPriceSum);
							orderQty.val(qtySum)
							tableBody.html(str);
						}

						window.productAllDelete = function() {
							for (key in orderArray) {
								delete orderArray[key];
							}
							showUserProduct()
						}

						$("#resultOrder").on(
								"click",
								function() {
									console.log(orderArray);
									orderProductService.resultOrder(orderArray,
											function(e) {
												productAllDelete();
												$("#successModal")
														.modal("show");
											});
								});

						$("#OK").on("click", function() {
							$("#successModal").modal("hide");
						});
					});
</script>
</html>
