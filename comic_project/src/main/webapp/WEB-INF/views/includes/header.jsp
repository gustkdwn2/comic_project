<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Comic Clerk</title>

<link rel="stylesheet"
	href="/resources/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="/resources/vendors/base/vendor.bundle.base.css">
<link rel="stylesheet"
	href="/resources/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="shortcut icon" href="/resources/images/favicon.png" />

<!-- <script src="//code.jquery.com/jquery-3.2.1.min.js"></script> -->
<script src="/resources/vendors/base/vendor.bundle.base.js"></script>
<script src="/resources/vendors/chart.js/Chart.min.js"></script>
<script src="/resources/vendors/datatables.net/jquery.dataTables.js"></script>
<script
	src="/resources/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
<script src="/resources/js/off-canvas.js"></script>
<script src="/resources/js/hoverable-collapse.js?ver=44"></script>
<script src="/resources/js/template.js?ver=10"></script>
<script src="/resources/js/dashboard.js"></script>
<script src="/resources/js/data-table.js"></script>
<script src="/resources/js/jquery.dataTables.js"></script>
<script src="/resources/js/dataTables.bootstrap4.js"></script>
<script src="/resources/js/header.js?ver=1"></script>

<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script src="/resources/js/userWebsocket.js"></script>

</head>

<body>
</html>
<script>
//var test  = location.pathname;//프로젝트 뒤의 값을 가져온다 //project:"managerpos/login"
//alert('${request.getRequestURI()}');
//alert(test);

	checksession();
	function checksession() {
		var sessempid = "${sessionScope.EMPID}";
		//alert(sessempid);
		if (sessempid== ""&&location.pathname!="/managerpos/login") {
			alert("로그인 이력이 없으므로 로그인화면으로 이동합니다.");
			location.href = "/managerpos/login";
		}
	}
	// 퇴근 시 ${sessionScope.EMPID} 값이 tmp라는 세션으로 저장이 되고, tmp 값일 때는 포스화면은 계쏙 볼수있으, 다른사람이 로그인 시 tmp 값이 사라지며 그사람 세션유지
	
