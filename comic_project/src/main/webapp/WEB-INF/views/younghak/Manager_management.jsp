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
                    
                      
    <!-- <div class="container-fluid page-body-wrapper full-page-wrapper"> -->
      
        <!-- <div class="row w-100 mx-0"> -->
          <!-- <div class="col-lg-4 mx-auto"> -->
            <!-- <div class="auth-form-light text-left py-5 px-4 px-sm-5"> -->
                <button type="button" id="AdminModal" class="btn btn-primary">직원 추가</button>
    <!--         </div> -->
          <!-- </div> -->
        <!-- </div> -->
      
      <!-- content-wrapper ends -->
    <!-- </div> -->
    <!-- page-body-wrapper ends -->
  
  
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

  <!-- Modal 추가 -->
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
                                 <label>주소</label> <input type="text"
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
            
              <script type="text/javascript">
  $("#AdminModal").on("click", function() {
     $("#myModal").modal("show");   
  });
  </script>

</body>
</html>