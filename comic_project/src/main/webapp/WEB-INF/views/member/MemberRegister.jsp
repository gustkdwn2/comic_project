<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Majestic Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="/resources/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="/resources/vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/resources/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/resources/images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <div class="col-lg-4 mx-auto">
      <div class="auth-form-light text-left py-5 px-4 px-sm-5" style="background-color: RGB(215,215,216,.7); margin-top: 50px;">
	    	
	    	<div class="brand-logo">
              <a href="javascript:home()" ><img src="/resources/images/comic_image.png" alt="" style="width: 200px; height: 100px;"/></a>
            </div>
            
            <form class="pt-3" id="register" onsubmit="return validate();" action="/member/MemberRegister" method="post" autocomplete="off">
              
              
              <div class="form-group">
                <input type="text" class="form-control form-control-lg"
                		id="MEMBER_ID" name="MEMBER_ID" placeholder="아이디" >
              </div>
              
              <div class="form-group">
                <input type="password" class="form-control form-control-lg" 
                		id="MEMBER_PWD" name="MEMBER_PWD" placeholder="비밀번호는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.">
              </div>
              
              <div class="form-group">
                <input type="text" class="form-control form-control-lg" id="MEMBER_NAME" 
                		name="MEMBER_NAME" placeholder="이름" >
              </div>
              
              <div class="form-group">
                <input type="email" class="form-control form-control-lg" id="MEMBER_EMAIL" 
                		name="MEMBER_EMAIL" placeholder="이메일" >
              </div>
              
              <div class="form-group">
                <input type="tel" class="form-control form-control-lg" id="MEMBER_PHONE_NUMBER" 
                		name="MEMBER_PHONE_NUMBER" placeholder="핸드폰 번호 ***-****-**** 형식으로 입력해주세요" >
              </div>
              
              <div class="mt-3">
                <button class="btn btn-block btn-warning btn-lg font-weight-medium auth-form-btn" 
                		style="color: white;" type="submit">회원가입</button>
              </div>
              
              <div class="text-center mt-4 font-weight-light">
                 <a href="/member/MemberLogin" class="text-primary">로그인하러가기</a>
              </div>
            
            </form>
          
      </div>
    <!-- content-wrapper ends -->
  </div>
  <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
  <!-- plugins:js -->
  <script src="/resources/vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="/resources/js/off-canvas.js"></script>
  <script src="/resources/js/hoverable-collapse.js"></script>
  <script src="/resources/js/template.js"></script>
  <!-- endinject -->
  
  <script type="text/javascript">

  var roomNum = "<c:out value='${roomNum}'/>";
  console.log(roomNum);

  function home(){
		var operForm = $("#operForm");

		operForm.append("<input type='hidden' name='roomNum' value='" + roomNum + "'>");
		operForm.attr("method", "post");
		operForm.attr("action","/userView/main");
		operForm.submit();
	}
	
  function validate() {
      var re = /^[a-zA-Z0-9]{4,12}$/ // 패스워드가 적합한지 검사할 정규식
      var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;  // 이메일이 적합한지 검사할 정규식
      var regExp = /^\d{3}-\d{3,4}-\d{4}$/; // 핸드폰번호 정규식
     

      var id = document.getElementById("MEMBER_ID");
      var pw = document.getElementById("MEMBER_PWD");
      var name = document.getElementById("MEMBER_NAME")
      var email = document.getElementById("MEMBER_EMAIL");
	  var phone = document.getElementById("MEMBER_PHONE_NUMBER");
      // ------------ 이메일 까지 -----------
      
      if(id.value=="") {
    	  alert("아이디를 입력해 주세요");
          id.focus();
          return false;
      }
      
      if(!check(re,pw,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.")) {
          return false;
      }
      
      if(pw.value=="") {
    	  alert("비밀번호를 입력해 주세요");
          pw.focus();
          return false;
      }
      
      if(name.value=="") {
          alert("이름을 입력해 주세요");
          name.focus();
          return false;
      }

      if(email.value=="") {
          alert("이메일을 입력해 주세요");
          email.focus();
          return false;
      }

      if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
          return false;
      }
      
      if(!check(regExp, phone, "적합하지 않은 번호 형식입니다.")) {
    	  return false;
      }
  }

  function check(re, what, message) {
      if(re.test(what.value)) {
          return true;
      }
      alert(message);
      what.value = "";
      what.focus();
      //return false;
  }
  </script>
</body>

</html>
