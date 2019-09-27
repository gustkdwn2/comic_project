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
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">책 재고 등록</font></font>
					</h4>
					<p class="card-description">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;"></font></font>
					</p>
					<form class="forms-sample" action="/book/bookRegister"
						method="post" autocomplete="off">
						<div class="form-group row">
							<label for="exampleInputUsername2"
								class="col-sm-3 col-form-label"><font
								style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">책 이름</font></font></label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="book_name">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputEmail2" class="col-sm-3 col-form-label"><font
								style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">책위치</font></font></label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="book_loc">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputMobile" class="col-sm-3 col-form-label"><font
								style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">책출판사</font></font></label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="book_publisher">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputPassword2"
								class="col-sm-3 col-form-label"><font
								style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">책 저자</font></font></label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="book_writer">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputPassword2"
								class="col-sm-3 col-form-label"><font
								style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">책 소개</font></font></label>
							<div class="col-sm-9">
								<textarea class="form-control" rows="7" name="book_content"></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputPassword2"
								class="col-sm-3 col-form-label"><font
								style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">책 분류</font></font></label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="book_category">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputPassword2"
								class="col-sm-3 col-form-label"><font
								style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">마지막권</font></font></label>
							<div class="col-sm-9">
								<input type="number" class="form-control" name="book_lastbook">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputPassword2"
								class="col-sm-3 col-form-label"><font
								style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">연재상태</font></font></label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="book_status">
							</div>
						</div>
						<button type="submit" class="btn btn-primary mr-2">
							<font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">등록</font></font>
						</button>
						<button data-dismiss="modal" type="button" class="btn btn-success">닫기</button>
					</form>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- End BookRegister Modal -->