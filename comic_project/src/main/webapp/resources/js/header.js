$('button[name=modifyBtn]').click(
		function() {
			var MEMBER_ID = $(this).attr('value');

			$
					.ajax({
						type : 'get',
						url : "/member/MemberModify?MEMBER_ID=" + MEMBER_ID,
						success : function(data) {
							$('#MEMBER_ID2').attr('value',
									data.getModify['member_ID']);
							$('#MEMBER_NAME2').attr('value',
									data.getModify['member_NAME']);
							$('#MEMBER_EMAIL2').attr('value',
									data.getModify['member_EMAIL']);
							$('#MEMBER_PHONE_NUMBER2').attr('value',
									data.getModify['member_PHONE_NUMBER']);
							$('#MemberModifyModal').show();
						}
					});
		});

function memmodify() {
	console.log("여기 들어옴?")
	var membermodify = $("form[name=membermodify]").serialize();
	$.ajax({
		type : 'post',
		url : '/member/MemberModify2',
		data : membermodify,
		success : function(result) {
			alert(result);
		}
	});
}

function validate() {
	var re = /^[a-zA-Z0-9]{4,12}$/ // 패스워드가 적합한지 검사할 정규식
	var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일이 적합한지 검사할 정규식
	var regExp = /^\d{3}-\d{3,4}-\d{4}$/; // 핸드폰번호 정규식

	var id = document.getElementById("MEMBER_ID2");
	var pw = document.getElementById("MEMBER_PWD2");
	var name = document.getElementById("MEMBER_NAME2")
	var email = document.getElementById("MEMBER_EMAIL2");
	var phone = document.getElementById("MEMBER_PHONE_NUMBER2");
	// ------------ 이메일 까지 -----------

	if (id.value == "") {
		alert("아이디를 입력해 주세요");
		id.focus();
		return false;
	}

	if (!check(re, pw, "패스워드는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.")) {
		return false;
	}

	if (pw.value == "") {
		alert("비밀번호를 입력해 주세요");
		pw.focus();
		return false;
	}

	if (name.value == "") {
		alert("이름을 입력해 주세요");
		name.focus();
		return false;
	}

	if (email.value == "") {
		alert("이메일을 입력해 주세요");
		email.focus();
		return false;
	}

	if (!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
		return false;
	}

	if (!check(regExp, phone, "적합하지 않은 번호 형식입니다.")) {
		return false;
	}
}

function check(re, what, message) {
	if (re.test(what.value)) {
		return true;
	}
	alert(message);
	what.value = "";
	what.focus();
	//return false;
}