<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- partial:partials/_sidebar.html -->

<style>
li{list-style: none;}
.accordion_wrap a{cursor:pointer;}
.accordion_wrap .accordion_content{display:none;}
</style>

	<nav class="sidebar sidebar-offcanvas">
	
		<ul class="nav">

			<li class="nav-item"><a class="nav-link" href="/">
					<i class="mdi mdi-home menu-icon"></i> <span class="menu-title">임의 창</span>
			</a></li>
			
			<li class="nav-item open accordion_wrap"><a class="nav-link"> 
			<i class="mdi mdi-file-document-box-outline menu-icon"></i> 
			<span class="menu-title">재고</span></a>
					
					<ul class="accordion_content">
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
					</ul>
			</li>
			
			<li class="nav-item open accordion_wrap"><a class="nav-link"> 
			<i class="mdi mdi-file-document-box-outline menu-icon"></i> 
			<span class="menu-title">매출</span></a>
					
					<ul class="accordion_content">
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
					</ul>
			</li>
					
<!-- 			<li class="nav-item"><a class="nav-link"
			href="/managerpos/managerpos"> <i
					class="mdi mdi-grid-large menu-icon"></i> <span
					class="menu-title">포스 화면</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="/settlement/settlementlist"> <i
					class="mdi mdi-file-document-box-outline menu-icon"></i> <span
					class="menu-title">정산</span> -->
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="/loss/losslist"> <i
					class="mdi mdi-file-document-box-outline menu-icon"></i> <span
					class="menu-title">손실</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
						href="/salesstatistics/saleslist"> <i
							class="mdi mdi-file-document-box-outline menu-icon"></i> <span
							class="menu-title">매출</span>
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

			<%-- <c:if test="${empty Employeelogin}">
			<li class="nav-item"><a class="nav-link"
				href="/member/EmployeeLogin"> <i
				class="mdi mdi-file-document-box-outline menu-icon"></i> <span
					class="menu-title">직원 로그인</span>
			</a></li>
			</c:if> --%>
			<li class="nav-item"><a class="nav-link"
				href="/member/MemberList"> <i
				class="mdi mdi-file-document-box-outline menu-icon"></i> <span
					class="menu-title">회원 관리</span>
			</a></li>


			<li class="nav-item"><a class="nav-link"
				href="/userOrderManager/orderManager"> <i
				class="mdi mdi-file-document-box-outline menu-icon"></i> <span
					class="menu-title">상품 사용자뷰 관리</span> 
			</a></li>					

		</ul>
</nav>
<script type="text/javascript">
$(".accordion_wrap > a").click(function(){
    // 현재 클릭한 태그가 a 이기 때문에
    // a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
    $(this).next("ul").toggleClass("accordion_content");
    console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
});
</script>