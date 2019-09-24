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
<title>손실</title>
</head>
<body>
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-md-12 stretch-card">
					<div class="card">
						<div class="card-body">
							<p class="card-title">재고 손실</p>
							<div class="table-responsive">
								<table id="recent-purchases-listing" class="table table-striped">
									<thead>
										<tr>
											<th>번호</th>	
											<th>손실/수익</th>
											<th>수량</th>
											<th>요금</th>
											<th>상품</th>
											<th>날짜</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${lossList}" var="loss">
											<tr>
												<td>${loss.loss_num}</td>
												<td>${loss.loss_category }</td>
												<td>${loss.loss_qty }</td>
												<td>${loss.loss_pay }</td>
												<td>${loss.loss_product }</td>
												<td><fmt:formatDate value="${loss.loss_date }"
														pattern="yyyy-MM-dd" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>