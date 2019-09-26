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
                      <%-- <h4 class="card-title">Rounded buttons</h4>
                      <p class="card-description">Add class <code>.btn-rounded</code></p>
                       --%>
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
 
 <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">

          <div class="col-md-1 pt-3">
            <div class="form-group ">
               <select id="searchCtgr" name="searchCtgr" class="form-control">
                  <option selected>전체</option>
                  <option>ID별 검색</option>
                  <option>날짜별 검색</option>
                  <option>방 번호별 검색</option>
                  <option>물품별 검색</option>
               </select>
            </div>
         </div> 
				<ul class="navbar-nav mr-lg-4 w-100">
					<li class="nav-item nav-search d-none d-lg-block w-100">
					
 <div class="input-group">
				<div class="input-group-prepend">
				
					<span class="input-group-text" id="search"> <i
						class="mdi mdi-magnify"></i>
					</span>
					
				</div>
				<input type="text" class="form-control" placeholder="Search now"
					aria-label="search" aria-describedby="search">
				<input type="button" class="input-group-text" value="검색" onclick="javascript:alert(0)">
			</div>
			</li>
				</ul>
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


</body>
</html>