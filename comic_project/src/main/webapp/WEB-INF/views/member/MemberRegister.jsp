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
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="/resources/images/logo.svg" alt="logo">
              </div>
              <form class="pt-3" id="register" onsubmit="return validate();" action="/member/MemberRegister" method="post" autocomplete="off">
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="MEMBER_ID" name="MEMBER_ID" placeholder="ID" oninput="checkId()">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="MEMBER_PWD" name="MEMBER_PWD" placeholder="Password" oninput="pwdCheck()">
                  <a style="color: gray; font-size: 10px;" >* 비밀번호는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.</a>
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="MEMBER_PWD_Check" name="MEMBER_PWD_Check" placeholder="PasswordCheck" oninput="pwdCheck()">
                </div>
                <h5 id="pwdCheckMessage" style = "color: red;"></h5>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="MEMBER_NAME" name="MEMBER_NAME" placeholder="Name">
                </div>
                <div class="form-group">
                  <input type="email" class="form-control form-control-lg" id="MEMBER_EMAIL" name="MEMBER_EMAIL" placeholder="Email">
                </div>
                <div class="form-group">
                  <input type="tel" class="form-control form-control-lg" id="MEMBER_PHONE_NUMBER" name="MEMBER_PHONE_NUMBER" placeholder="Phone">
                </div>
                <div class="mt-3">
                  <button class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit">회원가입</button>
                </div>
                <div class="text-center mt-4 font-weight-light">
                   <a href="/member/MemberLogin" class="text-primary">로그인하러가기</a>
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
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="/resources/vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="/resources/js/off-canvas.js"></script>
  <script src="/resources/js/hoverable-collapse.js"></script>
  <script src="/resources/js/template.js"></script>
  <!-- endinject -->
  <!-- 멤버 js -->
  <script src="/resources/js/member.js"></script>
  
</body>

</html>
