<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
   
    
    <!-- Additional CSS Files -->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/owl.css">
    <link rel="stylesheet" href="/resources/css/animate.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css">
    
	<!--list CSS-->
	<link rel="stylesheet" href="/resources/board/modify.css">
	
</head>


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

	<!-- jQuery -->
    <script src="/resources/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/js/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/js/sb-admin-2.js"></script>

    
    <!-- additional JavaScript -->
    <script src="/resources/js/isotope.min.js"></script>
    <script src="/resources/js/owl-carousel.js"></script>
    <script src="/resources/js/tabs.js"></script>
    <script src="/resources/js/popup.js"></script>
    <script src="/resources/js/custom.js"></script>