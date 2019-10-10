<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="/resources/images/logo.svg" alt="logo">
              </div>
              <form class="pt-3" role="form" name="memberlogin" id="memberlogin" method="post" action="/member/MemberLoginPost" autocomplete="off">
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="MEMBER_ID" name="MEMBER_ID" placeholder="userid" autofocus required="required">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="MEMBER_PWD" name="MEMBER_PWD" placeholder="Password" required="required">
                </div>
                
                <div class="my-2 d-flex justify-content-between align-items-center">
                  <a data-toggle="modal" href="#PasswordModifyModal" data-backdrop="static" data-keyboard="false" class="auth-link text-black">비밀번호 찾기</a>
                </div>
                
                <div class="mt-3">
                  <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" id="login">로그인</a>
                </div>
             
                <div class="mt-3">
					<a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" href="/member/MemberRegister" >회원가입</a>
                </div>
                
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <jsp:include page="PasswordModifyModal.jsp" />
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
  
	  var msg = "${msg}";
	  if (msg === "REGISTERED") {
	      alert("회원가입이 완료되었습니다. 로그인해주세요~");
	  } else if (msg == "FAILURE") {
	      alert("아이디 또는 비밀번호를 확인해주세요.");
	  } else if (msg === "NOMEMBER") {
		  alert("입력한 정보로 등록된 회원이 없습니다.")
	  }
  
	  $("#login").on("click", function(e) {
		e.preventDefault();
		$("#memberlogin").submit();
	  });
	  
	 function pwdmodify() {
		  var passwordmodify = $("form[name=passwordmodify]").serialize();
			  $.ajax({
				  type : 'post',
				  url : '/member/MemberPasswordModify',
				  data : passwordmodify,
				  success : function(result) {
					  console.log(result);
				  /* alert(result); */
			   }
		   });
	   }
  </script>
</body>

</html>
