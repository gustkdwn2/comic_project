<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- partial:partials/_sidebar.html -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<ul class="nav">
					<li class="nav-item"><a class="nav-link" href="/">
							<i class="mdi mdi-home menu-icon"></i> <span class="menu-title">Home</span>
					</a></li>
					<!-- <li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#ui-basic" aria-expanded="false"
						aria-controls="ui-basic"> <i
							class="mdi mdi-circle-outline menu-icon"></i> <span
							class="menu-title">UI Elements</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="ui-basic">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="/resources/pages/ui-features/buttons.html">Buttons</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/resources/pages/ui-features/typography.html">Typography</a></li>
							</ul>
						</div></li> -->
					<li class="nav-item"><a class="nav-link"
					href="/managerpos/managerpos"> <i
							class="mdi mdi-grid-large menu-icon"></i> <span
							class="menu-title">포스 화면</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/settlement/settlementlist"> <i
							class="mdi mdi-file-document-box-outline menu-icon"></i> <span
							class="menu-title">정산</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/loss/losslist"> <i
							class="mdi mdi-file-document-box-outline menu-icon"></i> <span
							class="menu-title">손실</span>
					</a></li>
					<li class="nav-item">
						<a class="nav-link" href="/salesstatistics/salesstatisticslist">
							<i class="mdi mdi-chart-pie menu-icon"></i>
							<span class="menu-title">매출 통계</span>
						</a>
					</li>	
					<li class="nav-item"><a class="nav-link"
						href="/CustomerCenter/boardList"> <i
						class="mdi mdi-file-document-box-outline menu-icon"></i> <span
							class="menu-title">건의 게시판</span>
					</a></li>

					<c:if test="${empty Memberlogin}">
					<li class="nav-item"><a class="nav-link"
						href="/member/MemberLogin"> <i
						class="mdi mdi-file-document-box-outline menu-icon"></i> <span
							class="menu-title">회원 로그인</span>
					</a></li>
					</c:if>
					<c:if test="${empty Employeelogin}">
					<li class="nav-item"><a class="nav-link"
						href="/member/EmployeeLogin"> <i
						class="mdi mdi-file-document-box-outline menu-icon"></i> <span
							class="menu-title">직원 로그인</span>
					</a></li>
					</c:if>
					<li class="nav-item"><a class="nav-link"
						href="/member/MemberList"> <i
						class="mdi mdi-file-document-box-outline menu-icon"></i> <span
							class="menu-title">회원 관리</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/product/productList"> <i
						class="mdi mdi-file-document-box-outline menu-icon"></i> <span
							class="menu-title">상품 재고</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/book/bookList"> <i
						class="mdi mdi-file-document-box-outline menu-icon"></i> <span
							class="menu-title">책 재고</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/userOrderManager/orderManager"> <i
						class="mdi mdi-file-document-box-outline menu-icon"></i> <span
							class="menu-title">상품 사용자뷰 관리</span> 
					</a></li>					
					<li class="nav-item"><a class="nav-link"
						href="/SearchBook/searchList"> <i
						class="mdi mdi-account-search menu-icon"></i> <span
							class="menu-title">책 찾기</span>

					</a></li>
				</ul>
		</nav>
		
