<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp" %> 
    
	<!--list CSS-->
	<link rel="stylesheet" href="/resources/board/modify.css">
	
</head>

<%@ include file="../includes/nav.jsp"%>


<!--=============get(read)================-->
<div class = "reply_row">
  <div class = "col-lg-12">
     <div class = "panel panel-default">
        <!-- /.panel-heading -->
        <div class = "panel-body">
          <p>Modify</p>
           <form role = "form" action="/board/modify" method="post" id="modify">
				<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
				<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>	
				<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}" />'>
				<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
           	<div class="form-group">
						<label>글 번호</label>
						<input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly="readonly">
					</div>				
					<div class="form-group">
						<label>제목</label>
						<input class="form-control" name="title" value='<c:out value="${board.title}"/>'>
					</div>				
					<div class="form-group">
						<label>내용</label>
	                 	<textarea rows="3" class="form-control" name="content"><c:out value="${board.content}"/></textarea>
					</div>				
					<div class="form-group">
						<label>작성자</label>
						<input class="form-control" name="writer" value='<c:out value="${board.writer}"/>' readonly="readonly">
					</div>		
					<div class="form-group">
						<label>작성일</label>
						<input class="form-control" name="regdate" value='<fmt:formatDate pattern="yyyy/MM/dd" value= "${board.regdate}"/>' readonly="readonly">
					</div>		
					<div class="form-group">
						<label>수정일</label>
						<input class="form-control" name="updateDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value= "${board.updateDate}"/>' readonly="readonly">
					</div>		
					<!--  onclick="location.href='/board/modify?bno=<c:out value="${board.bno}"/> '" -->
					<button data-oper='modify' class="btn btn-default modify_btn" >수정</button>		
					<button data-oper='remove' class="btn btn-danger remove_btn">삭제</button>
					<button data-oper='list' class="btn btn-info" onclick="location.href='/board/list'">글 목록</button>
            </form>

				
        </div> <!-- end panel-body -->
     </div> <!-- end panel -->
  </div> <!-- end col-log-12 -->
</div><!-- end row -->


<!--========== javascript ============-->

<script type="text/javascript">
	
	$(document).ready(function() {
		var formObj = $("#modify");
		var modify_btn = $(".modify_btn");
		var remove_btn = $(".remove_btn");
		
		modify_btn.on("click",function(e){
			alert("수정 완료되었습니다!");
			e.preventDefault();
			
			formObj.find("input[type='hidden']").remove();
			formObj.attr("method","post");
			
			formObj.submit();
		});
		
		remove_btn.on("click",function(e){
			e.preventDefault();
			alert("삭제가 완료되었습니다!");
	      	formObj.attr("action", "/board/remove");
	      	formObj.attr("method","post");
   		    formObj.find("input[name!='bno']").remove();
   		 	formObj.submit();
		});
		
		
		$('button').on("click", function(e) {
	      e.preventDefault();
	      var operation = $(this).data("oper");
	      console.log(operation);
	      
	      if (operation === 'list') {
	    	  formObj.attr("action", "/board/list").attr("method", "get");
	    	  formObj.empty();
			}
	      
			formObj.submit();
		});
	});
</script>

<!--=============end get(read)================-->

<%@ include file="../includes/footer.jsp"%>
