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
											<th class="no-sort">수정/삭제</th>
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
												<td><button name ="modifyBtn" value="${loss.loss_num }"
												  class="btn btn-info">수정</button>
												<button name ="removeBtn" value="${loss.loss_num}"
												 type="submit" class="btn btn-danger">삭제</button></td>				
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
	
<jsp:include page="createModal.jsp" />	
<jsp:include page="modifyModal.jsp" />
	
<script> 
	/* 모달창 손실 추가, 삭제 현재날짜 */
	document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);	
	
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
        "columnDefs": [{
            targets: 'no-sort',
            orderable: false
         }]
    });
    
    $('button[name=removeBtn]').click(function(){
    	var loss_num = $(this).attr('value');
    	var form = document.createElement("form"); // form을 만듬
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post");
		form.setAttribute("action", "lossRemove");
		document.body.appendChild(form);

		var hiddenInput = document.createElement("input");
		hiddenInput.setAttribute("type", "hidden");
		hiddenInput.setAttribute("name", "loss_num");
		hiddenInput.setAttribute("value", loss_num);

		form.appendChild(hiddenInput);

		form.submit();
    });
    
    $('button[name=modifyBtn]').click(function(){
    	var loss_num = $(this).attr('value');
    	
    	$.ajax({
    	    type: 'get',
    	    url: "/loss/lossModify?loss_num="+loss_num,
    	    success: function(data) {
    	    	var loss_date = data.getModify['loss_date'];
    	    	var date = new Date(parseInt(("/Date("+loss_date+")/").match(/\d+/)[0]));
    	    	$('#loss_num').attr('value',data.getModify['loss_num']);
    	    	$('#loss_category').attr('value',data.getModify['loss_category']);
    	    	$('#loss_qty').attr('value',data.getModify['loss_qty']);
    	    	$('#loss_pay').attr('value',data.getModify['loss_pay']);
    	    	$('#loss_product').attr('value',data.getModify['loss_product']);
    	    	$('#loss_date').attr('value',dateFormat(date));
    	    	$('#myModifyModal').show();
    	    }
    	});
    });
    
    $('#modifyclose').click(function(){
    	$('#myModifyModal').hide();
    });
    
    
    function dateFormat(d) {
    	   return d.getFullYear() + "-" + ((d.getMonth() + 1) + "").padStart(2, "0") 
    	      + "-" + (d.getDate() + "").padStart(2, "0");
    }
</script>
</body>
</html>