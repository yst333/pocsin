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
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-ddefault">
				<!-- /.panel-heading -->
				<div class="panel-body">
					<p>read</p>
					<div class="form-group">
						<label>제목</label> <input class="form-control" name="title"
							value='<c:out value="${notice.title}"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea rows="5" class="form-control" name="content"
							readonly="readonly"><c:out value="${notice.content}" /> </textarea>
					</div>
					<div class="form-group">
						<label>작성자</label> <input class="form-control" name="admin"
							value='<c:out value="${notice.admin}"/>' readonly="readonly">
					</div>
					<button data-oper='modify' class="sub_btn btn-default">수정</button>
					<button data-oper='list' class="reset_btn btn-default">글 목록</button>

					<form id='operForm' action="/notice/modify" method="get">	
						<input type="text" id="nbno" name="nbno" value="${notice.nbno}">
					</form>
				</div>
				<!-- end panel-body -->
			</div>
			<!-- end panel -->
		</div>
		<!-- end col-log-12 -->
	</div>


	<!--========== javascript ============-->
	<script type="text/javascript">
	console.log()
		$(document).ready(function() {
			var operForm = $("#operForm");

			$("button[data-oper='list']").on("click", function(e) {
				operForm.find("#nbno").remove();
				operForm.attr("action", "/notice/list")
				operForm.submit();
			});
			
			$("button[data-oper='modify']").on("click", function(e) {
				operForm.attr("action", "/notice/modify");
				operForm.attr("method","get");
				operForm.submit();
			});
		});
	</script>

	<!--=============end get(read)================-->

</body>
</html>