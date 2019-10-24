<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- <link rel="stylesheet" href="/resources/css/chatCss.css"> -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<body>

<div class="modal" id="chatModal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal body -->
				<div class="card" >
					<div class="card-body" style="height: 650px;">
						
							<h2>상품 주문 상세 내역<button type="button" class="btn btn-warning" style="float: right;"><font style="color:white;">알림</font></button></h2>
							

								
							<button 
							       type="button" class="btn btn-secondary">닫기</button>	
						</div>
					</div>
				</div>
			</div>

</div>



	

</body>
<script src="/resources/js/userWebsocket.js?ver=1"></script>
<script type="text/javascript">
function getParameter(strParamName) {
    var arrResult = null;
    if (strParamName) {
        arrResult = location.search.match(new RegExp("[&?]" + strParamName+"=(.*?)(&|$)"));
        return arrResult && arrResult[1] ? arrResult[1] : null;
    }
}

var sessionValue = "<c:out value = '${admin}' />";
var memberid = "<c:out value='${memberid}' />";
var chatRoom = getParameter("room");
var rightLeft;
var checkInOut;
var test;

$(document).ready(function() {
	$("#chatTile").html("");
	$("#chatTile").append(chatRoom + "방 채팅")
	for(var i = 1; i < 7; i++) {
		$("#messages" + i).hide();
	}
   
	$("#messages" + chatRoom).show();
});

</script>