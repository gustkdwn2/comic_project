<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>

<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <h1>Admin</h1>
            상품주문 뷰 CRUD
            <hr>

            <ul>

                <li></li>
            </ul>
            <button id="categoryAdd">categoryAdd</button>
            <form id="operForm">
            </form>
        </div>
    </div>
</div>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>category</label>
                    <input class="form-control" name="category">
                </div>
            </div>
            <div class="modal-footer">
                <button id="modalRegisterBtn" type="button" class="btn btn-primary">Resgister</button>
                <button id="modalCloseBtn" type="button" class="btn btn-default">Close</button>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(document).ready(function () {
        var operForm = $("#operForm");
        
        var modal = $(".modal");
        var modalInputCategory = modal.find("input[name='category']");
        var modalRegisterBtn = $("#modalRegisterBtn");

        $("#categoryAdd").on("click", function (e) {
            $(".modal").modal("show");
        });
        console.log(modalInputCategory.val());
        modalRegisterBtn.on("click", function (e) {
        	operForm.append("<input type='hidden' name='category' value='" + modalInputCategory.val() + "'>");
            operForm.attr("method", 'post');
            operForm.attr("action", "/sangju/admin/categoryAdd");
            operForm.submit();
        }); 


    });
</script>

</html>