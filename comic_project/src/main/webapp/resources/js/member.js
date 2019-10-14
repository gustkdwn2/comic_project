function validate() {
      var re = /^[a-zA-Z0-9]{4,12}$/ // 패스워드가 적합한지 검사할 정규식
      var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;  // 이메일이 적합한지 검사할 정규식
      var regExp = /^\d{3}-\d{3,4}-\d{4}$/; // 핸드폰번호 정규식
     

      var id = document.getElementById("MEMBER_ID");
      var pw = document.getElementById("MEMBER_PWD");
      var name = document.getElementById("MEMBER_NAME")
      var email = document.getElementById("MEMBER_EMAIL");
	  var phone = document.getElementById("MEMBER_PHONE_NUMBER");
      // ------------ 이메일 까지 -----------
      
      if(id.value=="") {
    	  alert("아이디를 입력해 주세요");
          id.focus();
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
      
      if(!check(regExp, phone, "적합하지 않은 번호 형식입니다.")) {
    	  return false;
      }
  }

  function check(re, what, message) {
      if(re.test(what.value)) {
          return true;
      }
      alert(message);
      what.value = "";
      what.focus();
      //return false;
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
                  $(".auth-form-btn").prop("disabled", false);
                  $(".auth-form-btn").css("background-color", "#4d83ff");
                  $("#MEMBER_ID").css("background-color", "#FFFFFF");
                  idCheck = 0;
              } else if (data == '0') {
                  $("#MEMBER_ID").css("background-color", "#B0F6AC");
                  idCheck = 1;
                  if(idCheck==1) {
                      $(".auth-form-btn").prop("disabled", false);
                      $(".auth-form-btn").css("background-color", "#4d83ff");
                  } 
              } else if (data == '1') {
                  $(".auth-form-btn").prop("disabled", true);
                  $(".auth-form-btn").css("background-color", "#aaaaaa");
                  $("#MEMBER_ID").css("background-color", "#FFCECE");
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