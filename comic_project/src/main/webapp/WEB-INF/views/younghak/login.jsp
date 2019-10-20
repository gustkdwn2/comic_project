<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Majestic Admin</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="/resources/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="/resources/vendors/base/vendor.bundle.base.css">
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
								<img src="/resources/images/comic_icon.png" width="280px"
									height="100px" alt="logo" 
									onclick="javascript:location.href='/managerpos/managerpos'">
							</div>
							<h4>코믹서기 직원 출근 창</h4>
							<h6 class="font-weight-light">빨리 출근 찍으세요.</h6>
							<form class="pt-3" action="/managerpos/workonoff" id="workonoff"
								method="post">
								<div class="form-group">
									<input type="text" class="form-control form-control-lg"
										id="exampleInputEmail1" name="employeenum" placeholder="사원번호"
										required="true">
								</div>
								<div class="form-group">
									<input type="password" class="form-control form-control-lg"
										id="exampleInputPassword1" name="employeepwd"
										placeholder="비밀번호"
										required="true">
								</div>
								<div class="mt-3">
									<!-- <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
										href="/index">사인 히어</a> -->

									<button type="button"
										class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
										onclick="document.getElementById('workonoff').submit()">사인
										히어</button>
								</div>
								<div
									class="my-2 d-flex justify-content-between align-items-center">
									<!-- <div class="form-check">
                    <label class="form-check-label text-muted">
                      <input type="checkbox" class="form-check-input">
                      Keep me signed in
                    </label>
                  </div> -->
									<a href="#" onclick="forgotpwd()" class="auth-link text-black">Forgot
										password?</a>
								</div>
								<!--  <div class="mb-2">
                  <button type="button" class="btn btn-block btn-facebook auth-form-btn">
                    <i class="mdi mdi-facebook mr-2"></i>Connect using facebook
                  </button>
                </div> -->
								<!--   <div class="text-center mt-4 font-weight-light">
                  Don't have an account? <a href="register.html" class="text-primary">Create</a>
                </div> -->
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
	<script>
	checksession();
	function checksession(){
		var test = "${sessionScope.EMPID}";
		alert("현재 세션은"+test);
		}
	
		function forgotpwd() {
			alert("ㅋㅋ답이없네");
		}

		var tmp = '${errormsg}';
		console.log(tmp);
		if(tmp!=""){
			alert(tmp);
			}
		
		var succecssmsg = '${succecssmsg}';
		console.log(succecssmsg);
		if(succecssmsg!=""){
			alert(succecssmsg);
			}

		
		
		function Request() {
			var requestParam = "";

			//getParameter 펑션
			this.getParameter = function(param) {
				//현재 주소를 decoding
				var url = unescape(location.href);
				//파라미터만 자르고, 다시 &그분자를 잘라서 배열에 넣는다.
				var paramArr = (url.substring(url.indexOf("?") + 1, url.length))
						.split("&");

				for (var i = 0; i < paramArr.length; i++) {
					var temp = paramArr[i].split("="); //파라미터 변수명을 담음

					if (temp[0].toUpperCase() == param.toUpperCase()) {
						// 변수명과 일치할 경우 데이터 삽입
						requestParam = paramArr[i].split("=")[1];
						break;
					}
				}
				return requestParam;
			}
		}
		// Request 객체 생성
		/*  var request = new Request();
		 // test 라는 파라메터 값을 얻기
		var tmp =  request.getParameter("managerList"); */
		
		

		
	</script>


</body>
</html>