</script>

	<div class="container-scroller">
		<!-- partial:partials/_navbar.html -->
		<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<div class="navbar-brand-wrapper d-flex justify-content-center">
				<div
					class="navbar-brand-inner-wrapper d-flex justify-content-between align-items-center w-100">

					<a class="navbar-brand brand-logo" href="/managerpos/managerpos">
					<img src="/resources/images/comic_image.png" alt="" style="width: 70px; height: 30px;"/></a>
					<a class="navbar-brand brand-logo" href="/managerpos/managerpos">
					<img src="/resources/images/comic_clerk_logo.png" alt="" style="width: 130px; height: 20px;"/></a>

				</div>
				<!-- hidden form -->
				<form id="operForm2"></form>
			</div>
			
			<div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
				<ul class="navbar-nav navbar-nav-right">
					
					<!-- 알림 아이콘 -->
					<li class="nav-item dropdown mr-4"><a
						class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center notification-dropdown"
						id="notificationDropdown" href="#" data-toggle="dropdown"> <i
							class="mdi mdi-bell mx-0"></i> <span class="count"></span>
					</a>
						<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
							aria-labelledby="notificationDropdown">
							<p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
							<a class="dropdown-item">
								<div class="item-thumbnail">
									<div class="item-icon bg-success">
										<i class="mdi mdi-information mx-0"></i>
									</div>
								</div>
								<div class="item-content">
									<h6 class="font-weight-normal">Application Error</h6>
									<p class="font-weight-light small-text mb-0 text-muted">
										Just now</p>
								</div>
							</a> <a class="dropdown-item">
								<div class="item-thumbnail">
									<div class="item-icon bg-warning">
										<i class="mdi mdi-settings mx-0"></i>
									</div>
								</div>
								<div class="item-content">
									<h6 class="font-weight-normal">Settings</h6>
									<p class="font-weight-light small-text mb-0 text-muted">
										Private message</p>
								</div>
							</a> <a class="dropdown-item">
								<div class="item-thumbnail">
									<div class="item-icon bg-info">
										<i class="mdi mdi-account-box mx-0"></i>
									</div>
								</div>
								<div class="item-content">
									<h6 class="font-weight-normal">New user registration</h6>
									<p class="font-weight-light small-text mb-0 text-muted">2
										days ago</p>
								</div>
							</a>
						</div>
					</li>
					<!-- 알림 아이콘 끝 -->
	
					<c:if test="${not empty Memberlogin}">
						<li class="nav-item nav-profile dropdown"><a
							class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
							id="profileDropdown"><span class="hidden-xs">${Memberlogin.MEMBER_ID}</span>
						</a>
							<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
								aria-labelledby="profileDropdown">
								<a class="dropdown-item" onclick='javascript:headermembermodifyBtn()'> <i
									class="mdi mdi-settings text-primary"></i> 회원정보
								</a> <a class="dropdown-item" href="${path}/member/MemberLogout">
									<i class="mdi mdi-logout text-primary"></i> 로그아웃
								</a>
							</div></li>
					</c:if>
					
					<c:if test="${not empty Employeelogin}">
						<li class="nav-item nav-profile dropdown"><a
							class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
							id="profileDropdown"><span class="hidden-xs">${Employeelogin.EMPLOYEE_NAME}</span>
						</a>
							<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
								aria-labelledby="profileDropdown">
								<a class="dropdown-item" href="${path}/member/EmployeeLogout">
									<i class="mdi mdi-logout text-primary"></i> 로그아웃
								</a>
							</div></li>
					</c:if>
					
				</ul>
				
				
				
				<button
					class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
					type="button" data-toggle="offcanvas">
					<span class="mdi mdi-menu"></span>
				</button>
			</div>
		</div>
		<div
			class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
			<ul class="navbar-nav mr-lg-4 w-100">
				<li class="nav-item nav-search d-none d-lg-block w-100">
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text" id="search">
							 <i class="mdi mdi-magnify"></i>
							</span>
						</div>
						<input type="text" class="form-control" placeholder="Search now"
							aria-label="search" aria-describedby="search">
					</div>
				</li>
			</ul>
			<ul class="navbar-nav navbar-nav-right">
				<li class="nav-item dropdown mr-1"><a
					class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center"
					id="messageDropdown" href="#" data-toggle="dropdown"> <i
						class="mdi mdi-message-text mx-0"></i> <span class="count"></span>
				</a>
					<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
						aria-labelledby="messageDropdown">
						<p class="mb-0 font-weight-normal float-left dropdown-header">Messages</p>
						<a class="dropdown-item">
							<div class="item-thumbnail">


								<img src="/resources/images/faces/face4.jpg" alt="image"
									class="profile-pic">
							</div>
							<div class="item-content flex-grow">
								<h6 class="ellipsis font-weight-normal">David Grey</h6>
								<p class="font-weight-light small-text text-muted mb-0">The
									meeting is cancelled</p>
							</div>
						</a> <a class="dropdown-item">
							<div class="item-thumbnail">


								<img src="/resources/images/faces/face2.jpg" alt="image"
									class="profile-pic">
							</div>
							<div class="item-content flex-grow">
								<h6 class="ellipsis font-weight-normal">Tim Cook</h6>
								<p class="font-weight-light small-text text-muted mb-0">New
									product launch</p>
							</div>
						</a> <a class="dropdown-item">
							<div class="item-thumbnail">


								<img src="/resources/images/faces/face3.jpg" alt="image"
									class="profile-pic">
							</div>
							<div class="item-content flex-grow">
								<h6 class="ellipsis font-weight-normal">Johnson</h6>
								<p class="font-weight-light small-text text-muted mb-0">
									Upcoming board meeting</p>
							</div>
						</a>
					</div></li>
				<li class="nav-item dropdown mr-4"><a
					class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center notification-dropdown"
					id="notificationDropdown" href="#" data-toggle="dropdown"> <i
						class="mdi mdi-bell mx-0"></i> <span class="count"></span>
				</a>
					<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
						aria-labelledby="notificationDropdown">
						<p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
						<a class="dropdown-item">
							<div class="item-thumbnail">
								<div class="item-icon bg-success">
									<i class="mdi mdi-information mx-0"></i>
								</div>
							</div>
							<div class="item-content">
								<h6 class="font-weight-normal">Application Error</h6>
								<p class="font-weight-light small-text mb-0 text-muted">
									Just now</p>
							</div>
						</a> <a class="dropdown-item">
							<div class="item-thumbnail">
								<div class="item-icon bg-warning">
									<i class="mdi mdi-settings mx-0"></i>
								</div>
							</div>
							<div class="item-content">
								<h6 class="font-weight-normal">Settings</h6>
								<p class="font-weight-light small-text mb-0 text-muted">
									Private message</p>
							</div>
						</a> <a class="dropdown-item">
							<div class="item-thumbnail">
								<div class="item-icon bg-info">
									<i class="mdi mdi-account-box mx-0"></i>
								</div>
							</div>
							<div class="item-content">
								<h6 class="font-weight-normal">New user registration</h6>
								<p class="font-weight-light small-text mb-0 text-muted">2
									days ago</p>
							</div>
						</a>
					</div></li>
				<li class="nav-item nav-profile dropdown"><a
					class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
					id="profileDropdown"> <img
						src="/resources/images/faces/face5.jpg" alt="profile" /> <span
						class="nav-profile-name">${sessionScope.EMPNAME}</span>
				</a>
					<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
						aria-labelledby="profileDropdown">
						<a class="dropdown-item"> <i
							class="mdi mdi-settings text-primary"></i> Settings
						</a> <a class="dropdown-item"> <i
							class="mdi mdi-logout text-primary"></i> Logout
						</a>
					</div></li>
			</ul>
			<button
				class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
				type="button" data-toggle="offcanvas">
				<span class="mdi mdi-menu"></span>
			</button>
		</div>
	</nav>
	<!-- partial -->
	<div class="container-fluid page-body-wrapper">
