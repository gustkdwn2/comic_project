<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="main-panel">
	<div class="content-wrapper">
		<div class="row">
			<div class="col-md-12 grid-margin">
					<h1>User</h1>
					<button data-oper='chat'>chat</button>
					<button data-oper='order'>order</button>
					<button></button>
					<button></button>
					<button></button>
					<button></button>
					<form id='actionForm'></form>
				</div>
		</div>
	</div>
</div>

</body>

<script type="text/javascript">
	$(document).ready(function() {
		var actionForm = $("#actionForm");
		$("button[data-oper='order']").on("click", function(e) {
			console.log("<c:out value='${roomNum}' />");
			actionForm.attr("action", "/sangju/order");
			actionForm.submit();

		});
	});
</script>
</html>
