$('input').keydown(function() {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
});

$("#login").on("click", function(e) {
	e.preventDefault();
	$("#memberlogin").submit();
});
var phone4 = document.getElementById("MEMBER_PHONE_NUMBER4");
var phone1,phone2,phone3,phone4;

function pwdmodify() {
	
	phone1 = $('#MEMBER_PHONE_NUMBER1').val();
	phone2 = $('#MEMBER_PHONE_NUMBER2').val();
	phone3 = $('#MEMBER_PHONE_NUMBER3').val();
	$('#MEMBER_PHONE_NUMBER4').val(phone1 + "-" + phone2 + "-" + phone3);
	
	var passwordmodify = $("form[name=passwordmodify]").serialize();
	console.log(passwordmodify);
	
	$.ajax({
		async: false,
		type : 'post',
		url : '/member/MemberPasswordModify',
		data : passwordmodify,
		success : function(result) {
			if(result == 'fail'){
				alert('정보를 잘못 입력했습니다.');
			} else {
				alert('임시비밀번호는'+ result + '입니다');
			}
		}
	});
	location.reload();
}

function home() {
	var operForm = $("#operForm");

	operForm.append("<input type='hidden' name='roomNum' value='" + roomNum
			+ "'>");
	operForm.attr("method", "post");
	operForm.attr("action", "/userView/main");
	operForm.submit();
}

function passwordmodifyBtn() {
	$('#PasswordModifyModal').show();
	
	$('#passwordmodifyclose').click(function(){
		$('#PasswordModifyModal').hide();
		$('#PasswordModifyModal').find('form')[0].reset();
	});
}

