<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
<!-- 로그인 -->
<form accept-charset="UTF-8" method="post" action="/user/login">
	<input type="text" id="id" name="id" placeholder="id를 입력하세요" />
	
	<!-- 비밀번호 -->
	<input type="password" id="pw"  name="pw" placeholder="비밀번호를 입력하세요"  />
	
	 <!--제출 -->
	<button type="submit">로그인</button>
</form>  

</body>
</html>