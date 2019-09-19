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
                       <!--  <button type="button" class="btn btn-primary">Primary</button>
                        <button type="button" class="btn btn-secondary">Secondary</button>
                        <button type="button" class="btn btn-success">Success</button>
                        <button type="button" class="btn btn-danger">Danger</button>
                        <button type="button" class="btn btn-warning">Warning</button>
                        <button type="button" class="btn btn-info">Info</button>
                        <button type="button" class="btn btn-light">Light</button>
                        <button type="button" class="btn btn-dark">Dark</button>
                        <button type="button" class="btn btn-link">Link</button> -->
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
                        	onclick="javascript:window.location.href='importdetail.co'"
                         class="btn btn-primary btn-rounded btn-fw">수입 상세 검색</button>
                          <button type="button"
                         onclick="javascript:window.location.href='Managerpos.co'"
                          class="btn btn-danger btn-rounded btn-fw">포스기 화면</button>
                        <button type="button"
                        onclick="javascript:window.location.href='login.co'"
                         class="btn btn-secondary btn-rounded btn-fw">출퇴근하기</button>
                        <button type="button" class="btn btn-success btn-rounded btn-fw">직원관리</button>
                        <!-- <button type="button" class="btn btn-danger btn-rounded btn-fw">Danger</button>
                        <button type="button" class="btn btn-warning btn-rounded btn-fw">Warning</button>
                        <button type="button" class="btn btn-info btn-rounded btn-fw">Info</button>
                        <button type="button" class="btn btn-light btn-rounded btn-fw">Light</button>
                        <button type="button" class="btn btn-dark btn-rounded btn-fw">Dark</button>
                        <button type="button" class="btn btn-link btn-rounded btn-fw">Link</button> -->
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
<!--                         <button type="button" class="btn btn-outline-primary btn-fw">Primary</button>
                        <button type="button" class="btn btn-outline-secondary btn-fw">Secondary</button>
                        <button type="button" class="btn btn-outline-success btn-fw">Success</button>
                        <button type="button" class="btn btn-outline-danger btn-fw">Danger</button>
                        <button type="button" class="btn btn-outline-warning btn-fw">Warning</button>
                        <button type="button" class="btn btn-outline-info btn-fw">Info</button>
                        <button type="button" class="btn btn-outline-light btn-fw">Light</button>
                        <button type="button" class="btn btn-outline-dark btn-fw">Dark</button>
                        <button type="button" class="btn btn-link btn-fw">Link</button>
                        <div id="b1" class="containerTab" style="display:none;background:green">
 -->  
 <!-- Three columns -->
