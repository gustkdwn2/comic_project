<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="/resources/css/chatCss.css">
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<body>
	<div class="chat_window">
		<div class="top_menu">
			<div class="buttons">
				<div class="button close" id="close"></div>
				<div class="button minimize"></div>
				<div class="button maximize"></div>
			</div>
			<div id="chatTile" class="title"></div>
		</div>
		<ul class="messages" id="messages1"></ul>
		<ul class="messages" id="messages2"></ul>
		<ul class="messages" id="messages3"></ul>
		<ul class="messages" id="messages4"></ul>
		<ul class="messages" id="messages5"></ul>
		<ul class="messages" id="messages6"></ul>
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
	<div class="message_template1">
		<li class="message"><div class="avatar"></div>
			<div class="text_wrapper">
				<div class="text"></div>
			</div></li>
	</div>
	<div class="message_template2">
		<li class="message"><div class="avatar"></div>
			<div class="text_wrapper">
				<div class="text"></div>
			</div></li>
	</div>
	<div class="message_template3">
		<li class="message"><div class="avatar"></div>
			<div class="text_wrapper">
				<div class="text"></div>
			</div></li>
	</div>
	<div class="message_template4">
		<li class="message"><div class="avatar"></div>
			<div class="text_wrapper">
				<div class="text"></div>
			</div></li>
	</div>
	<div class="message_template5">
		<li class="message"><div class="avatar"></div>
			<div class="text_wrapper">
				<div class="text"></div>
			</div></li>
	</div>
	<div class="message_template6">
		<li class="message"><div class="avatar"></div>
			<div class="text_wrapper">
				<div class="text"></div>
			</div></li>
	</div>

</body>
<script src="/resources/js/userWebsocket.js"></script>
<script type="text/javascript">
function getParameter(strParamName) {
    var arrResult = null;
    if (strParamName) {
        arrResult = location.search.match(new RegExp("[&?]" + strParamName+"=(.*?)(&|$)"));
        return arrResult && arrResult[1] ? arrResult[1] : null;
    }
}

var sessionValue = "<c:out value = '${admin}' />";
var chatRoom = getParameter("room");
console.log("tesdtes " + chatRoom);
var rightLeft;
var checkInOut;
var test;

$(document).ready(function() {
	$("#chatTile").html("");
	$("#chatTile").append(chatRoom + "방 채팅")
	$("#messages1").hide();
	$("#messages2").hide(); 
	$("#messages" + chatRoom).show();
});

</script>
</html>