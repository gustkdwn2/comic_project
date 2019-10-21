<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<link rel="stylesheet" href="/resources/css/chatCss.css">
<body>
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-lg-12 grid-margin">
					<div class="card">
						<div class="card-body">
							<h4>채팅 테스트</h4>
							<hr>

							<button name="roomChat" value="1" class="btn btn-primary btn-icon-text">1번방</button>
							<button name="roomChat" value="2" class="btn btn-primary btn-icon-text">2번방</button>
							<button name="roomChat" value="3" class="btn btn-primary btn-icon-text">3번방</button>
							<button name="roomChat" value="4" class="btn btn-primary btn-icon-text">4번방</button>
							<button name="roomChat" value="5" class="btn btn-primary btn-icon-text">5번방</button>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="chat_window" id="chat_window">
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

</body>

<script type="text/javascript">
var sessionValue = "<c:out value = '${admin}' />";
var chatRoom;
var rightLeft;
var checkInOut;
var test;

$(document).ready(function() {
	var modalChatView = $("#chat_window");
	modalChatView.hide();
	$("#messages1").hide();
	$("#messages2").hide(); 
			
	$("button[name='roomChat']").on("click", function(e) {
		modalChatView.show();
		$("#chatTile").html("");
		$("#chatTile").append($(this).attr('value') + "방 채팅")
		chatRoom = $(this).attr('value');
		$("#messages" + chatRoom).show();
	});

	$("#close").on("click", function(e) {
		$("#messages1").hide();
		$("#messages2").hide(); 
		modalChatView.hide();
	});
});



</script>
</html>