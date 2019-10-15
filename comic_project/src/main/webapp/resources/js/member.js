var reid = /^[a-zA-Z0-9]{4,10}$/ // 아이디가 적합한지 검사할 정규식
var re = /^[a-zA-Z0-9]{4,12}$/ // 패스워드가 적합한지 검사할 정규식
var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;  // 이메일이 적합한지 검사할 정규식
var regExp = /^\d{3}-\d{3,4}-\d{4}$/; // 핸드폰번호 정규식

var id = document.getElementById("MEMBER_ID");
var pw = document.getElementById("MEMBER_PWD");
var pw2 = document.getElementById("MEMBER_PWD_Check");
var name = document.getElementById("MEMBER_NAME")
var email = document.getElementById("MEMBER_EMAIL");
var phone,phone2,phone3,phone4;

function validate() {
	  phone1 = $('#MEMBER_PHONE_NUMBER1').val();
	  phone2 = $('#MEMBER_PHONE_NUMBER2').val();
	  phone3 = $('#MEMBER_PHONE_NUMBER3').val();
	  phone4 = phone1 + "-" + phone2 + "-" + phone3;
      if(id.value=="") {
    	  alert("아이디를 입력해 주세요");
          id.focus();
          return false;
      }
      
      if(!check(re,id,"아이디는 4~10자의 영문 대소문자와 숫자로만 입력해주세요.")) {
          return false;
      }
      
      if(!check(re,pw,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.")) {
          return false;
      }
      
      if(pw.value=="") {
    	  alert("비밀번호를 입력해 주세요");
          pw.focus();
          return false;
      }
      
      if(name.value=="") {
          alert("이름을 입력해 주세요");
          name.focus();
          return false;
      }

      if(email.value=="") {
          alert("이메일을 입력해 주세요");
          email.focus();
          return false;
      }

      if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
          return false;
      }
      
      if(!check(regExp, phone4, "적합하지 않은 번호 형식입니다.")) {
    	  return false;
      }
  }

  function check(re, what, message) {
      if(re.test(what.value)) {
          return true;
      }
      alert(message);
      if(what===phone4){
    	  $('#MEMBER_PHONE_NUMBER1').val('');
    	  $('#MEMBER_PHONE_NUMBER2').val('');
    	  $('#MEMBER_PHONE_NUMBER3').val('');
    	  $('#MEMBER_PHONE_NUMBER1').focus();
      } else {
      what.value = "";
      what.focus();
      }
      return false;
  }
  
  var idCheck = 0;
  function checkId() {
      var inputed = $('#MEMBER_ID').val();
      $.ajax({
          data : {
        	  MEMBER_ID : inputed
          },
          url : "/member/MemberCheck",
          success : function(data) {
              if(inputed=="" && data=='0') {
            	  $('#idCheckMessage').html('필수 정보입니다.');
                  idCheck = 0;
              } else if (data == '0') {
            	  $('#idCheckMessage').html('');
                  idCheck = 1;
              } else if (data == '1') {
            	  $('#idCheckMessage').html('중복된 아이디입니다.');
                  idCheck = 0;
              } 
          }
      });
  }
  
  function pwdCheck() {
		var pwd1 = $( '#MEMBER_PWD' ).val();
		var pwd2 = $( '#MEMBER_PWD_Check' ).val();
		if(pwd1 == pwd2) {
			$('#pwdCheckMessage').html('');
		} else {
			$('#pwdCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
		}
	}
  
  var roomNum = "<c:out value='${roomNum}'/>";
  console.log(roomNum);

  function home(){
		var operForm = $("#operForm");

		operForm.append("<input type='hidden' name='roomNum' value='" + roomNum + "'>");
		operForm.attr("method", "post");
		operForm.attr("action","/userView/main");
		operForm.submit();
	}