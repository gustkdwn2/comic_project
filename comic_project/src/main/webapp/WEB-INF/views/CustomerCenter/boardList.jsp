<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>

      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h2 class=".h2">고객센터 게시판</h2><br/>
                  <div class="table-responsive">
                    <table class="table" style="border:1px solid #f3f3f3;" >
                      <thead>
                        <tr>
                          <td style="width:200px;">글번호</td>
                          <td style="width:1000px;">글제목</td>
                          <td style="width:400px;">글쓴이</td>
                          <td style="width:300px;">날짜</td>
                        </tr>
                      </thead>
                       
                      <c:forEach items="${ list }" var="list">
                      
	                      <tbody>
	                        <tr>
	                          <td style="width:200px;"><c:out value="${list.BOARD_NUM }" /></td>
	                          <td style="width:1000px;"><a class='move' href='<c:out value="${list.BOARD_NUM}"/>'>
	                          <c:out value="${list.BOARD_TITLE }" /></a></td>
	                          <td style="width:400px;"><c:out value="${list.BOARD_ID }" /></td>
	                          <td style="width:300px;"><fmt:formatDate pattern="yyyy-MM-dd" value="${list.BOARD_DATE }" /></td>
	                        </tr>         
                      	  </tbody>
                      	  
                      </c:forEach>
                    </table>
                    
		            <div class="template-demo">
		               <div class="btn-group" role="group" aria-label="Basic example">		                        
		                  <button type="button" class="btn btn-outline-secondary">${i}</button>		                         
		               </div>		             		
		            </div>
		            <div class="template-demo">
		            <button type="button" class="btn btn-primary">글쓰기</button>
		            </div>
                  </div>
                </div>
              </div>
            </div>
            
<script type="text/javascript">

	$(document)
		.ready(
				function(){
			$(".move").on(
					"click",
					funtion(e){
						e.preventDefault();
						actionForm.append("<input type='hidden' name='BOARD_NUM' value='"
								+$(this).attr("href")+ "'>");
						actionForm.attr("action", "/CustomerCenter/boardGet");
						actionForm.submit();
						
			});
		
		});

</script>
           
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2018 <a href="https://www.urbanui.com/" target="_blank">Urbanui</a>. All rights reserved.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="mdi mdi-heart text-danger"></i></span>
          </div>
        </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="../../vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="../../js/off-canvas.js"></script>
  <script src="../../js/hoverable-collapse.js"></script>
  <script src="../../js/template.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <!-- End custom js for this page-->
</body>

</html>
