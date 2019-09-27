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
						<tr height="30">
							<td align="center" width = "20" >글번호</td>
							<td align="center" width = "20" > ${ board.BOARD_NUM }</td>
							<td align="center" width = "20" >글제목</td>
							<td align="center" width = "500">${ board.BOARD_TITLE } </td>
							<td align="center" width = "20" >작성자</td>
							<td align="center" width = "50">${ board.BOARD_ID } </td>
							
						</tr>
						
						<tr>

							<td height="300" width = "1000" colspan="6" style="word-break: break-all;">${ board.BOARD_CONTENT }</td>

						</tr>
				
			  <!-- 댓글 입력 -->		
						<tr>
						
							<td height="50" width = "1000" colspan="6">
							<form class="forms-sample">
								<div class="form-group" style="float: left;">
			                      
			                      <textarea class="form-control" id="exampleTextarea1" placeholder="댓글을 입력하세요" 
			                      			rows="5" style="width:1400px"></textarea>
			                    </div>
			                    
			                    <div class="form-group" style="float: right;">
			                    <button type="submit" class="btn btn-primary mr-2" style="width:110px">댓글쓰기</button><br/><br/>
			                    <button type="reset" class="btn btn-outline-secondary" style="width:110px">Cancel</button>
			                    </div>
			                    
							</form>
							
							</td>
						</tr>
                    
                <!-- 끝 댓글 입력 끝  -->
                
                <!-- 댓글 목록  -->	
                
                <%-- <c:if test=""> --%>
		 				<tr>
							<td colspan="6">
								
							   <div id="cmntList">
							   		<table style='margin-top: 10px'>
							   			<tr align='center'>
							   				<td width='100px'> 댓글 번호 </td>
							   				<td width='200px'> 댓글 아이디</td>
							   				<td align='left' width='1200px'>댓글 내용</td>
							   				<td width='200px'>날짜</td>
							   				<td width='200px'><input type='button' value='수정' class='btn btn-secondary'></br>
							   				<input type='button' value='삭제' class='btn btn-secondary'></td>
							    		</tr>
							    	</table>
							   </div>
								
							</td>
						</tr>
                <%-- </c:if> --%>
                
                <!-- 끝 댓글 목록 끝 -->	
                    		    
				<!-- 글 수정 및 삭제 버튼  -->
				
						<tr>
							<td height="50" width = "1000" colspan="6">
							<button type="button" data-oper='listBtn' class="btn btn-primary">목록가기</button>
				            
				            <button type="button" data-oper='remBtn' 
				            		class="btn btn-primary" style="float:right;  margin-left:10px;">삭제하기</button> 
				            
				            <button type="button" data-oper='modBtn' 
				            		class="btn btn-primary" style="float:right;">수정하기</button>
				            

							</td>
						</tr>
						
				<!-- 버튼 단락 끝  -->
					
		            </table>     
		            
		            
		            <form id='operForm' action="/CustomerCenter/BoardModify" method="get">
					  <input type='hidden' id='BOARD_NUM' name='BOARD_NUM' value='<c:out value="${board.BOARD_NUM}"/>'>
					  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
					  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
					  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
					  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
					 
					</form>
					
					<form id='removeForm' action="/CustomerCenter/BoardRemove" method="post">
					  <input type='hidden' id='BOARD_NUM' name='BOARD_NUM' value='<c:out value="${board.BOARD_NUM}"/>'>
					 
					</form>
		            
		            
                  </div>
                </div>
              </div>
            </div>
         </div>
       </div>
     </div>
            
<script type="text/javascript">





















//////////////////////////////////////////////////////////board/////////////////////////////////////////////

$(document).ready(function() {
	  
	  var operForm = $("#operForm");
	  var removeForm = $("#removeForm") 
	  
	  $("button[data-oper='modBtn']").on("click", function(e){
	    
	    operForm.attr("action","/CustomerCenter/boardModify").submit();
	    
	  });
	  
	    
	  $("button[data-oper='listBtn']").on("click", function(e){
	    
	    operForm.find("#BOARD_NUM").remove();
	    operForm.attr("action","/CustomerCenter/boardList")
	    operForm.submit();
	    
	  });

	  $("button[data-oper='remBtn']").on("click", function(e){

		removeForm.attr("action", "/CustomerCenter/boardRemove").submit();

	  });  
	});

</script>
           

</body>

</html>