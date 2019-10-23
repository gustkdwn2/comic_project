var socket = new WebSocket("ws://10.10.10.173:8080/echo_order");
socket.onopen = function() {
	console.log("소켓 시작");
};

socket.onmessage = function(event) {
	console.log(event.data);
	var data = event.data.split('|');
	if(data[1] == "주문") {
		console.log("test");
		orderArlet(data[0], data[2]);
	//	realOrder();
	} else if(data[1] == "시작") {
		ajaxtosenddb_comic_room_use2(data[2], data[0], "on");
	}
	
};

socket.onclose = function() {
	console.log("소켓 끝");
};

function orderArlet(roomNum, userid) {
	$("#ModalorderArlet").modal("show");
	$("#orderModalBody").append(roomNum + " 방"  + userid + "님 주문!");
}

function ajaxtosenddb_comic_room_use2(roomuse_id, roomuse_num,
		roomuse_status) {
	var list = [ roomuse_id, roomuse_num,
		roomuse_status];
	//사용자,시작시간,사용자 상태,주문 상태,방번호
	//alert("보내기전의 list" + list);
	var sendData = {
		'list' : list
	};

	$.ajax({
		url : '/managerpos/room_start2',
		dataType : 'json',
		data : JSON.stringify(sendData),
		contentType : "application/json; charset=utf-8;",
		type : 'POST',
		success : function(data) {
			ajaxtogetdb_comic_room_uselist();
			console.log("성공");
		},
		error : function(data) {
			console.log("실패");
		}
	});
}

function ajaxtogetdb_comic_room_uselist() {			
	console.log("ajaxtogetdb_comic_room_uselist");
	$.ajax({
		url : '/managerpos/get_room_uselist',
		dataType : 'json',
		contentType : "application/json; charset=utf-8;",
		type : 'POST',
		success : function(data) {
			
			var text="";
			console.log(data);
			$.each(data, function(index,list){
				var number=1;
				number = list.roomuse_num;
					startnstop_init(list.roomuse_id,number,list.starttime,list.roomuse_status);
			});
			
		},
		error : function(data) {
			console.log("실패");
		}
	});	
}