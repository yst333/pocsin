<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js"></script>

</head>

<body>

<div class = "reply_row">
  <div class = "col-lg-12">
     <div class = "panel panel-ddefault">
        <!-- /.panel-heading -->
        <div class = "panel-body">
          <p>Modify</p>
           <form role = "form" action="/notice/modify" method="post" id="modify">
		           	<div class="form-group">
						<label>글 번호</label>
						<input class="form-control" name="nbno" value='<c:out value="${notice.nbno}"/>' readonly="readonly">
					</div>				
					<div class="form-group">
						<label>Title</label>
						<input class="form-control" name="title" value='<c:out value="${notice.title}"/>'>
					</div>				
					<div class="form-group">
						<label>Text area</label>
	                 	<textarea rows="3" class="form-control" name="content"><c:out value="${notice.content}"/></textarea>
					</div>				
					<div class="form-group">
						<label>admin</label>
						<input class="form-control" name="admin" value='<c:out value="${notice.admin}"/>' readonly="readonly">
					</div>		
					<div class="form-group">
						<label>RegiDate</label>
						<input class="form-control" name="regdate" value='<fmt:formatDate pattern="yyyy/MM/dd" value= "${notice.regdate}"/>' readonly="readonly">
					</div>		
							
					<button class="btn btn-default modify_btn">게시글 수정</button>		
					<button class="btn btn-danger remove_btn">게시글 삭제</button>
					<button class="btn btn-info" onclick="location.href='/notice/list'">게시글 목록</button>
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
			
			formObj.attr("method","post");
			
			formObj.submit();
		});
		
		remove_btn.on("click",function(e){
			e.preventDefault();
			alert("삭제가 완료되었습니다!");
			
	      	formObj.attr("action", "/notice/remove");
	      	formObj.find("input[name!='nbno']").remove();
	      	formObj.attr("method","post");
	      	
   		 	formObj.submit();
		});
		
		
	});
</script>

</body>
</html>