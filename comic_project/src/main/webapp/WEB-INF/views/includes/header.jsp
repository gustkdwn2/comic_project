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
<script src="/resources/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
<script src="/resources/js/off-canvas.js"></script>
<script src="/resources/js/hoverable-collapse.js"></script>
<script src="/resources/js/template.js"></script>
<script src="/resources/js/dashboard.js"></script>
<script src="/resources/js/data-table.js"></script>
<script src="/resources/js/jquery.dataTables.js"></script>
<script src="/resources/js/dataTables.bootstrap4.js"></script>
<script src="/resources/js/header.js"></script>

</body>

</html>

</head>

<body>
	<div class="container-scroller">
		<!-- partial:partials/_navbar.html -->
		<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<div class="navbar-brand-wrapper d-flex justify-content-center">
				<div
					class="navbar-brand-inner-wrapper d-flex justify-content-between align-items-center w-100">

					<a class="navbar-brand brand-logo" href=""><img
						src="/resources/images/logo.svg" alt="logo" /></a> <a
						class="navbar-brand brand-logo-mini" href=""><img
						src="/resources/images/logo-mini.svg" alt="logo" /></a>

					<button class="navbar-toggler navbar-toggler align-self-center"
						type="button" data-toggle="minimize">
						<span class="mdi mdi-sort-variant"></span>
					</button>
				</div>
			</div>
			<div
				class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
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
									<p class="font-weight-light small-text text-muted mb-0">
										The meeting is cancelled</p>
								</div>
							</a> <a class="dropdown-item">
								<div class="item-thumbnail">


									<img src="/resources/images/faces/face2.jpg" alt="image"
										class="profile-pic">
								</div>
								<div class="item-content flex-grow">
									<h6 class="ellipsis font-weight-normal">Tim Cook</h6>
									<p class="font-weight-light small-text text-muted mb-0">
										New product launch</p>
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
					<c:if test="${not empty Memberlogin}">
						<li class="nav-item nav-profile dropdown"><a
							class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
							id="profileDropdown"><span class="hidden-xs">${Memberlogin.MEMBER_ID}</span>
						</a>
							<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
								aria-labelledby="profileDropdown">
								<a class="dropdown-item" data-toggle="modal" href="#MemberModifyModal2"> <i
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
		</nav>
		<div class="modal" id="MemberModifyModal2">
			<div class="modal-dialog">
				<div class="modal-content" align="center">

					<!-- Modal Header -->
					<div class="modal-header">
						<h3 class="modal-title">회원 정보</h3>
					</div>

					<!-- Modal body -->
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">
								<font style="vertical-align: inherit;">회원 정보</font>
							</h4>
							<form class="forms-sample" name="membermodify" method="post" autocomplete="off">
								<div class="form-group">
									<label> <font style="vertical-align: inherit;">아이디</font>
									</label> <input name="MEMBER_ID" id="HeaderMEMBER_ID" readonly="readonly"
										class="form-control" value="${Memberlogin.MEMBER_ID}"/>
								</div>
								<div class="form-group">
									<label> <font style="vertical-align: inherit;">이름</font>
									</label> <input name="MEMBER_NAME" id="HeaderMEMBER_NAME" readonly="readonly"
										class="form-control" value="${Memberlogin.MEMBER_NAME}">
								</div>
								<div class="form-group">
									<label> <font style="vertical-align: inherit;">비밀번호</font>
									</label> <input name="MEMBER_PWD" id="HeaderMEMBER_PWD" type="password"
										class="form-control">
								</div>
								<div class="form-group">
									<label> <font style="vertical-align: inherit;">이메일</font>
									</label> <input name="MEMBER_EMAIL" id="HeaderMEMBER_EMAIL" type="email"
										class="form-control" value="${Memberlogin.MEMBER_EMAIL}">
								</div>
								<div class="form-group">
									<label> <font style="vertical-align: inherit;">핸드폰
											번호</font>
									</label> <input name="MEMBER_PHONE_NUMBER" id="HeaderMEMBER_PHONE_NUMBER"
										type="tel" class="form-control" value="${Memberlogin.MEMBER_PHONE_NUMBER}">
								</div>
								<div class="form-group" align="center">
									<button type="button" id="membermodifyBtn" name="membermodifyBtn" class="btn btn-info" onclick="memmodify();">수정</button>
									<button type="button" id="modifyclose" class="btn btn-success" data-dismiss="modal">닫기</button>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
