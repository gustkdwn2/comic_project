<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- The BookRegister Modal -->
<div class="modal" id="bookRegister">
	<div id="modal-dialog-register" class="modal-dialog">
		<div class="modal-content" align="center">

			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title">책 등록</h3>
			</div>

			<!-- Modal body -->
			<div class="card">
				<div id="card-body-register" class="card-body" align="center">
					<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책 이미지</font>
							</label>
							<div class="form-group row">
						        <div class="form-group uploadDiv">
						            <input type="file" name='uploadFile' id="uploadFileRegister">
						        </div>
					        
						        <div class='uploadResultRegister'> 
						        	<ul>
						          
						        	</ul>
						        </div>
					    	</div>
					</div>
					<form id="registerForm" class="forms-sample" action="/book/bookRegister" role="form" method="post" autocomplete="off">
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책 이름</font>
							</label>
							<div class="col-sm-9">
								<input id="book_name_register" type="text" class="form-control" name="book_name" required>
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputEmail2" class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책위치</font>
							</label>
							<div class="col-sm-9">
								<input id="book_loc_register" type="text" class="form-control" name="book_loc" required>
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputMobile" class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책출판사</font>
							</label>
							<div class="col-sm-9">
								<input id="book_publisher_register" type="text" class="form-control" name="book_publisher" required>
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputPassword2" class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책 저자</font>
							</label>
							<div class="col-sm-9">
								<input id="book_writer_register" type="text" class="form-control" name="book_writer" required>
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputPassword2" class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책 소개</font>
							</label>
							<div class="col-sm-9">
								<textarea class="form-control" rows="6" name="book_content" id="book_content" required></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputPassword2" class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책 분류</font>
							</label>
							<div class="col-sm-9">
								<input id="book_category_register" type="text" class="form-control" name="book_category" required>
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputPassword2" class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">마지막권</font>
							</label>
							<div class="col-sm-9">
								<input id="book_lastbook_register" type="number" class="form-control" name="book_lastbook" required>
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputPassword2" class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">연재상태</font>
							</label>
							<div class="col-sm-9">
								<select id="book_status_register" class="form-control" name="book_status">
		                            <option value="연재중">연재중</option>
		                            <option value="완결">완결</option>
	                            </select>
							</div>
						</div>
						<button id="RegisterSubmitBtn" type="button" class="btn btn-primary mr-2">
							<font style="vertical-align: inherit;">등록</font>
						</button>
						<button id="bookRegisterCloseBtn" type="button" class="btn btn-success">닫기</button>
					</form>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- End BookRegister Modal -->

<style>
.uploadResultRegister {
	width: 100%;
	/* background-color: gray; */
}

.uploadResultRegister ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResultRegister ul li {
	list-style: none;
	/* padding: 10px; */
}

.uploadResultRegister ul li img {
	/* width: 100px; */
	width: 170px;
	height: 220px;
}

#imageRemoveBtn{
	float: right;
}

#modal-dialog-register{
    overflow-y: initial !important
}
#card-body-register{
    height: 760px;
    overflow-y: auto;
}
</style>