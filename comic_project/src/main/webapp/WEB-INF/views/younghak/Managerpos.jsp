<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
* {
  box-sizing: border-box;
}

body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

/* The grid: Three equal columns that floats next to each other */
.column {
  float: left;
  width: 30.0%;
  padding: 50px;
  text-align: center;
  font-size: 25px;
  cursor: pointer;
  color: gray;
  margin-left: 10px;
  height: 230px;
}

.containerTab {
  padding: 20px;
  color: white;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Closable button inside the container tab */
.closebtn {
  float: right;
  color: white;
  font-size: 35px;
  cursor: pointer;
}
</style>

</head>
<body style="overflow: scroll">

  <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-12 grid-margin stretch-card">
              <div class="card">
                <div class="row">
                  <div class="col-md-6">
                    <div class="card-body">
                      <%-- <h4 class="card-title">Single color buttons</h4>
                      <p class="card-description">Add class <code>.btn-{color}</code> for buttons in theme colors</p> --%>
                      <div class="template-demo">
                      
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="card-body">
                      
                       <div class="template-demo">
                        <button type="button" 
                        	onclick="javascript:window.location.href='importdetail'"
                         class="btn btn-primary btn-rounded btn-fw">수입 상세 검색</button>
                          <button type="button"
                         onclick="javascript:window.location.href='Managerpos'"
                          class="btn btn-danger btn-rounded btn-fw">포스기 화면</button>
                        <button type="button"
                        onclick="javascript:window.location.href='login'"
                         class="btn btn-secondary btn-rounded btn-fw">출퇴근하기</button>
                        <button type="button" class="btn btn-success btn-rounded btn-fw">직원관리</button>
                      
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-12 grid-margin stretch-card">
              <div class="card">
                <div class="row">
                  <div class="col-md-12">
                    <div class="card-body">
                      <h4 class="card-title">Outlined buttons</h4>
                      <p class="card-description">Add class <code>.btn-outline-{color}</code> for outline buttons</p>
                      <div class="template-demo">

<div class="row">
  <div class="column" onclick="pos_start('1');" style="background:#F6CEF5;">
    1번방
    <input type="button" value="wow">
    <input type="button" value="wow2">
    <br>
    <input type="button" value="wow3">
    
  </div>

  <div class="column" onclick="pos_start('2');" style="background:#E6E6E6;">
    2번방
  </div>
  <div class="column" onclick="openTab('b3');" style="background:#EFF8FB;">
    Box 3
  </div>
</div>
<br>

<div class="row">
  <div class="column" onclick="openTab('b1');" style="background:#58FAF4;">
    Box 4
  </div>
  <div class="column" onclick="openTab('b2');" style="background:#BEF781;">
    Box 5
  </div>
  <div class="column" onclick="openTab('b3');" style="background:#F3F781;">
    Box 6
  </div>
</div>
 </div>
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
              </div> --%>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:../../partials/_footer.html -->
       
      </div>
      <!-- main-panel ends -->
      
      
<script>
function openTab(tabName) {
  var i, x;
  x = document.getElementsByClassName("containerTab");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  document.getElementById(tabName).style.display = "block";
}

function pos_start(roomnum){
	alert(roomnum+"번 방 시작");
	
}

</script>
      
	
</body>
</html>