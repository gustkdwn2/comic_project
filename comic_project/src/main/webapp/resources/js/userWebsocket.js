var socket = null;
$(document).ready(function() {
	let ws = new WebSocket("ws://localhost:8080/echo");
	socket = ws;

	ws.onopen = function() {
		console.log("소켓 시작");
	};

	ws.onmessage = function(event) {
		var textData = event.data.split('|');
		test = textData[0];
		message_side = 'left';
		sendMessage(textData[1]);
	};

	ws.onclose = function() {
		console.log("소켓 끝");
	};
	
	var Message;
	Message = function(arg) {
		this.text = arg.text, this.message_side = arg.message_side;
		this.draw = function(_this) {
			return function() {
				var $message;
				test = chatRoom;
				console.log(test);
				$message = $($('.message_template' + test).clone().html());
				$message.addClass(_this.message_side).find('.text').html(
						_this.text);
				$('#messages' + test).append($message);
				return setTimeout(function() {
					return $message.addClass('appeared');
				}, 0);
			};
		}(this);
		return this;
	};

	var getMessageText, message_side, sendMessage;
	getMessageText = function() {
		var $message_input;
		$message_input = $('.message_input');
		return $message_input.val();
	};
	sendMessage = function(text) {
		var $messages, message;
		if (text.trim() === '') {
			return;
		}
		$messages = $('.messages');
		
		message = new Message({
			text : text,
			message_side : message_side
		});
		message.draw();
		
		return $messages.animate({
			scrollTop : $messages.prop('scrollHeight')
		}, 300);
	};
	
	$('.send_message').click(function(e) {
		message_side = 'right';
		sendMessage(getMessageText());
		if(sessionValue == 'admin') {
			checkInOut = 'user';
		} else {
			checkInOut = 'admin';
		}
		
		console.log($('.message_input').val());
		socket.send("chat," + chatRoom + "," + checkInOut + "," + $('.message_input').val());
		$('.message_input').val('');
	});
	
	$('.message_input').keyup(function(e) {
		if (e.which === 13) { 
			message_side = 'right';
			sendMessage(getMessageText());
			if(sessionValue == 'admin') {
				checkInOut = 'user';
			} else {
				checkInOut = 'admin';
			}
			
			console.log($('.message_input').val());
			socket.send("chat," + chatRoom + "," + checkInOut + "," + $('.message_input').val());
			$('.message_input').val('');
		}
	});
});

