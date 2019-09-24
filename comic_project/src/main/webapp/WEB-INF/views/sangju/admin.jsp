<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>

<div class="main-panel">
	<div class="content-wrapper">
		<div class="row">
			<div class="col-md-12">
				<h1>Admin</h1>
				상품주문 뷰 CRUD
				<hr>
			</div>
			<div class="col-md-6 grid-margin">
				<ul>
					<c:forEach items="${ OrderViewVO_List }" var="list">
						<li><button value="${ list.orderview_category }">${ list.orderview_category }</button>
							<a href="#" class="categoryUpdate"
							value="${ list.orderview_num }">[수정]</a> <a href="#"
							class="categoryDelete" value="${ list.orderview_num }">[삭제]</a></li>
					</c:forEach>
				</ul>
				<button id="categoryAdd">categoryAdd</button>
			</div>
			<div class="col-md-6 grid-margin">
				<button id="productAdd">productAdd</button>
			</div>
		</div>
	</div>
</div>

<!-- hidden form -->
<form id="operForm"></form>

<!-- modal category add-->
<div class="modal" id="ModalcategoryAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">category Add</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div> 
            <div class="modal-body">
                <div class="form-group">
                    <label>category</label>
                    <input class="form-control" name="category">
                </div>
            </div>
            <div class="modal-footer">
                <button id="cateModalRegisterBtn" type="button" class="btn btn-primary">Resgister</button>
            </div>
        </div>
    </div>
</div>

<!-- modal category Update-->
<div class="modal" id="ModalcategoryUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">category Update</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>category</label>
                    <input class="form-control" name="category">
                </div>
            </div>
            <div class="modal-footer">
                <button id="cateModalUpdateBtn" type="button" class="btn btn-primary">Update</button>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(document).ready(function () {
        var operForm = $("#operForm"); 
        
        var modalCateAdd = $("#ModalcategoryAdd");
        var modalCateUpdate = $("#ModalcategoryUpdate");
        var modalInputCategory = modalCateAdd.find("input[name='category']");
        var modalInputCategoryUpdate = modalCateUpdate.find("input[name='category']");

		var indexNum = 0;
		
        $("#categoryAdd").on("click", function (e) {
        	modalCateAdd.modal("show"); 
        });

        $("#cateModalRegisterBtn").on("click", function (e) {
        	operForm.append("<input type='hidden' name='category' value='" + modalInputCategory.val() + "'>");
            operForm.attr("method", 'post');
            operForm.attr("action", "/sangju/admin/categoryAdd");
            operForm.submit();
        });

		$(".categoryUpdate").on("click", function (e) {
			modalCateUpdate.modal('show');
			indexNum = $(this).attr('value');
				
		});
		
		$("#cateModalUpdateBtn").on("click", function (e) {
        	operForm.append("<input type='hidden' name='category' value='" + modalInputCategoryUpdate.val() + "'>");
        	operForm.append("<input type='hidden' name='number' value='" + indexNum + "'>");
            operForm.attr("method", 'post');
            operForm.attr("action", "/sangju/admin/categoryUpdate");
            operForm.submit();
        });

		$(".categoryDelete").on("click", function (e) {
			if(confirm("정말 삭제하시겠습니까?") == false) return;

			indexNum = $(this).attr('value');
        	operForm.append("<input type='hidden' name='number' value='" + indexNum + "'>");
            operForm.attr("method", 'post');
            operForm.attr("action", "/sangju/admin/categoryDelete");
            operForm.submit();
		});
		
    });	
</script>

</html>