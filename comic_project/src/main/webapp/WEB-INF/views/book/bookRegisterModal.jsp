<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}
</style>

<style>
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
</style>

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
					<div class="form-group row">
						<label for="exampleInputUsername2" class="col-sm-3 col-form-label">
							<font style="vertical-align: inherit;">책 이미지</font>
						</label>
						<div class="form-group row">
					        <div class="form-group uploadDiv">
					            <input type="file" name='uploadFile' id="uploadFile">
					        </div>
				        
					        <div class='uploadResult'> 
					        	<ul>
					          
					        	</ul>
					        </div>
				    	</div>
					</div>
					<form class="forms-sample" action="/book/bookRegister" role="form" method="post" autocomplete="off">
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
		                            <option value="연재중">연재중</option>
		                            <option value="완결">완결</option>
	                            </select>
							</div>
						</div>
						<button name="registerBtn" type="submit" class="btn btn-primary mr-2">
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

<!-- <script type="text/javascript">

	$(document).ready(function(e){
	  
	  var formObj = $("form[role='form']");
	  
	  $("button[name=registerBtn]").on("click", function(e){

	    
	    e.preventDefault();
	    
	    console.log("submit clicked");

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
	    
	    var str = "";
	    
	    $(".uploadResult ul li").each(function(i, obj){
	      
	      var jobj = $(obj);
	      
	      console.dir(jobj);
	      console.log("-------------------------");
	      console.log(jobj.data("filename"));
	      
	      
	      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
	      
	    });
	    
	    console.log(str);
	    
	    formObj.append(str).submit();
	    
	  });
	
	  
	  var regex = new RegExp("(.*?)\.(jpg|png)$");
	  var maxSize = 5242880; //5MB
	  
	  function checkExtension(fileName, fileSize){
	    
	    if(fileSize >= maxSize){
	      alert("파일 사이즈 초과");
	      $("input[name='uploadFile']").val("");
	      return false;
	    }
	    
	    if(!regex.test(fileName)){
	      alert("해당 종류의 파일은 업로드할 수 없습니다.");
	      $("input[name='uploadFile']").val("");
	      return false;
	    }
	    return true;
	  }
	  
	  $("input[type='file']").change(function(e){
	
	    var formData = new FormData();
	    
	    var inputFile = $("input[name='uploadFile']");
	    
	    var files = inputFile[0].files;
	    
	    for(var i = 0; i < files.length; i++){
	
	      if(!checkExtension(files[i].name, files[i].size) ){
	        return false;
	      }
	      formData.append("uploadFile", files[i]);
	      
	    }
	    
	    $.ajax({
	      url: '/uploadAjaxAction',
	      processData: false, 
	      contentType: false,data: 
	      formData,type: 'POST',
	      dataType:'json',
	        success: function(result){
	          console.log(result); 
			  showUploadResult(result); //업로드 결과 처리 함수 
	
	      }
	    }); //$.ajax
	    
	  });  
	  
	  function showUploadResult(uploadResultArr){
		    
	    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
	    
	    var uploadUL = $(".uploadResult ul");
	    
	    var str ="";
	    
	    $(uploadResultArr).each(function(i, obj){
			
			if(obj.image){
				var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
				str += "<li data-path='"+obj.uploadPath+"'";
				str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
				str +" ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' "
				str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/display?fileName="+fileCallPath+"'>";
				str += "</div>";
				str +"</li>";
			}else{
				var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
			    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			      
				str += "<li "
				str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
				str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/resources/img/attach.png'></a>";
				str += "</div>";
				str +"</li>";
			}
	
	    });
	    
	    uploadUL.append(str);
	  }
	
	  $(".uploadResult").on("click", "button", function(e){
		    
	    console.log("delete file");
	      
	    var targetFile = $(this).data("file");
	    var type = $(this).data("type");
	    
	    var targetLi = $(this).closest("li");
	    
	    $.ajax({
	      url: '/deleteFile',
	      data: {fileName: targetFile, type:type},
	      dataType:'text',
	      type: 'POST',
	        success: function(result){
	           targetLi.remove();
	         }
	    }); //$.ajax
	    $("#uploadFile").val("");
	   });
	
	});
	
</script> -->