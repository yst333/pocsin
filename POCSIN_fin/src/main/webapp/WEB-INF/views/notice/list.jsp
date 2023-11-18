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
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%" class="table table-hover"
					id="dataTables-example">
					<p>Notice</p>
					<c:forEach items="${list}" var="notice">
						<tr>
							<!-- <td><c:out value="${notice.title}"></c:out></td>  -->

							<!-- a 태그에 target="_blank" 속성을 적용하면 새창으로 글 상세 내용을 보여줌 -->
							<!-- Page314 소스 코딩할 때, 아래 2줄 소스는 주석 처리를 합니다! -->
							 
							<td><a href='/notice/get?nbno=<c:out value="${notice.nbno}"/>'>
							<c:out value="${notice.title}"/></a></td>

							<!-- Page314 : 이벤트 처리를 위한 a 태그에 class 속성 move를 적용해 줍니다. 
							<td><a class="move" href='<c:out value="${notice.nbno}"/>'> <c:out value="${notice.title}" /></a>
							</td>-->

							<td><fmt:formatDate value="${notice.regdate}" pattern="yyyy-MM-dd" />
						</tr>

					</c:forEach>
				</table>
				<!-- /.table-responsive -->


				<div class="row">
					<div class="col-lg-12">
						<button id="regBtn" type="button" data-oper='list' class="btn btn-xs pull-right">글등록하기(Register)</button>
						<button type="button" onclick="location.href='http://192.168.0.60:3000/Faq'">게시글 목록</button>
					</div>
				</div>
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->

<!-- ===============script start ================== -->	
<script type="text/javascript">

$("#regBtn").on("click", function() {
	self.location = "/notice/register";
});



</script>

</body>
</html>