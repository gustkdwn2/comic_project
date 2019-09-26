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
						<li><button class="categoryButton" value="${ list.orderview_category }">${ list.orderview_category }</button>
							<a href="#" class="categoryUpdate"
							value="${ list.orderview_num }">[수정]</a> <a href="#"
							class="categoryDelete" value="${ list.orderview_num }">[삭제]</a></li>
					</c:forEach>
				</ul>
				<button id="categoryAdd">categoryAdd</button>
			</div>
			<div class="col-md-6 grid-margin">
				<ul class="orderProduct"></ul>
				<button name="productAdd">productAdd</button>
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

<!-- modal product add-->
<div class="modal" id="modalProductAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">product Add</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div> 
            <div class="modal-body">
                <div class="form-group">
                    <label>product</label>
                    <input class="form-control" name="product">
                </div>
            </div>
            <div class="modal-footer">
                <button id="productModalRegisterBtn" type="button" class="btn btn-primary">Resgister</button>
            </div>
        </div>
    </div>
</div>
</body>
<script src="/resources/js/order.js?after"></script>
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

		// 여기부터 상품 등록 ajax
		$("button[name=productAdd]").hide();

		var orderProduct = $(".orderProduct");
		var categoryValue;
		var modalProductAdd = $("#modalProductAdd");
		
		$(".categoryButton").on("click", function (e) {
			categoryValue = $(this).attr('value');
			orderProductShow(categoryValue);
		});

		function orderProductShow(category) {
			$("button[name=productAdd]").show();
			orderProductService.getList(category, function(data) {
				var str = "";
				
				if(data.length == 0 ) {
					str += " ";
					orderProduct.html(str);
					return;
				}

				for(var i = 0, len = data.length || 0; i < len; i++) {
					str += "<li>";
					str += "이름: " + data[i].PRODUCT_NAME + " / 가격: " +data[i].PRODUCT_PRICE;
					str += "<a href='#' onclick=\'productDelete(" + data[i].ORDERVIEW_NUM + ")\'>[delete]</a>";
					str += "</li>";
				}

				orderProduct.html(str);
			});
		}

		$("button[name = productAdd]").on("click", function(e){
			modalProductAdd.modal("show");
		});

		$("#productModalRegisterBtn").on("click", function (e) {
			var productNameJSON = {
				productName: $("input[name='product']").val(),
				productCategory: categoryValue
			};
			orderProductService.productCheck(productNameJSON, function(result) {
				if(result == "NULL") {
					alert("재고에 해당 상품이 없습니다.");
					$("input[name='product']").val('');
					return;
				}

				orderProductService.productAdd(productNameJSON, function(result){
					$("input[name=product]").val('');
					modalProductAdd.modal("hide");
					orderProductShow(categoryValue);
				});
			});
			
        });

		var indexProductNum = 0;
		
		$(".productDelete").on("click", function (e) {
			if(confirm("정말 삭제하시겠습니까?") == false) return;

			indexProductNum = $(this).attr('value');
        	operForm.append("<input type='hidden' name='number' value='" + indexProductNum + "'>");
            operForm.attr("method", 'post');
            operForm.attr("action", "/sangju/admin/productDelete");
            operForm.submit();

            orderProductShow(categoryValue);
		});

		window.productDelete = function (number) {
			if(confirm("정말 삭제하시겠습니까?") == false) return;
			var numberJSON = {
				number : number
			};
			orderProductService.productDelete(numberJSON, function(data) {
				console.log(data);
				console.log(categoryValue);
				
				orderProductShow(categoryValue);
			});
		}
    });	
</script>

</html>