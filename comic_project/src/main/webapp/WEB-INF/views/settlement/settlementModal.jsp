<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- The Modal -->
	<div class="modal" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content" align="center">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h3 class="modal-title">재고 변경</h3>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <div class="card-body">
					<div class="form-group row">
						<div class="col-sm-9" style="margin-left: 50px;">
							<table class="type03">
								<c:forEach items="${settleList}" var="settle" varStatus="status">
									<tr>
										<th><input type="hidden" value="${settle.product_num }"
											name="productNum"> ${settle.product_name }</th>
										<td>${settle.product_qty }</td>
										<td> &nbsp;&nbsp; -> </td>
										<td id="b${status.count-1}" style="border-right: 1px solid #ccc;"></td>
									</tr>	
							   </c:forEach>
							</table>
						</div>
					</div>
					<button type="submit" class="btn btn-primary mr-2" onclick="javascript:modify_product()">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">변경</font></font>
					</button>
					<button type="button" data-dismiss="modal" id="modalclose" class="btn btn-success">닫기</button>
			</div>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- End Modal -->