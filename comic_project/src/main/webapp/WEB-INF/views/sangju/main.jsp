<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="resources/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="resources/vendors/base/vendor.bundle.base.css">
<link rel="stylesheet"
	href="resources/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="shortcut icon" href="resources/images/favicon.png" />


<script src="resources/vendors/base/vendor.bundle.base.js"></script>
<script src="resources/vendors/chart.js/Chart.min.js"></script>
<script src="resources/vendors/datatables.net/jquery.dataTables.js"></script>
<script
	src="resources/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
<script src="resources/js/off-canvas.js"></script>
<script src="resources/js/hoverable-collapse.js"></script>
<script src="resources/js/template.js"></script>
<script src="resources/js/dashboard.js"></script>
<script src="resources/js/data-table.js"></script>
<script src="resources/js/jquery.dataTables.js"></script>
<script src="resources/js/dataTables.bootstrap4.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Main</h1>
	<button id="order">상품주문</button>
	<button>채팅</button>
	<button></button>
	<button></button>
	<button></button>
	
	
</body>
<script type="text/javascript">
$(document).ready(function() {
	$("#order").on("click", function(){
		window.open("/order", "_blank","left=200, top=50, width=1200, height=800, location=no, menubar=no, resizable=no, status=no");
	});
});
</script>
</html>
