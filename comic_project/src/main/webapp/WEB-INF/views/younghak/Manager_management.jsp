<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page session="false"%>

<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>


<!DOCTYPE html>
<html>
<head>
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

.uploadResultGet {
	width: 100%;
	/* background-color: gray; */
}

.uploadResultGet ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResultGet ul li {
	list-style: none;
	/* padding: 10px; */
}

.uploadResultGet ul li img {
	/* width: 100px; */
	width: 170px;
	height: 220px;
}

#imageGetBtn{
	float: right;
}

.mngmentcard {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 5);
	max-width: 300px;
	margin: auto;
	text-align: center;
	font-family: arial;
	padding: 5px 1px 3px 3px;
	/* margin: 5px 1px 13px 3px; */
	/* border-radius: 100%; */ /* 둥글게하는것 */
}

.mngmenttitle {
	color: grey;
	font-size: 18px;
}

.mngmentbutton {
	border: none;
	outline: 0;
	display: inline-block;
	padding: 8px;
	color: white;
	background-color: #000;
	text-align: center;
	cursor: pointer;
	width: 100%;
	font-size: 18px;
}

.mngmenta {
	text-decoration: none;
	font-size: 22px;
	color: black;
}

.mntmentbutton:hover, .mngmenta:hover {
	opacity: 0.7;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="row">
				<%@ include file="./younghak_header.jsp"%>
				<div class="col-12 grid-margin stretch-card">
					<div class="card">
						<div class="row">
							<div class="col-md-12">
								<div class="card-body">

									<!--                       
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5"> -->

		<button type="button" id="AdminModal" class="btn btn-primary">직원
			추가</button>
		<br>
		<br>
		<div class="template-demo">
			<div class="row">

<c:forEach var="i" begin="1" end="${managerList.size()}"
step="1">


<!-- <div class="row"> -->
<div class="mngmentcard" >

	<!-- <img src="/WEB-INF/views/younghak/icando.jpg" alt="John" style="width:80%; height:80%; border-radius: 50%;" > -->
	<a href="#"> <img
		src="/resources/images/faces/jang.jpg"
		alt="${managerList.get(i-1).getEMPLOYEE_NAME()}"
		style="width: 50%; height: 50%; border-radius: 50%;"
		onclick="workhourcal('${managerList.get(i-1).getEMPLOYEE_NAME()}','${managerList.get(i-1).getEMPLOYEE_NUM()}')">
	</a>

	<h1>${managerList.get(i-1).getEMPLOYEE_NAME()}</h1>
	<!-- 이름 -->
	<p class="mngmenttitle">${managerList.get(i-1).getEMPLOYEE_POSITION()}</p>
	<p>사번 : ${managerList.get(i-1).getEMPLOYEE_NUM()}</p>

	<p>
		입사일 :
		<fmt:formatDate
			value="${managerList.get(i-1).getEMPLOYEE_STARTDAY()}"
			pattern="yy.MM.dd" />
	</p>
	<p>연락처 : ${managerList.get(i-1).getEMPLOYEE_PHONE()}</p>
	<p>시급/월급 : ${managerList.get(i-1).getEMPLOYEE_PAY()}</p>
	<p>계좌번호 : ${managerList.get(i-1).getEMPLOYEE_ACCOUNT()}</p>

	<div style="margin: 24px 0;">

		<!-- </div> -->
		<p>
			<button class="mngmentbutton"
				onclick="employeemodify(${managerList.get(i-1).getEMPLOYEE_NUM()})">수정하기</button>
		</p>
		<p>
			<button class="mngmentbutton"
				onclick="employeedelete(${managerList.get(i-1).getEMPLOYEE_NUM()})">탈퇴하기</button>
		</p>

		<a href="#" class="mngmenta"><i class="fa fa-dribbble"></i></a>
		<a href="#" class="mngmenta"><i class="fa fa-twitter"></i></a>
		<a href="#" class="mngmenta"><i class="fa fa-linkedin"></i></a>
		<a href="#" class="mngmenta"><i class="fa fa-facebook"></i></a>
	</div>
</div>

<c:if test="${i%3==0}">
</div>
<div class="row">
	</c:if>


</c:forEach>
	</div>
</div>
				<!-- 
            </div>
          </div>
        </div>
      
      content-wrapper ends
    </div>
    page-body-wrapper ends -->


								</div>
							</div>
							<!-- <div class="col-md-0"> -->
							<div class="card-body">
								<%-- <h4 class="card-title">Inverse buttons</h4>
<p class="card-description">Add class <code>.btn-inverse-{color} for inverse buttons</code></p> --%>
								<div class="template-demo"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>

	<div class="card-body">
		<h4 class="card-title">Social button with text</h4>
		<p class="card-description">
			Add class
			<code>.btn-social-icon-text</code>
		</p>
		<div class="template-demo">
			<button type="button" class="btn btn-social-icon-text btn-facebook">
				<i class="mdi mdi-facebook"></i>Facebook
			</button>
			<button type="button" class="btn btn-social-icon-text btn-youtube">
				<i class="mdi mdi-youtube"></i>Youtube
			</button>
			<button type="button" class="btn btn-social-icon-text btn-twitter">
				<i class="mdi mdi-twitter"></i>Twitter
			</button>
			<button type="button" class="btn btn-social-icon-text btn-dribbble">
				<i class="mdi mdi-dribbble"></i>Dribbble
			</button>
			<button type="button" class="btn btn-social-icon-text btn-linkedin">
				<i class="mdi mdi-linkedin"></i>Linkedin
			</button>
			<button type="button" class="btn btn-social-icon-text btn-google">
				<i class="mdi mdi-google-plus"></i>Google
			</button>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>

	</div>
	<!-- main-panel ends -->

	<!-- 인서트Modal 추가 -->
	<div class="modal fade" id="empRegisterMoal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="ModalLabel">직원 추가</h4>
				</div>
				<div class="modal-body">
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
					<form name="register" class="pt-3" id="register" action="/EmployeeRegister"
						method="post">
						<div class="form-group">
							<label>이름</label> <input type="text"
								class="form-control form-control-lg" id="EMPLOYEE_NAME_insert" name="EMPLOYEE_NAME"
									placeholder="Name">
						</div>
						<div class="form-group">
							<label>비밀번호</label> <input type="password"
								class="form-control form-control-lg" id="EMPLOYEE_PWD_insert" name="EMPLOYEE_PWD"
								placeholder="Password" >
						</div>
						
						<div class="form-group">
							<label>비밀번호 확인</label> <input type="password"
								class="form-control form-control-lg" id="EMPLOYEE_PWD_confirm_insert" 
								placeholder="Password" >
						</div>
						
						<div class="form-group">
							<label>핸드폰 번호</label> <input type="number"
								class="form-control form-control-lg" id="EMPLOYEE_PHONE_insert" name="EMPLOYEE_PHONE"
								placeholder="Phone" >
						</div>
						<div class="form-group">
							<label>계좌 번호</label> <input type="number"
								class="form-control form-control-lg" id="EMPLOYEE_ACCOUNT_insert" name="EMPLOYEE_ACCOUNT"
								placeholder="Account"  >
						</div>
						<div class="form-group">
							<label>직책</label> 
								 
								 <select name="EMPLOYEE_POSITION" class="selectpicker">
								
								<option value="부점장">부점장</option>
								<option value="스태프매니저" >스태프매니저</option>
								<option value="매니저">매니저</option>
								<option value="신입" selected="selected">신입</option>
							</select>
						</div>
						<div class="form-group">
							<label>시급/월급</label> <input type="number"
								class="form-control form-control-lg" id="EMPLOYEE_PAY_insert" name="EMPLOYEE_PAY"
								placeholder="Pay">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="additional_staff_validation()">추가</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<!-- 수정Modal 추가 -->
	<div class="modal fade" id="mngmodifyModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="ModalLabel">직원 정보 수정</h4>
				</div>
				<div class="modal-body">
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
					<form class="pt-3" name="EmployeeModify" id="EmployeeModify" action="/managerpos/EmployeeModify"
						method="post">
						<div class="form-group">
							<label>이름</label> <input type="text"
								class="form-control form-control-lg" name="EMPLOYEE_NAME"
								placeholder="Name" id="EMPLOYEE_NAME_modify">
						</div>
						<div class="form-group">
							<label>비밀번호</label> <input type="password"
								class="form-control form-control-lg" name="EMPLOYEE_PWD"
								placeholder="Password" id="EMPLOYEE_PWD_modify">
						</div>
						
						<div class="form-group">
							<label>비밀번호</label> <input type="password"
								class="form-control form-control-lg" name="EMPLOYEE_PWD_confirm"
								placeholder="Password_confirm" id="EMPLOYEE_PWD_confirm_modify">
						</div>
						
						<div class="form-group">
							<label>핸드폰 번호</label> <input type="number"
								class="form-control form-control-lg" name="EMPLOYEE_PHONE"
								placeholder="Phone" id="EMPLOYEE_PHONE_modify">
						</div>
						<div class="form-group">
							<label>계좌 번호</label> <input type="text"
								class="form-control form-control-lg" name="EMPLOYEE_ACCOUNT"
								placeholder="Account" id="EMPLOYEE_ACCOUNT_modify">
						</div>
						<div class="form-group">
							<label>직책</label> 
							 <select name="EMPLOYEE_POSITION">
								
								<option value="부점장">부점장</option>
								<option value="스태프매니저" >스태프매니저</option>
								<option value="매니저">매니저</option>
								<option value="신입" selected="selected">신입</option>
							</select>
						</div>
						<div class="form-group">
							<label>시급/월급</label> 
							<input type="number"
								class="form-control form-control-lg" name="EMPLOYEE_PAY"
								placeholder="Pay"  id="EMPLOYEE_PAY_modify">
							<input type="hidden" id="EMPLOYEE_mngnum_modify" class="form-control form-control-lg"
								name="EMPLOYEE_NUM">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="modify_staff_validation()">수정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<!-- 삭제Modal 추가 -->
	<div class="modal fade" id="mngdeleteModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="ModalLabel">탈퇴 하기</h4>
				</div>
				<div class="modal-body">
					<form class="pt-3" id="EmployeeDelete"
						action="/managerpos/EmployeeDelete" method="post">
						<div class="form-group">
							<h3>
								사번 : <font id="deletemodalmngnum" />
							</h3>
							<label>비밀번호</label> 
							<input type="text" class="form-control form-control-lg" name="EMPLOYEE_PWD"
								placeholder="Password"> 
							<input type="hidden" id="EMPLOYEE_mngnum" class="form-control form-control-lg"
								name="EMPLOYEE_mngnum">
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="document.getElementById('EmployeeDelete').submit()">탈퇴</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<script type="text/javascript">
$("#AdminModal").on("click", function() {
   $("#empRegisterMoal").modal("show");   
});


function employeedelete(employee_num){
	
	$("#mngdeleteModal").modal("show");
	document.getElementById("deletemodalmngnum").innerHTML=employee_num;
	document.getElementById("EMPLOYEE_mngnum").value=employee_num;
	//사번을 form태그안에 보내야하는데 inputtype이없기때문에넣어서 보낸다.
	
}

function employeemodify(employee_num){
	//alert(employee_num);
	$("#mngmodifyModal").modal("show");
	ajaxtogetempdata(employee_num);
	/* document.getElementById("deletemodalmngnum").innerHTML=employee_num;
	document.getElementById("EMPLOYEE_mngnum").value=employee_num; */
	
}

function ajaxtogetempdata(employee_num){
//alert(employee_num);

var list = [employee_num];

var sendData={'list' : list};

	//var sendData =employee_num;
	$.ajax({
		url : '/managerpos/getempdata',
		dataType : 'json',
		data : JSON.stringify(sendData),
		contentType : "application/json; charset=utf-8;",
		type : 'POST',
		success : function(data) {

			var text = "";

			$.each(data, function(index, list) {
				var number = 1;
				//number = list.workingday;

				document.getElementById("EMPLOYEE_NAME_modify").value=list.employee_name;
				document.getElementById("EMPLOYEE_PWD_modify").value=list.employee_pwd;
				document.getElementById("EMPLOYEE_PHONE_modify").value=list.employee_phone;
				document.getElementById("EMPLOYEE_ACCOUNT_modify").value=list.employee_account;
				document.getElementById("EMPLOYEE_PAY_modify").value=list.employee_pay;
				document.getElementById("EMPLOYEE_mngnum_modify").value=employee_num;
				
				//$('#worksummary').text("총 근무시간 = " + secondtotimeformat(worksecond_month));*/	
				//날짜별로 데이터를 넣어줌
			});
		},
		error : function(data) {
			console.log("ajaxtogetempdata\n실패");
		}
	});

	$.getJSON("/managerpos/getAttachList", {employee_num: employee_num}, function(arr){
	    
		console.log(arr);

		var str="";

		$(arr).each(function(i, attach){
	    	//image type
	    	if(attach.fileType){
	            var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
	            
	            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
	            str +=" data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
	            str += "<span></span>";
	            str += "<button id='imageGetBtn' type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
	            str += "class='btn btn-inverse-danger btn-icon'><i class='mdi mdi-close'></i></button><br>";
	            str += "<img src='/empDisplay?fileName="+fileCallPath+"'>";
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
		$(".uploadResultGet ul").html(str);
		$('#uploadFileGet').attr('disabled', true);
	});
	
}


function workhourcal(empname,empnum){	
	//alert(empname);
	var url = "/managerpos/workhourcalendar";
	posttourl(url,{'empname':empname,'empnum':empnum});
	//alert(empname);	
}



function posttourl(path, params, method) {
    method = method || "post"; // Set method to post by default, if not specified.
    // The rest of this code assumes you are not using a library.
    // It can be made less wordy if you use one.
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);
    for(var key in params) {
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", params[key]);
        form.appendChild(hiddenField);
    }
    document.body.appendChild(form);
    form.submit();
}

/* function additional_staff_validation(){//직원추가 유효성검사

	var text;
	
	var name = "EMPLOYEE_NAME_insert";
	var pwd ="EMPLOYEE_PWD_insert";
	var pwd_confirm="EMPLOYEE_PWD_confirm_insert";
	var phone="EMPLOYEE_PHONE_insert";
	var account="EMPLOYEE_ACCOUNT_insert";
	var pay="EMPLOYEE_PAY_insert";
			
	
	text = $('#'+name).val().trim(); //id로 데이터 가져와서 공백지우기 
	if(text.length==0){
		alert("이름를 입력해주세요");
		$('#'+name).focus();	
		return;
	}

	text = $('#'+pwd).val().trim(); //id로 데이터 가져와서 공백지우기 
	if(text.length==0){
		alert("비밀번호를 입력해주세요");
		$('#'+pwd).focus();	
		return;
	}
	
	text = $('#'+pwd_confirm).val().trim(); //id로 데이터 가져와서 공백지우기 
	if(text.length==0){
		alert("비밀번호 확인을 입력해주세요");
		$('#'+pwd_confirm).focus();	
		return;
	}

	if($('#'+pwd_confirm).val().trim()!=$('#'+pwd).val().trim()){
		alert("비밀번호가 서로 맞지 않습니다");
		$('#'+pwd_confirm).focus();	
		return;
		}

	text = $('#'+phone).val().trim(); //id로 데이터 가져와서 공백지우기 
	if(text.length==0){
		alert("전화번호를 입력해주세요");
		$('#'+phone).focus();	
		return;
	}

	text = $('#'+account).val().trim(); //id로 데이터 가져와서 공백지우기 
	if(text.length==0){
		alert("계좌를 입력해주세요");
		$('#'+account).focus();	
		return;
	}

	text = $('#'+pay).val().trim(); //id로 데이터 가져와서 공백지우기 
	if(text.length==0){
		alert("시급을 입력해주세요");
		$('#'+pay).focus();	
		return;
	}

	document.register.submit();
} */


function modify_staff_validation(){//직원추가 유효성검사

	var text;
	
	var name = "EMPLOYEE_NAME_modify";
	var pwd ="EMPLOYEE_PWD_modify";
	var pwd_confirm="EMPLOYEE_PWD_confirm_modify";
	var phone="EMPLOYEE_PHONE_modify";
	var account="EMPLOYEE_ACCOUNT_modify";
	var pay="EMPLOYEE_PAY_modify";
			
	
	text = $('#'+name).val().trim(); //id로 데이터 가져와서 공백지우기 
	if(text.length==0){
		alert("이름를 입력해주세요");
		$('#'+name).focus();	
		return;
	}

	text = $('#'+pwd).val().trim(); //id로 데이터 가져와서 공백지우기 
	if(text.length==0){
		alert("비밀번호를 입력해주세요");
		$('#'+pwd).focus();	
		return;
	}
	
	text = $('#'+pwd_confirm).val().trim(); //id로 데이터 가져와서 공백지우기 
	if(text.length==0){
		alert("비밀번호 확인을 입력해주세요");
		$('#'+pwd_confirm).focus();	
		return;
	}

	if($('#'+pwd_confirm).val().trim()!=$('#'+pwd).val().trim()){
		alert("비밀번호가 서로 맞지 않습니다");
		$('#'+pwd_confirm).focus();	
		return;
		}

	text = $('#'+phone).val().trim(); //id로 데이터 가져와서 공백지우기 
	if(text.length==0){
		alert("전화번호를 입력해주세요");
		$('#'+phone).focus();	
		return;
	}

	text = $('#'+account).val().trim(); //id로 데이터 가져와서 공백지우기 
	if(text.length==0){
		alert("계좌를 입력해주세요");
		$('#'+account).focus();	
		return;
	}

	text = $('#'+pay).val().trim(); //id로 데이터 가져와서 공백지우기 
	if(text.length==0){
		alert("시급을 입력해주세요");
		$('#'+pay).focus();	
		return;
	}
	document.EmployeeModify.submit();
	
}

function additional_staff_validation(){//직원추가 유효성검사
	
	var formObj = $("#register");
	
	var text;
	
	var name = "EMPLOYEE_NAME_insert";
	var pwd ="EMPLOYEE_PWD_insert";
	var pwd_confirm="EMPLOYEE_PWD_confirm_insert";
	var phone="EMPLOYEE_PHONE_insert";
	var account="EMPLOYEE_ACCOUNT_insert";
	var pay="EMPLOYEE_PAY_insert";
			
	
	text = $('#'+name).val().trim(); //id로 데이터 가져와서 공백지우기 
	if(text.length==0){
		alert("이름를 입력해주세요");
		$('#'+name).focus();	
		return;
	}

	text = $('#'+pwd).val().trim(); //id로 데이터 가져와서 공백지우기 
	if(text.length==0){
		alert("비밀번호를 입력해주세요");
		$('#'+pwd).focus();	
		return;
	}
	
	text = $('#'+pwd_confirm).val().trim(); //id로 데이터 가져와서 공백지우기 
	if(text.length==0){
		alert("비밀번호 확인을 입력해주세요");
		$('#'+pwd_confirm).focus();	
		return;
	}

	if($('#'+pwd_confirm).val().trim()!=$('#'+pwd).val().trim()){
		alert("비밀번호가 서로 맞지 않습니다");
		$('#'+pwd_confirm).focus();	
		return;
		}

	text = $('#'+phone).val().trim(); //id로 데이터 가져와서 공백지우기 
	if(text.length==0){
		alert("전화번호를 입력해주세요");
		$('#'+phone).focus();	
		return;
	}

	text = $('#'+account).val().trim(); //id로 데이터 가져와서 공백지우기 
	if(text.length==0){
		alert("계좌를 입력해주세요");
		$('#'+account).focus();	
		return;
	}

	text = $('#'+pay).val().trim(); //id로 데이터 가져와서 공백지우기 
	if(text.length==0){
		alert("시급을 입력해주세요");
		$('#'+pay).focus();	
		return;
	}
	if($('#uploadFileRegister')[0].files[0] == null) {
		alert("이미지를 넣어주세요.")
		$("#uploadFileRegister").focus();
		return false;
	}

	var str = "";
    
    $(".uploadResultRegister ul li").each(function(i, obj){
      
      var jobj = $(obj);
      
      console.dir(jobj);
      console.log("-------------------------");
      console.log(jobj.data("filename"));
      
      
      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
      
    });
    formObj.append(str)
	document.register.submit();
	/* formObj.append(str).submit(); */
}

var regex = new RegExp("(.*?)\.(jpg|png)$");
var maxSize = 5242880; //5MB

function checkExtension(fileName, fileSize){
  
  if(fileSize >= maxSize){
    alert("파일 사이즈 초과");
    $("#uploadFileRegister").val("");
    return false;
  }
  
  if(!regex.test(fileName)){
    alert("해당 종류의 파일은 업로드할 수 없습니다.");
    $("#uploadFileRegister").val("");
    return false;
  }
  return true;
}

$("#uploadFileRegister").change(function(e){
	
    var formData = new FormData();
    
    var inputFile = $("#uploadFileRegister");
    
    var files = inputFile[0].files;
    
    for(var i = 0; i < files.length; i++){

      if(!checkExtension(files[i].name, files[i].size) ){
        return false;
      }
      formData.append("uploadFile", files[i]);
      
    }
    
    $.ajax({
      url: '/empUploadAjaxAction',
      processData: false, 
      contentType: false,data: 
      formData,type: 'POST',
      dataType:'json',
        success: function(result){
          console.log(result); 
		  showUploadResult(result); //업로드 결과 처리 함수 

      }
    }); //$.ajax
   $('#uploadFileRegister').attr('disabled', true);
});

function showUploadResult(uploadResultArr){
    
    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
    
    var uploadUL = $(".uploadResultRegister ul");
    
    var str ="";
    
    $(uploadResultArr).each(function(i, obj){
    	
		if(obj.image){
			var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
			str += "<li data-path='"+obj.uploadPath+"'";
			str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
			str +" ><div>";
			str += "<span></span>";
			str += "<button id='imageRemoveBtn' type='button' data-file=\'"+fileCallPath+"\' "
			str += "data-type='image' class='btn btn-inverse-danger btn-icon'><i class='mdi mdi-close'></i></button><br>";
			str += "<img src='/empDisplay?fileName="+fileCallPath+"'>";
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

$(".uploadResultRegister").on("click", "button", function(e){
    
	  console.log("delete file");
    
	  var targetFile = $(this).data("file");
	  var type = $(this).data("type");
	  var targetLi = $(this).closest("li");
	  console.log(targetFile);
	  console.log(type);
	  console.log(targetLi);
	  $.ajax({
		  url: '/empDeleteFile',
		  data: {fileName: targetFile, type:type},
		  dataType:'text',
		  type: 'POST',
		  success: function(result){
			  targetLi.remove();
		  }
	  }); //$.ajax
	  $('#uploadFileRegister').attr('disabled', false);
	  $("#uploadFileRegister").val("");
});

$("#bookRegisterCloseBtn").click(function() {
    if($("#imageRemoveBtn").data("file") != null) {
		  var targetFile = $("#imageRemoveBtn").data("file");
		  var type = $("#imageRemoveBtn").data("type");
		  var targetLi = $("#imageRemoveBtn").closest("li");
		  console.log(targetFile);
		  console.log(type);
		  console.log(targetLi);
		  $.ajax({
			  url: '/empDeleteFile',
			  data: {fileName: targetFile, type:type},
			  dataType:'text',
			  type: 'POST',
			  success: function(result){
				  targetLi.remove();
			  }
		  }); //$.ajax
    }
    $('#uploadFileRegister').attr('disabled', false);
	$("#uploadFileRegister").val("");
	$("#empRegisterMoal").find('form')[0].reset();
	$('#empRegisterMoal').hide();
});

</script>

</body>
</html>