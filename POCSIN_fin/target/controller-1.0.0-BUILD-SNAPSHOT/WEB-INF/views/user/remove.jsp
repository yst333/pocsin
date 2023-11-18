<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="screen" href="resources/css/bootstrap-3.3.2.min.css">
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
</head>
<body>


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Modify Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form action="/user/remove" role="form" method="post">
				
					<div class="form-group">
						<label>ID</label>
						<input class="form-control" type="hidden" name="id" value='<c:out value="${sessionScope.id}" />' readonly="readonly">					
					</div>		
					
					<div class="form-group">
						<label>비밀번호</label>
						<input class="form-control" type="hidden" name="pw" value='<c:out value="${sessionScope.pw}" />' >					
					</div>		
					
					<div class="form-group">
						<label>연락처</label>
						<input class="form-control" type="hidden" name="phoneNum" value='<c:out value="${sessionScope.phoneNum}" />' >						
					</div>
					
					<div class="form-group">
						<label>이메일</label>
						<input class="form-control" type="hidden" name="email" value='<c:out value="${sessionScope.email}" />' >						
					</div>

					<button type="submit" data-oper='remove' class="btn btn-danger">탈퇴하기</button>			
					</form>
					
			</div> <!-- end panel-body -->
		</div> <!-- end panel -->
	</div> <!-- end col-lg-12 -->
</div> <!-- end row -->


<script type="text/javascript">
$(document).ready(function() {
    var formObj = $("form");

    $('button').on("click", function(e) {
        e.preventDefault();
        var operation = $(this).data("oper");

        console.log(operation);

        if (operation === 'remove') {
            formObj.attr("action", "/user/remove");
            // 액션을 업데이트한 후 폼을 제출합니다.
            formObj.submit();
        } 
    });
});

</script>
	

</body>
</html>