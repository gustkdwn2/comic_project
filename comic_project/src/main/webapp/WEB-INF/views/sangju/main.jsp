<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<h1>User</h1>
	<button data-oper='chat'>chat</button>
	<button data-oper='order'>order</button>
	<button></button>
	<button></button>
	<button></button>
	<button></button>
	<form id='actionForm' method="get">
	</form>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		var actionForm = $("#actionForm");
		$("button[data-oper='order']").on("click", function(e) {
			
			actionForm.append("<input type='hidden' name='roomNum' value='" + ${roomNum} + "'>");
			actionForm.attr("action", "/sangju/order");
			actionForm.submit();

		});
	
	});
</script>
</html>
