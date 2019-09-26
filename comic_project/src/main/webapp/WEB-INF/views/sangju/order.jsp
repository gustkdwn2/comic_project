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
	<h1>order</h1>

	<div>
		<ul>
			<c:forEach items="${ OrderViewVO_List }" var="list">
				<li><button class="categoryButton"
						value="${ list.orderview_category }">${ list.orderview_category }</button>
					<a href="#" class="categoryUpdate" value="${ list.orderview_num }">[수정]</a>
					<a href="#" class="categoryDelete" value="${ list.orderview_num }">[삭제]</a></li>
			</c:forEach>
		</ul>
	</div>
	<hr>
	<div></div>
</body>
<script type="text/javascript">


</script>
</html>