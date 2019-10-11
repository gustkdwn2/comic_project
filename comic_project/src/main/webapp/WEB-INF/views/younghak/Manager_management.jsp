<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="false"%>

<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>


<!DOCTYPE html>
<html>
<head>
<style>

  .mngmentcard {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 5);
  max-width: 300px;
  margin: auto;
  text-align: center;
  font-family: arial;
  padding: 5px 1px 3px 3px;
  /* margin: 5px 1px 13px 3px; */
  /* border-radius: 100%; */ /* 둥글게하는것 */
}  
 
.mngmenttitle {
  color: grey;
  font-size: 18px;
} 

.mngmentbutton {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

.mngmenta {
  text-decoration: none;
  font-size: 22px;
  color: black;
}

.mntmentbutton:hover, .mngmenta:hover {
  opacity: 0.7;
} 
</style>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
  <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <%@ include file="./younghak_header.jsp"%>
<div class="col-12 grid-margin stretch-card">            
  <div class="card">
    <div class="row">
      <div class="col-md-12">
        <div class="card-body">
        
<!--                       
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5"> -->
  
  
<button type="button" id="AdminModal" class="btn btn-primary">직원 추가</button>
<br><br>
<div class="template-demo">
<div class="row">

<c:forEach var="i" begin="1" end="${managerList.size()}" step="1">


<!-- <div class="row"> -->
<div class="mngmentcard" onclick="#">

  <!-- <img src="/WEB-INF/views/younghak/icando.jpg" alt="John" style="width:80%; height:80%; border-radius: 50%;" > -->
  <a href="#">
<img src="/resources/images/faces/jang.jpg" alt="${managerList.get(i-1).getEMPLOYEE_NAME()}"
 style="width:50%; height:50%; border-radius: 50%;" 
 onclick="workhourcal('${managerList.get(i-1).getEMPLOYEE_NAME()}','${managerList.get(i-1).getEMPLOYEE_NUM()}')">
</a>

<h1>${managerList.get(i-1).getEMPLOYEE_NAME()} </h1> <!-- 이름 -->
<p class="mngmenttitle">${managerList.get(i-1).getEMPLOYEE_POSITION()}</p>
<p>사번 : ${managerList.get(i-1).getEMPLOYEE_NUM()}</p>

<p>입사일 :
<fmt:formatDate value="${managerList.get(i-1).getEMPLOYEE_STARTDAY()}" pattern="yy.MM.dd"/>
</p>
<p>연락처 : ${managerList.get(i-1).getEMPLOYEE_PHONE()}</p>
<p>시급/월급 : ${managerList.get(i-1).getEMPLOYEE_PAY()}</p>
<p>계좌번호 : ${managerList.get(i-1).getEMPLOYEE_ACCOUNT()}</p>

<div style="margin: 24px 0;">

<!-- </div> -->
  <p><button class="mngmentbutton">수정하기</button></p>
  <p><button class="mngmentbutton" 
  onclick="employeedelete(${managerList.get(i-1).getEMPLOYEE_NUM()})">탈퇴하기</button></p>
  
  <a href="#" class="mngmenta"><i class="fa fa-dribbble"></i></a> 
<a href="#" class="mngmenta"><i class="fa fa-twitter"></i></a>  
<a href="#" class="mngmenta"><i class="fa fa-linkedin"></i></a>  
<a href="#" class="mngmenta"><i class="fa fa-facebook"></i></a> 
</div>
</div>

<c:if test="${i%3==0}">

</div><div class="row">
</c:if>


</c:forEach>
</div></div>


<!-- 
            </div>
          </div>
        </div>
      
      content-wrapper ends
    </div>
    page-body-wrapper ends -->


  </div>
</div>
<!-- <div class="col-md-0"> -->
<div class="card-body">
  <%-- <h4 class="card-title">Inverse buttons</h4>
<p class="card-description">Add class <code>.btn-inverse-{color} for inverse buttons</code></p> --%>
          <div class="template-demo">
           
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
      </div> 
    </div>
  </div>
</div>

    <div class="card-body">
      <h4 class="card-title">Social button with text</h4>
      <p class="card-description">Add class <code>.btn-social-icon-text</code></p>
            <div class="template-demo">
              <button type="button" class="btn btn-social-icon-text btn-facebook"><i class="mdi mdi-facebook"></i>Facebook</button>
              <button type="button" class="btn btn-social-icon-text btn-youtube"><i class="mdi mdi-youtube"></i>Youtube</button>                                        
              <button type="button" class="btn btn-social-icon-text btn-twitter"><i class="mdi mdi-twitter"></i>Twitter</button>
              <button type="button" class="btn btn-social-icon-text btn-dribbble"><i class="mdi mdi-dribbble"></i>Dribbble</button>
              <button type="button" class="btn btn-social-icon-text btn-linkedin"><i class="mdi mdi-linkedin"></i>Linkedin</button>
              <button type="button" class="btn btn-social-icon-text btn-google"><i class="mdi mdi-google-plus"></i>Google</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
 
</div>
<!-- main-panel ends -->

<!-- 인서트Modal 추가 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="ModalLabel">직원 추가</h4>
         </div>
         <div class="modal-body">
            <form class="pt-3" id="register" action="/EmployeeRegister" method="post">
                  <div class="form-group">
                     <label>이름</label> <input type="text"
                        class="form-control form-control-lg" name="EMPLOYEE_NAME"
                        placeholder="Name">
                  </div>
                  <div class="form-group">
                     <label>비밀번호</label> <input type="text"
                        class="form-control form-control-lg" name="EMPLOYEE_PWD"
                        placeholder="Password">
                  </div>
                  <div class="form-group">
                     <label>핸드폰 번호</label> <input type="email"
                        class="form-control form-control-lg" name="EMPLOYEE_PHONE"
                        placeholder="Phone">
                  </div>
                  <div class="form-group">
                     <label>계좌 번호</label> <input type="text"
                        class="form-control form-control-lg" name="EMPLOYEE_ACCOUNT"
                        placeholder="Account">
                  </div>
                  <div class="form-group">
                     <label>직책</label> <input type="text"
                        class="form-control form-control-lg" name="EMPLOYEE_POSITION"
                        placeholder="Position">
                  </div>
                  <div class="form-group">
                     <label>시급/월급</label> <input type="text"
                        class="form-control form-control-lg" name="EMPLOYEE_PAY"
                        placeholder="Pay">
                  </div>
            </form>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary" onclick="document.getElementById('register').submit()">추가</button>
      <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
   </div>
</div>
<!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
</div>
<!-- /.modal -->



<!-- 삭제Modal 추가 -->
<div class="modal fade" id="mngdeleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" 
aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="ModalLabel">탈퇴 하기</h4>
         </div>
         <div class="modal-body">
            <form class="pt-3" id="EmployeeDelete" action="/managerpos/EmployeeDelete" method="post">
                  <div class="form-group">
                  <h3>사번 : <font id="deletemodalmngnum"/> </h3>
                     <label>비밀번호</label> 
                     <input type="text"
                        class="form-control form-control-lg" name="EMPLOYEE_PWD"
                        placeholder="Password">
                     <input type="hidden"
                     id="EMPLOYEE_mngnum"
                        class="form-control form-control-lg" name="EMPLOYEE_mngnum">
                  </div>
                  
            </form>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary" onclick="document.getElementById('EmployeeDelete').submit()">탈퇴</button>
      <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
   </div>
</div>
<!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script type="text/javascript">
$("#AdminModal").on("click", function() {
   $("#myModal").modal("show");   
});


function employeedelete(employee_num){
	
	$("#mngdeleteModal").modal("show");
	document.getElementById("deletemodalmngnum").innerHTML=employee_num;
	document.getElementById("EMPLOYEE_mngnum").value=employee_num;
	
}

function workhourcal(empname,empnum){	
	
	var url = "/managerpos/workhourcalendar";
	posttourl(url,{'empname':empname,'empnum':empnum});
	//alert(empname);	
}



function posttourl(path, params, method) {
    method = method || "post"; // Set method to post by default, if not specified.
    // The rest of this code assumes you are not using a library.
    // It can be made less wordy if you use one.
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);
    for(var key in params) {
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", params[key]);
        form.appendChild(hiddenField);
    }
    document.body.appendChild(form);
    form.submit();
}


</script>

</body>
</html>