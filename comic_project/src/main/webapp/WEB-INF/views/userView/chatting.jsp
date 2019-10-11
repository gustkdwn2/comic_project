<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/userHeader.jsp"%>

<body>
	<h1>chatting</h1>
<input type="text" id="message">
<input type="button" id="sendBtn" value="전송">
<div id="chatData"></div>

</body>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#sendBtn").click(function(){
		console.log('send message...');
		sendMessage();
		$("#message").val('');
	});

	$("#message").keydown(function(key){
		if(key.keyCode == 13) {
			sendMessage();
			$("#message").val('');
		}
	});
}); 

let sock = new SockJS("<c:url value='/echo' />");
sock.onmessage = onMessage; 
sock.onclose = onClose;

function sendMessage() {
	sock.send($("#message").val());
}

function onMessage(evt) {
	var data = evt.data;
	var sessionid = null;
	var message = null;

	var strArray = data.split('|');

	for(var i = 0; i < strArray.length; i++) {
		console.log('str[' + i + ']: ' + strArray[i]);
	}

	var currentuser_session = $("#sessionuserid").val();
	console.log('current session id: ' + currentuser_session);

	sessionid = strArray[0];
	message = strArray[1];

	if(sessionid == currentuser_session) {
 		var printHTML = "<div class='well>";
 		printHTML += "<div class='alert alert-info>";
 		printHTML += "<strong>[" + sessionid + "] -> " + message + "</strong>";
 		printHTML += "</div>";
 		printHTML += "</div>";

 		$("#chatData").append(printHTML);
	} else {
		var printHTML = "<div class='well>";
 		printHTML += "<div class='alert alert-warning>";
 		printHTML += "<strong>[" + sessionid + "] -> " + message + "</strong>";
 		printHTML += "</div>";
 		printHTML += "</div>";

 		$("#chatData").append(printHTML);
	}

	console.log('chatting data: ' + data);
}

function onClose(evt) {
	$('#data').append("연결 끊김");
}
</script>
</html>