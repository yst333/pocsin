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
				<form action="/user/modify" role="form" method="post">
				
					<div class="form-group">
						<label>ID</label>
						<input class="form-control" name="id" value='<c:out value="${sessionScope.id}" />' readonly="readonly">					
					</div>		
					
					<div class="form-group">
						<label>비밀번호</label>
						<input class="form-control" type="password" name="pw" value='<c:out value="${sessionScope.pw}" />' >					
					</div>		
					
					<div class="form-group">
						<label>연락처</label>
						<input class="form-control" name="phoneNum" value='<c:out value="${sessionScope.phoneNum}" />' >						
					</div>
					
					<div class="form-group">
						<label>이메일</label>
						<input class="form-control" name="email" value='<c:out value="${sessionScope.email}" />' >						
					</div>

					<button data-oper='modify' class="btn btn-default" onclick="location.href='/user/modify'">수정(Modify)</button>					
					</form>
					
			</div> <!-- end panel-body -->
		</div> <!-- end panel -->
	</div> <!-- end col-lg-12 -->
</div> <!-- end row -->


<script type="text/javascript">
$(document).ready(function() {
	var formObj = $("form");
	
	$('button').on("click", function(e) {
		// form 태그의 모든 버튼은 기본적으로 submit으로 처리하기 때문에
		// e.preventDefault()로 기본 동작을 막고 마지막에 직접 submit()을 수행합니다.
		e.preventDefault();
		// 자바스크립트에서는 button 태그의 'data-oper' 속성을 이용해서
		// 원하는 기능을 동작하도록 처리합니다.
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if (operation === 'remove') {
			formObj.attr("action", "/board/remove");
		} else if (operation === 'list') {
			// move to list
			// 수정된 내용은 클릭한 버튼이 List인 경우 action 속성과 method 속성을
			// 변경합니다. '/board/list'로의 이동은 아무런 파라미터가 없기 때문에
			// form 태그의 모든 내용은 삭제한 상태에서 submit()을 진행합니다.		
			formObj.attr("action", "/user/modify").attr("method", "get");
			
			// Page 321 수정/삭제 페이지에서 목록 페이지로 이동 처리
			// 페이지 이동의 마지막은 수정/삭제를 취소하고 다시 목록 페이지로 이동하는 것입니다.
			// 목록 페이지는 오직 pageNum과 amount만을 사용하므로 form 태그의
			// 다른 내용들은 삭제하고 필요한 내용만을 다시 추가하는 형태가 편리합니다.
			// 만일 사용자가 'List' 버튼을 클릭한다면 form 태그에서 필요한 부분만 잠시
			// 복사(clone)해서 보관해 두고, form 태그 내의 모든 내용은 지워버립니다(empty)
			// 이후에 다시 필요한 태그들만 추가해서 '/board/list'를 호출하는 형태를 이용합니다.
				// Page 321 자바스크립트 소스 추가 시작				
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();
				// Page 321 자바스크립트 소스 추가 끝
			formObj.empty();
			// Page 321 자바스크립트 소스 추가 시작
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(keywordTag);
			formObj.append(typeTag);
			// Page 321 자바스크립트 소스 추가 끝
		}
		formObj.submit();
	});
});

</script>

</body>
</html>