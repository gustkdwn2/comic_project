<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코믹 서기 건의 게시판</title>
<style type="text/css">
	table, tr , td{border:1px solid #d0dfef; font-size:20px; text-align: center;}
	tr{margin-bottom:5px;}
    .hide {display:none;}
    .show {display:table-row; font-size:20px; background-color:RGB(237,237,237) #ededed;}
    .info td {cursor:pointer; font-size:20px; } 
</style>

</head>
<body>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h2 class=".h2">건의 게시판</h2>
                  
				    <form class="form-inline" action="/SearchBook/searchList" 
				          id='searchForm' method="get" style="float: right; margin-bottom: 20px;">
				    		<select name="type" class="form-control">
				     			<option value=""
									 <c:out value="${pageMaker.cri.type == null?'selected':''}"/> >--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>카테고리</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>저자</option>
								<option value="N"
									<c:out value="${pageMaker.cri.type eq 'N'?'selected':''}"/>>내용</option>
								<option value="TN"
									<c:out value="${pageMaker.cri.type eq 'TN'?'selected':''}"/>>제목 or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 저자</option>
							 </select>
				    		<input type="text" name="keyword" class="form-control" >&nbsp;
				    		<input type="submit" class="btn btn-primary btn-md" value="검색">
				    		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'/>
							<input type='hidden' name='amount' value='${pageMaker.cri.amount}' />
				    		
				    </form>
				    	
		            <br/><br/>
                  <div class="table-responsive">
                  
                    <c:if test='${count==0}'>
                      <td colspan="4"><h3 style="text-align: center;">검색 결과 없습니다.</h3></td>                    	
					</c:if>
					
					<c:if test="${count>0 }">
					
					<table class="accocss table-striped">
                      <thead>
                        <tr style="height: 40px;">
                          <td style="width:80px;">분류</td>
                          <td style="width:800px;">이름</td>
                          <td style="width:300px;">저자</td>
                          <td style="width:300px;">출판사</td>
                          <td style="width:100px;">마지막 권</td>
                          <td style="width:200px;">위치</td>                      
                        </tr>
                      </thead>
 
					
					<c:forEach items="${ list }" var="list">
					
						<tbody>					
							<tr class="info" style="height: 40px;">
	                          <td style="width:80px;"><c:out value="${list.book_category }" /></td>
	                          <td style="width:800px;"><a href="#"><c:out value="${list.book_name }" /></a></td>
	                          <td style="width:300px;"><c:out value="${list.book_writer }" /></td>
	                          <td style="width:300px;"><c:out value="${list.book_publisher }" /></td>
	                          <td style="width:100px;"><c:out value="${list.book_lastbook }" /></td>
	                          <td style="width:200px;"><c:out value="${list.book_loc }" /></td>
	                         
	                        </tr>
	                        
	                        <tr class="hide" style="height: 150px;">
	                          <td colspan="6">
	                          <c:out value="${list.book_content }" />
	                          </td>
	                        </tr>      
	                    </tbody>
                                       

					
					</c:forEach>
					</table>

                    <br>		
					 </div>
					<!-- /.container -->
                    
                    <!-- 글번호 작성 -->                       
                   
                    <div class='pull-right' style="float: left; width:500px; height: 80px;">
                    <br>
					  <ul class="pagination" >
					  
					  	<c:if test="${pageMaker.prev}">
					    <li class="page-item">
					    <a class="page-link" href="${pageMaker.startPage -1}">Prev
					    </a></li>
					    </c:if>
					    
					    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					    <li class="page-item" ${pageMaker.cri.pageNum == num ? "active":""} ">
					    	<a class="page-link" id="pages" href="${num}">${num}</a>
					    </li>
					    </c:forEach>
					    
					    <c:if test="${pageMaker.next}">
					    <li class="page-item"><a class="page-link" href="${pageMaker.endPage +1 }">Next</a></li>
					    </c:if>
					    
					  </ul>
					  

					</div>
					
					</c:if>

					
					<form id='actionForm' action="/SearchBook/searchList" method='get'>
						<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
						<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
						<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
						<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
				   </form>

           </div>
         </div>
      </div>
    </div>
  </div>
</div>

            
<script type="text/javascript">

	$(document)
		.ready(
				function(){


			var actionForm = $("#actionForm");

			$(function(){
	            var article = (".accocss .show"); 
	            $(".accocss .info td").click(function() { 
	                var myArticle =$(this).parents().next("tr"); 
	                if($(myArticle).hasClass('hide')) { 
	                    $(article).removeClass('show').addClass('hide'); 
	                    $(myArticle).removeClass('hide').addClass('show'); 
	                } 
	                else { 
	                    $(myArticle).addClass('hide').removeClass('show'); 
	                } 
	            }); 
	        });

/* 			
 			$(".move").on(
					"click",
					function(e){
						e.preventDefault();
						actionForm.append("<input type='hidden' name='board_num' value='"
								+$(this).attr("href")+ "'>");
						actionForm.attr("action", "/CustomerCenter/boardGet");
						actionForm.submit();
						
			}); */ 


			$(".page-item a").on( 
					"click",
					function(e) {

						e.preventDefault();

						console.log('페이지이동');

						actionForm.find("input[name='pageNum']")
								.val($(this).attr("href"));
						actionForm.submit();
			 });

			var searchForm = $("#searchForm");

			 $("#searchForm button").on(
					"click",
					function(e){

						if(!searchForm.find("option:selected").val()){
							alret("검색 종류를 선택해주세요");
						}
						if(!searchForm.find("input[name='keyword']").val()){
							alret("키워드를 입력해주세요");
						}
						searchForm.find("input[name='pageNum']").val(1);
						e.preventDefault();
						console.log('검색');

						searchForm.submit();
						});
		
		});

</script>


</body>

</html>
