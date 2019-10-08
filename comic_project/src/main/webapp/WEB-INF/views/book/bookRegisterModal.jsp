<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- The BookRegister Modal -->
<div class="modal" id="bookRegister">
	<div class="modal-dialog">
		<div class="modal-content" align="center">

			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title">책 등록</h3>
			</div>

			<!-- Modal body -->
			<div class="card">
				<div class="card-body" align="center">
					<h4 class="card-title">
						<font style="vertical-align: inherit;">책 재고 등록</font>
					</h4>
					<form onsubmit="return check();" class="forms-sample" action="/book/bookRegister" method="post" autocomplete="off">
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책 이름</font>
							</label>
							<div class="col-sm-9">
								<input id="book_name" type="text" class="form-control" name="book_name" required>
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputEmail2" class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책위치</font>
							</label>
							<div class="col-sm-9">
								<input id="book_loc" type="text" class="form-control" name="book_loc" required>
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputMobile" class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책출판사</font>
							</label>
							<div class="col-sm-9">
								<input id="book_publisher" type="text" class="form-control" name="book_publisher" required>
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputPassword2" class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책 저자</font>
							</label>
							<div class="col-sm-9">
								<input id="book_writer" type="text" class="form-control" name="book_writer" required>
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputPassword2" class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책 소개</font>
							</label>
							<div class="col-sm-9">
								<textarea class="form-control" rows="6" name="book_content"></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputPassword2" class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책 분류</font>
							</label>
							<div class="col-sm-9">
								<input id="book_category" type="text" class="form-control" name="book_category" required>
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputPassword2" class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">마지막권</font>
							</label>
							<div class="col-sm-9">
								<input type="number" class="form-control" name="book_lastbook" required>
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputPassword2" class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">연재상태</font>
							</label>
							<div class="col-sm-9">
								<select id="book_status" class="form-control" name="book_status">
		                            <option value="연재중"><font style="vertical-align: inherit;">연재중</font></option>
		                            <option value="완결"><font style="vertical-align: inherit;">완결</font></option>
	                            </select>
							</div>
						</div>
						<button type="submit" class="btn btn-primary mr-2">
							<font style="vertical-align: inherit;">등록</font>
						</button>
						<button data-dismiss="modal" type="button" class="btn btn-success">닫기</button>
					</form>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- End BookRegister Modal -->
<script type="text/javascript">
	
	function check() {

		var book_name = $('#book_name').val();
		var nameCheck = 0;
		
		$.ajax({
			type : 'POST',
			data : {book_name : book_name},
			async: false,
			url : "/book/bookNameCheck",
			dataType : "json",
			success : function(result) {

				nameCheck = result;

				return;
			}
		});
		
		if($.trim($("#book_name").val()) != $("#book_name").val()) {
		    alert("앞,뒤 공백을 지워주세요.");
		    $("#book_name").val("");
		    $("#book_name").focus();
			return false;
		}
		if(nameCheck > 0) {
			alert("이미 있는 책입니다.");
			$("#book_name").val("");
		    $("#book_name").focus();
		    return false;
		}
		if($.trim($("#book_loc").val()) != $("#book_loc").val()) {
		    alert("앞,뒤 공백을 지워주세요.");
		    $("#book_loc").val("");
		    $("#book_loc").focus();
		    return false;
		}
		if($.trim($("#book_publisher").val()) != $("#book_publisher").val()) {
		    alert("앞,뒤 공백을 지워주세요.");
		    $("#book_publisher").val("");
		    $("#book_publisher").focus();
		    return false;
		}
		if($.trim($("#book_writer").val()) != $("#book_writer").val()) {
		    alert("앞,뒤 공백을 지워주세요.");
		    $("#book_writer").val("");
		    $("#book_writer").focus();
		    return false;
		}
		if($.trim($("#book_category").val()) != $("#book_category").val()) {
		    alert("앞,뒤 공백을 지워주세요.");
		    $("#book_category").val("");
		    $("#book_category").focus();
		    return false;
		}
		return true;
		
	}
	
</script>