<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/inhostyle.css">
<meta charset="UTF-8">
<title>고객 게시판</title>
</head>
<body>
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
	                          <td style="width:1000px;"><a  href='/CustomerCenter/boardGet?BOARD_NUM=<c:out value="${list.BOARD_NUM}"/>'>
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
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
</body>
<script type="text/javascript">
	
	/* $(document).ready(function(){
		var actionForm = $("#actionForm");
			$(".move").on("click", function(e){
						e.preventDefault();
						actionForm.append("<input type='hidden' name='BOARD_NUM' value='" +$(this).attr("href")+ "'>");
						actionForm.attr("action", "/CustomerCenter/boardGet");
						actionForm.submit();	
			});
	}); */
	
</script>

</html>
