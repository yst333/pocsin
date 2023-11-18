<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>

<%-- 세션 로그 확인 --%>
<% System.out.println("Session name: " + session.getAttribute("name")); %>
<% System.out.println("Session id: " + session.getAttribute("id")); %>

<c:if test="${sessionScope.name != null}">
	<h1>
		${sessionScope.name}님 환영합니다	
	</h1>
	<form action="/user/sign_out">
		<input type="submit" value="로그아웃">
	</form>
	<a href='/user/modify?id=<c:out value="${sessionScope.id}"  />'>수정하기</a>
	<a href='/user/remove'>탈퇴하기</a>
</c:if>

<c:if test="${sessionScope.name == null}">
<!-- 회원가입 -->
<input type="button" value="회원가입" onclick="location.href='user/signup'">
<!-- 로그인 로그아웃 -->
<input type="button" value="로그인" onclick="location.href='user/signin'">
</c:if>


</body>
</html>