<div class="row">
  <div class="column" onclick="openTab('b1');" style="background:#F6CEF5;">
    1번방
    <input type="button" value="wow">
    <input type="button" value="wow2">
    <br>
    <input type="button" value="wow3">
  </div>

  <div class="column" onclick="openTab('b2');" style="background:#E6E6E6;">
    Box 2
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
                        <!-- <button type="button" class="btn btn-inverse-primary btn-fw">Primary</button>
                        <button type="button" class="btn btn-inverse-secondary btn-fw">Secondary</button>
                        <button type="button" class="btn btn-inverse-success btn-fw">Success</button>
                        <button type="button" class="btn btn-inverse-danger btn-fw">Danger</button>
                        <button type="button" class="btn btn-inverse-warning btn-fw">Warning</button>
                        <button type="button" class="btn btn-inverse-info btn-fw">Info</button>
                        <button type="button" class="btn btn-inverse-light btn-fw">Light</button>
                        <button type="button" class="btn btn-inverse-dark btn-fw">Dark</button>
                        <button type="button" class="btn btn-link btn-fw">Link</button> -->
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
            <!-- <div class="col-md-8 grid-margin stretch-card"> -->
              <!-- <div class="card"> -->
                <!-- <div class="row"> -->
                <%--  <div class="col-md-7">
                    <div class="card-body">
                    <h4 class="card-title">Icon Buttons</h4>
                    <p class="card-description">Add class <code>.btn-icon</code> for buttons with only icons</p>
                    <div class="template-demo d-flex justify-content-between flex-nowrap">
                      <button type="button" class="btn btn-primary btn-rounded btn-icon">
                        <i class="mdi mdi-home-outline"></i>
                      </button>
                      <button type="button" class="btn btn-dark btn-rounded btn-icon">
                        <i class="mdi mdi-internet-explorer"></i>
                      </button>
                      <button type="button" class="btn btn-danger btn-rounded btn-icon">
                        <i class="mdi mdi-email-open"></i>
                      </button>
                      <button type="button" class="btn btn-info btn-rounded btn-icon">
                        <i class="mdi mdi-star"></i>
                      </button>
                      <button type="button" class="btn btn-success btn-rounded btn-icon">
                        <i class="mdi mdi-map-marker"></i>
                      </button>
                    </div>
                    <div class="template-demo d-flex justify-content-between flex-nowrap">
                      <button type="button" class="btn btn-inverse-primary btn-rounded btn-icon">
                        <i class="mdi mdi-home-outline"></i>
                      </button>
                      <button type="button" class="btn btn-inverse-dark btn-icon">
                        <i class="mdi mdi-internet-explorer"></i>
                      </button>
                      <button type="button" class="btn btn-inverse-danger btn-icon">
                        <i class="mdi mdi-email-open"></i>
                      </button>
                      <button type="button" class="btn btn-inverse-info btn-icon">
                        <i class="mdi mdi-star"></i>
                      </button>
                      <button type="button" class="btn btn-inverse-success btn-icon">
                        <i class="mdi mdi-map-marker"></i>
                      </button>
                    </div>
                    <div class="template-demo d-flex justify-content-between flex-nowrap mt-4">
                      <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                        <i class="mdi mdi-heart-outline text-danger"></i>
                      </button>
                      <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                        <i class="mdi mdi-music text-dark"></i>
                      </button>
                      <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                        <i class="mdi mdi-star text-primary"></i>
                      </button>
                      <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                        <i class="mdi mdi-signal text-info"></i>                          
                      </button>
                      <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                        <i class="mdi mdi-trending-up text-success"></i>                          
                      </button>
                    </div>
                    <div class="template-demo d-flex justify-content-between flex-nowrap">
                      <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                        <i class="mdi mdi-heart-outline"></i>
                      </button>
                      <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                        <i class="mdi mdi-music"></i>
                      </button>
                      <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                        <i class="mdi mdi-star"></i>
                      </button>
                      <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                        <i class="mdi mdi-signal"></i>                          
                      </button>
                      <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                        <i class="mdi mdi-trending-up"></i>                          
                      </button>
                    </div>
                  </div>
                  </div>  --%>
                 <%--  <div class="col-md-5"> 
                    <div class="card-body">
                      <h4 class="card-title">Button Size</h4>
                      <p class="card-description">Use class <code>.btn-{size}</code></p>
                      <div class="template-demo">
                        <button type="button" class="btn btn-outline-secondary btn-lg">btn-lg</button>
                        <button type="button" class="btn btn-outline-secondary btn-md">btn-md</button>
                        <button type="button" class="btn btn-outline-secondary btn-sm">btn-sm</button>
                      </div>
                      <div class="template-demo mt-4">
                        <button type="button" class="btn btn-danger btn-lg">btn-lg</button>
                        <button type="button" class="btn btn-success btn-md">btn-md</button>
                        <button type="button" class="btn btn-primary btn-sm">btn-sm</button>
                      </div>
                    </div>
                  </div> --%>
                </div>
              </div>
            </div>
            <!-- <div class="col-md-4 grid-margin stretch-card"> -->
              <!-- <div class="card"> -->
            <%--     <div class="card-body">
                  <h4 class="card-title">Block buttons</h4>
                  <p class="card-description">Add class <code>.btn-block</code></p>
                  <div class="template-demo">
                    <button type="button" class="btn btn-info btn-lg btn-block">Block buttons
                      <i class="mdi mdi-menu float-right"></i>
                    </button>
                    <button type="button" class="btn btn-dark btn-lg btn-block">Block buttons</button>
                    <button type="button" class="btn btn-primary btn-lg btn-block">
                      <i class="mdi mdi-account"></i>                      
                      Block buttons
                    </button>
                    <button type="button" class="btn btn-outline-secondary btn-lg btn-block">Block buttons</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-12 grid-margin">
              <div class="card">
                <div class="row">
                  <div class="col-md-6">
                    <div class="card-body">
                      <h4 class="card-title">Button groups</h4>
                      <p class="card-description">Wrap a series of buttons with <code>.btn</code> 
                        in <code>.btn-group</code></p>
                      <div class="template-demo">
                        <div class="btn-group" role="group" aria-label="Basic example">
                          <button type="button" class="btn btn-outline-secondary">1</button>
                          <button type="button" class="btn btn-outline-secondary">2</button>
                          <button type="button" class="btn btn-outline-secondary">3</button>
                        </div>
                        <div class="btn-group" role="group" aria-label="Basic example">
                          <button type="button" class="btn btn-outline-secondary">
                            <i class="mdi mdi-heart-outline"></i>
                          </button>
                          <button type="button" class="btn btn-outline-secondary">
                            <i class="mdi mdi-calendar"></i>
                          </button>
                          <button type="button" class="btn btn-outline-secondary">
                            <i class="mdi mdi-clock"></i>
                          </button>
                        </div>
                      </div>
                      <div class="template-demo">
                        <div class="btn-group" role="group" aria-label="Basic example">
                          <button type="button" class="btn btn-primary">1</button>
                          <button type="button" class="btn btn-primary">2</button>
                          <button type="button" class="btn btn-primary">3</button>
                        </div>
                        <div class="btn-group" role="group" aria-label="Basic example">
                          <button type="button" class="btn btn-primary">
                            <i class="mdi mdi-heart-outline"></i>
                          </button>
                          <button type="button" class="btn btn-primary">
                            <i class="mdi mdi-calendar"></i>
                          </button>
                          <button type="button" class="btn btn-primary">
                            <i class="mdi mdi-clock"></i>
                          </button>
                        </div>
                      </div>
                      <div class="template-demo mt-4">
                        <div class="btn-group-vertical" role="group" aria-label="Basic example">
                          <button type="button" class="btn btn-outline-secondary">
                            <i class="mdi mdi-format-vertical-align-top"></i>
                          </button>
                          <button type="button" class="btn btn-outline-secondary">
                            <i class="mdi mdi-format-vertical-align-center"></i>
                          </button>
                          <button type="button" class="btn btn-outline-secondary">
                            <i class="mdi mdi-format-vertical-align-bottom"></i>
                          </button>
                        </div>
                        <div class="btn-group-vertical" role="group" aria-label="Basic example">
                          <button type="button" class="btn btn-outline-secondary">Default</button>
                          <div class="btn-group">
                            <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown">Dropdown</button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item">Go back</a>
                              <a class="dropdown-item">Delete</a>
                              <a class="dropdown-item">Swap</a>
                            </div>                          
                          </div>
                          <button type="button" class="btn btn-outline-secondary">Default</button>
                        </div>
                        <div class="btn-group-vertical" role="group" aria-label="Basic example">
                          <button type="button" class="btn btn-outline-secondary">Top</button>
                          <button type="button" class="btn btn-outline-secondary">Middle</button>                          
                          <button type="button" class="btn btn-outline-secondary">Bottom</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="card-body">
                      <h4 class="card-title">Button with text and icon</h4>
                      <p class="card-description">Wrap icon and text inside <code>.btn-icon-text</code> and use <code>.btn-icon-prepend</code> 
                        or <code>.btn-icon-append</code> for icon tags</p>
                      <div class="template-demo">
                        <button type="button" class="btn btn-primary btn-icon-text">
                          <i class="mdi mdi-file-check btn-icon-prepend"></i>
                          Submit
                        </button>
                        <button type="button" class="btn btn-dark btn-icon-text">
                          Edit
                          <i class="mdi mdi-file-check btn-icon-append"></i>                          
                        </button>
                        <button type="button" class="btn btn-success btn-icon-text">
                          <i class="mdi mdi-alert btn-icon-prepend"></i>                                                    
                          Warning
                        </button>
                      </div>
                      <div class="template-demo">
                        <button type="button" class="btn btn-danger btn-icon-text">
                          <i class="mdi mdi-upload btn-icon-prepend"></i>                                                    
                          Upload
                        </button>
                        <button type="button" class="btn btn-info btn-icon-text">
                          Print
                          <i class="mdi mdi-printer btn-icon-append"></i>                                                                              
                        </button>
                        <button type="button" class="btn btn-warning btn-icon-text">
                          <i class="mdi mdi-reload btn-icon-prepend"></i>                                                    
                          Reset
                        </button>
                      </div>
                      <div class="template-demo mt-2">
                        <button type="button" class="btn btn-outline-primary btn-icon-text">
                          <i class="mdi mdi-file-check btn-icon-prepend"></i>
                          Submit
                        </button>
                        <button type="button" class="btn btn-outline-secondary btn-icon-text">
                          Edit
                          <i class="mdi mdi-file-check btn-icon-append"></i>                          
                        </button>
                        <button type="button" class="btn btn-outline-success btn-icon-text">
                          <i class="mdi mdi-alert btn-icon-prepend"></i>                                                    
                          Warning
                        </button>
                      </div>
                      <div class="template-demo">
                        <button type="button" class="btn btn-outline-danger btn-icon-text">
                          <i class="mdi mdi-upload btn-icon-prepend"></i>                                                    
                          Upload
                        </button>
                        <button type="button" class="btn btn-outline-info btn-icon-text">
                          Print
                          <i class="mdi mdi-printer btn-icon-append"></i>                                                                              
                        </button>
                        <button type="button" class="btn btn-outline-warning btn-icon-text">
                          <i class="mdi mdi-reload btn-icon-prepend"></i>                                                    
                          Reset
                        </button>
                      </div>
                      <div class="template-demo mt-2">
                        <button class="btn btn-outline-dark btn-icon-text">
                          <i class="mdi mdi-apple btn-icon-prepend mdi-36px"></i>
                          <span class="d-inline-block text-left">
                            <small class="font-weight-light d-block">Available on the</small>
                            App Store
                          </span>
                        </button>
                        <button class="btn btn-outline-dark btn-icon-text">
                          <i class="mdi mdi-android-debug-bridge btn-icon-prepend mdi-36px"></i>
                          <span class="d-inline-block text-left">
                            <small class="font-weight-light d-block">Get it on the</small>
                            Google Play
                          </span>
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Social Icon Buttons</h4>
                  <p class="card-description">Add class <code>.btn-social-icon</code></p>
                  <div class="template-demo">
                    <button type="button" class="btn btn-social-icon btn-outline-facebook"><i class="mdi mdi-facebook"></i></button>
                    <button type="button" class="btn btn-social-icon btn-outline-youtube"><i class="mdi mdi-youtube"></i></button>                                        
                    <button type="button" class="btn btn-social-icon btn-outline-twitter"><i class="mdi mdi-twitter"></i></button>
                    <button type="button" class="btn btn-social-icon btn-outline-dribbble"><i class="mdi mdi-dribbble"></i></button>
                    <button type="button" class="btn btn-social-icon btn-outline-linkedin"><i class="mdi mdi-linkedin"></i></button>
                    <button type="button" class="btn btn-social-icon btn-outline-google"><i class="mdi mdi-google-plus"></i></button>
                  </div>
                  <div class="template-demo">
                    <button type="button" class="btn btn-social-icon btn-facebook"><i class="mdi mdi-facebook"></i></button>
                    <button type="button" class="btn btn-social-icon btn-youtube"><i class="mdi mdi-youtube"></i></button>                                        
                    <button type="button" class="btn btn-social-icon btn-twitter"><i class="mdi mdi-twitter"></i></button>
                    <button type="button" class="btn btn-social-icon btn-dribbble"><i class="mdi mdi-dribbble"></i></button>
                    <button type="button" class="btn btn-social-icon btn-linkedin"><i class="mdi mdi-linkedin"></i></button>
                    <button type="button" class="btn btn-social-icon btn-google"><i class="mdi mdi-google-plus"></i></button>
                  </div>
                  <div class="template-demo">
                    <button type="button" class="btn btn-social-icon btn-facebook btn-rounded"><i class="mdi mdi-facebook"></i></button>
                    <button type="button" class="btn btn-social-icon btn-youtube btn-rounded"><i class="mdi mdi-youtube"></i></button>                                        
                    <button type="button" class="btn btn-social-icon btn-twitter btn-rounded"><i class="mdi mdi-twitter"></i></button>
                    <button type="button" class="btn btn-social-icon btn-dribbble btn-rounded"><i class="mdi mdi-dribbble"></i></button>
                    <button type="button" class="btn btn-social-icon btn-linkedin btn-rounded"><i class="mdi mdi-linkedin"></i></button>
                    <button type="button" class="btn btn-social-icon btn-google btn-rounded"><i class="mdi mdi-google-plus"></i></button>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 grid-margin stretch-card"> --%>
              <%-- <div class="card">
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
        <!-- <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2018 <a href="https://www.urbanui.com/" target="_blank">Urbanui</a>. All rights reserved.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="mdi mdi-heart text-danger"></i></span>
          </div>
        </footer> -->
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
	
</body>
</html>