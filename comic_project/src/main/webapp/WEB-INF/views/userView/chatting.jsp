<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/chatCss.css">
	<div class="chat_window" id="chat_window">
		<div class="top_menu">
			<div class="buttons">
				<div class="button close" id="close"></div>
				<div class="button minimize"></div>
				<div class="button maximize"></div>
			</div>
			<div class="title">Chat</div>
		</div>
		<ul class="messages" id="messages${ roomNum }"></ul>
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

<script src="/resources/js/userWebsocket.js"></script>
<script type="text/javascript">
var messages = $("#messages" + sessionValue);
var sessionValue = ${roomNum};
var chatRoom = sessionValue;
var rightLeft;
var checkInOut;
var test;
</script>
