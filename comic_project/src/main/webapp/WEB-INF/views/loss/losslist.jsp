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
								<button data-toggle="modal" data-target="#myModal" style="margin-bottom: 10px;" type="button" class="btn btn-warning">손실 추가</button>
								<table id="lossTable" class="table table-striped">
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
	
	<!-- The Modal -->
	<div class="modal" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content" align="center">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h3 class="modal-title">손실 추가</h3>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <div class="card-body">
				<form class="forms-sample" action="/loss/lossRegister" method="post">
					<div class="form-group row">
						<label for="exampleInputEmail2" class="col-sm-3 col-form-label"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">손실/수익</font></font></label>
						<div class="col-sm-9">
							<select class="form-control" name="loss_category">
							  <option value="손실">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;손실</option>
							  <option value="수익">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수익</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label for="exampleInputPassword2" class="col-sm-3 col-form-label"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">수량</font></font></label>
						<div class="col-sm-9">
							<input type="number" class="form-control" name="loss_qty">
						</div>
					</div>
					<div class="form-group row">
						<label for="exampleInputMobile" class="col-sm-3 col-form-label"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">요금</font></font></label>
						<div class="col-sm-9">
							<input type="number" class="form-control" name="loss_pay">
						</div>
					</div>
					<div class="form-group row">
						<label for="exampleInputMobile" class="col-sm-3 col-form-label"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">상품</font></font></label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="loss_product">
						</div>
					</div>
					<div class="form-group row">
						<label for="exampleInputMobile" class="col-sm-3 col-form-label"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">날짜</font></font></label>
						<div class="col-sm-9">
							<input type="date" class="form-control" name="loss_date">
						</div>
					</div>
					<button type="submit" class="btn btn-primary mr-2">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">등록</font></font>
					</button>
					<button type="button" data-dismiss="modal" class="btn btn-success">닫기</button>
				</form>
			</div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- End Modal -->
	
	
	
<script> 
    $('#lossTable').DataTable({ // 페이징 처리, 검색, show entries
    	pageLength: 10, //처음 페이지에 처리 개수
        bPaginate: true, // 페이징 기능
        bLengthChange: true,
        lengthMenu : [ [ 10, 20, 30, -1 ], [ 10, 20, 30, "All" ] ], //show entries
        bAutoWidth: false,
        processing: true,
        ordering: true,
        serverSide: false,
        searching: true, // 검색 기능
        bStateSave: true, // 이전페이지 저장
        "iDisplayLength": 10,
        "language": {
          search: "Search :"
        },
    });
</script>
</body>
</html>