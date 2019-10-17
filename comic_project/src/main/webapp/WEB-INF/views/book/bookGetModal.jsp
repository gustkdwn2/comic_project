<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- The BookGet Modal -->
<div class="modal" id="bookGet">
	<div id="modal-dialog-get" class="modal-dialog">
		<div class="modal-content" align="center">

			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title">책 정보</h3>
			</div>

			<!-- Modal body -->
			<div class="card">
				<div id="card-body-get" class="card-body" align="center">
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">
							<font style="vertical-align: inherit;">책 이미지</font>
						</label>
						<div class="form-group row">
					        <div class="form-group uploadDiv">
					            <input id="uploadFileGet" type="file" name='uploadFile'>
					        </div>
				        
					        <div class='uploadResultGet'> 
					        	<ul>
					          
					        	</ul>
					        </div>
				    	</div>
					</div>
					<form id="getForm" class="forms-sample" action="/book/bookModify" role="form" method="post" autocomplete="off">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책 이름</font>
							</label>
							<div class="col-sm-9">
								<input id="book_name_get" type="text" class="form-control" name="book_name" required readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책위치</font>
							</label>
							<div class="col-sm-9">
								<input id="book_loc_get" type="text" class="form-control" name="book_loc" required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책출판사</font>
							</label>
							<div class="col-sm-9">
								<input id="book_publisher_get" type="text" class="form-control" name="book_publisher" required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책 저자</font>
							</label>
							<div class="col-sm-9">
								<input id="book_writer_get" type="text" class="form-control" name="book_writer" required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책 소개</font>
							</label>
							<div class="col-sm-9">
								<textarea id="book_content_get" name="book_content" class="form-control" rows="20"></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책 분류</font>
							</label>
							<div class="col-sm-9">
								<input id="book_category_get" type="text" class="form-control" name="book_category" required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">마지막권</font>
							</label>
							<div class="col-sm-9">
								<input id="book_lastbook_get" type="number" class="form-control" name="book_lastbook" required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">연재상태</font>
							</label>
							<div class="col-sm-9">
								<select id="book_status_get" class="form-control" name="book_status">

	                            </select>
							</div>
						</div>
						<button id="getSubmitBtn" type="button" class="btn btn-primary mr-2">
							<font style="vertical-align: inherit;">수정</font>
						</button>
						<button id="bookGetBtn" type="button" class="btn btn-success">닫기</button>
					</form>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- End BookGet Modal -->

<!-- <script type="text/javascript">
	$(document).ready(function() {

		(function(){
			  
			var book_name = $("#book_name").val();
		    
			$.getJSON("/book/getAttachList", {book_name: book_name}, function(arr){
		    
				console.log(arr);

				var str="";

				$(arr).each(function(i, attach){
			    	//image type
			    	if(attach.fileType){
			            var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
			            
			            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
			            str +=" data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
			            str += "<span> "+ attach.fileName+"</span>";
			            str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
			            str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			            str += "<img src='/display?fileName="+fileCallPath+"'>";
			            str += "</div>";
			            str +"</li>";
					}else{
			            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
			            str += "data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
			            str += "<span> "+ attach.fileName+"</span><br/>";
			            str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
			            str += " class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			            str += "<img src='/resources/img/attach.png'></a>";
			            str += "</div>";
			    		str +"</li>";
			    	}
			    });
				$(".uploadResult ul").html(str);
			});
		    
		})();

		$(".uploadResult").on("click", "button", function(e){
		    
		    console.log("delete file");
		      
		    if(confirm("삭제 하시겠습니까?")){
		    
		    	var targetLi = $(this).closest("li");
		    	targetLi.remove();
		    	$("#uploadFile").val("");
		    }
		});

		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		  var maxSize = 5242880; //5MB
		  
		  function checkExtension(fileName, fileSize){
		    
		    if(fileSize >= maxSize){
		      alert("파일 사이즈 초과");
		      $("input[name='uploadFile']").val("");
		      return false;
		    }
		    
		    if(regex.test(fileName)){
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

		var formObj = $("form");

		$('button[name=modifyBtn]').on("click", function(e){
		    
			e.preventDefault(); 
		        
		    console.log("submit clicked");
		        
		    var str = "";
		        
		    $(".uploadResult ul li").each(function(i, obj){
		          
		    	var jobj = $(obj);
		          
		        console.dir(jobj);
		        console.log(i+"=========================");
		        str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
		        str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
		        str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
		        str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
		          
			});

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
		        
		    formObj.append(str).submit();
	        
			
		   /*  formObj.submit(); */
		});
		
		$("#bookGetBtn").click(function() {
			$("#bookGetBtn").find('form')[0].reset();
			$("#bookGet").hide();
		});
		
	});
		
</script> -->

<style>
.uploadResultGet {
	width: 100%;
	background-color: gray;
}

.uploadResultGet ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResultGet ul li {
	list-style: none;
	padding: 10px;
}

.uploadResultGet ul li img {
	width: 100px;
}

#modal-dialog-get{
    overflow-y: initial !important
}
#card-body-get{
    height: 760px;
    overflow-y: auto;
}
</style>
</html>