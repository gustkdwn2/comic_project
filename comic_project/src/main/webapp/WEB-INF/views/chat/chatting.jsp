<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
* {
  box-sizing: border-box;
}

body {
  background-color: #edeff2;
  font-family: "Calibri", "Roboto", sans-serif;
}

.chat_window {
  position: absolute;
  width: calc(100% - 20px);
  max-width: 800px;
  height: 500px;
  border-radius: 10px;
  background-color: #fff;
  left: 50%;
  top: 50%;
  transform: translateX(-50%) translateY(-50%);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
  background-color: #f8f8f8;
  overflow: hidden;
}

.top_menu {
  background-color: #fff;
  width: 100%;
  padding: 20px 0 15px;
  box-shadow: 0 1px 30px rgba(0, 0, 0, 0.1);
}
.top_menu .buttons {
  margin: 3px 0 0 20px;
  position: absolute;
}
.top_menu .buttons .button {
  width: 16px;
  height: 16px;
  border-radius: 50%;
  display: inline-block;
  margin-right: 10px;
  position: relative;
}
.top_menu .buttons .button.close {
  background-color: #f5886e;
}
.top_menu .buttons .button.minimize {
  background-color: #fdbf68;
}
.top_menu .buttons .button.maximize {
  background-color: #a3d063;
}
.top_menu .title {
  text-align: center;
  color: #bcbdc0;
  font-size: 20px;
}

.messages {
  position: relative;
  list-style: none;
  padding: 20px 10px 0 10px;
  margin: 0;
  height: 347px;
  overflow: scroll;
}
.messages .message {
  clear: both;
  overflow: hidden;
  margin-bottom: 20px;
  transition: all 0.5s linear;
  opacity: 0;
}
.messages .message.left .avatar {
  background-color: #f5886e;
  float: left;
}
.messages .message.left .text_wrapper {
  background-color: #ffe6cb;
  margin-left: 20px;
}
.messages .message.left .text_wrapper::after, .messages .message.left .text_wrapper::before {
  right: 100%;
  border-right-color: #ffe6cb;
}
.messages .message.left .text {
  color: #c48843;
}
.messages .message.right .avatar {
  background-color: #fdbf68;
  float: right;
}
.messages .message.right .text_wrapper {
  background-color: #c7eafc;
  margin-right: 20px;
  float: right;
}
.messages .message.right .text_wrapper::after, .messages .message.right .text_wrapper::before {
  left: 100%;
  border-left-color: #c7eafc;
}
.messages .message.right .text {
  color: #45829b;
}
.messages .message.appeared {
  opacity: 1;
}
.messages .message .avatar {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  display: inline-block;
}
.messages .message .text_wrapper {
  display: inline-block;
  padding: 20px;
  border-radius: 6px;
  width: calc(100% - 85px);
  min-width: 100px;
  position: relative;
}
.messages .message .text_wrapper::after, .messages .message .text_wrapper:before {
  top: 18px;
  border: solid transparent;
  content: " ";
  height: 0;
  width: 0;
  position: absolute;
  pointer-events: none;
}
.messages .message .text_wrapper::after {
  border-width: 13px;
  margin-top: 0px;
}
.messages .message .text_wrapper::before {
  border-width: 15px;
  margin-top: -2px;
}
.messages .message .text_wrapper .text {
  font-size: 18px;
  font-weight: 300;
}

.bottom_wrapper {
  position: relative;
  width: 100%;
  background-color: #fff;
  padding: 20px 20px;
  position: absolute;
  bottom: 0;
}
.bottom_wrapper .message_input_wrapper {
  display: inline-block;
  height: 50px;
  border-radius: 25px;
  border: 1px solid #bcbdc0;
  width: calc(100% - 160px);
  position: relative;
  padding: 0 20px;
}
.bottom_wrapper .message_input_wrapper .message_input {
  border: none;
  height: 100%;
  box-sizing: border-box;
  width: calc(100% - 40px);
  position: absolute;
  outline-width: 0;
  color: gray;
}
.bottom_wrapper .send_message {
  width: 140px;
  height: 50px;
  display: inline-block;
  border-radius: 50px;
  background-color: #a3d063;
  border: 2px solid #a3d063;
  color: #fff;
  cursor: pointer;
  transition: all 0.2s linear;
  text-align: center;
  float: right;
}
.bottom_wrapper .send_message:hover {
  color: #a3d063;
  background-color: #fff;
}
.bottom_wrapper .send_message .text {
  font-size: 18px;
  font-weight: 300;
  display: inline-block;
  line-height: 48px;
}

.message_template {
  display: none;
}

</style>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>

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
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script src="/resources/js/userWebsocket.js"></script>
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