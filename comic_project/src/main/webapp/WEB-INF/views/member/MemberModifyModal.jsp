<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- The Modal -->
<div class="modal" id="MemberModifyModal">
	<div class="modal-dialog">
		<div class="modal-content" align="center">

			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title">상품 발주</h3>
			</div>

			<!-- Modal body -->
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">
						<font style="vertical-align: inherit;">상품 수정</font>
					</h4>
					<form class="forms-sample" action="/product/productModify" method="post" autocomplete="off">
						<div class="form-group">
							<label>
								<font style="vertical-align: inherit;">아이디</font>
							</label>
							<input name="MEMBER_ID" id="MEMBER_ID" readonly="readonly" class="form-control"/>
						</div>
						<div class="form-group">
							<label for="exampleInputUsername1">
								<font style="vertical-align: inherit;">이름</font>
							</label>
							<input name="MEMBER_NAME" id="MEMBER_NAME" readonly="readonly" class="form-control" value="<c:out value='${member.MEMBER_NAME}'/>">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">
								<font style="vertical-align: inherit;">이메일</font>
							</label>
							<input name="MEMBER_EMAIL" id="MEMBER_EMAIL" type="email" class="form-control" value="<c:out value="${member.MEMBER_EMAIL}" />">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">
								<font style="vertical-align: inherit;">핸드폰 번호</font>
							</label>
							<input name="MEMBER_PHONE_NUMBER" id="MEMBER_PHONE_NUMBER" type="tel" class="form-control" value="<c:out value="${member.MEMBER_PHONE_NUMBER}"/>">
						</div>
						<div class="form-group" align="center">
							<button type="submit" data-oper='modify' class="btn btn-info">수정</button>
							<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
							<button type="submit" data-oper='list' class="btn btn-success">목록</button>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- End Modal -->