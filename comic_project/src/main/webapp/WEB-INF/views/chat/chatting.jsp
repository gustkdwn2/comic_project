<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="/resources/css/chatCss.css">
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<body>
	<div class="chat_window" id="chat_window">
		<div class="top_menu">
			<div class="buttons">
				<div class="button close" id="close"></div>
				<div class="button minimize"></div>
				<div class="button maximize"></div>
			</div>
			<div class="title">${ roomNum }방 채팅</div>
		</div>
		<ul class="messages" id="messages${ roomNum }">
			<c:forEach items="${ chatList }" var="list">
			<c:if test="${ list.chat_id ne 'admin' }">
				<li class="message left appeared">
					<div class="avatar"></div>
					<div class="text_wrapper">
						<div class="text">${ list.chat_content }</div>
					</div>
				</li>
			</c:if>
			<c:if test="${ list.chat_id eq 'admin' }">
				<li class="message right appeared">
					<div class="avatar"></div>
					<div class="text_wrapper">
						<div class="text">${ list.chat_content }</div>
					</div> 
				</li>
			</c:if>
			</c:forEach>
		</ul>
		<div class="bottom_wrapper clearfix">
			<div class="message_input_wrapper">
				<input class="message_input" placeholder="Type your message here..." />
			</div>
			<div class="send_message">
				<div class="icon"></div>
				<div class="text">Send</div>
			</div>
		</div>
	</div>
	<div class="message_template${ roomNum }">
		<li class="message"><div class="avatar"></div>
			<div class="text_wrapper">
				<div class="text"></div>
			</div></li>

	</div>

</body>
<script src="/resources/js/userWebsocket.js?after"></script>
<script type="text/javascript">
var sessionValue = "<c:out value = '${admin}' />";
var memberid = "<c:out value='${memberid}' />";
var chatRoom = "<c:out value='${roomNum}' />";
var rightLeft;
var checkInOut;
var test;

$(document).ready(function() {
	
	$("#messages" + chatRoom).show();
});

</script>
</html>