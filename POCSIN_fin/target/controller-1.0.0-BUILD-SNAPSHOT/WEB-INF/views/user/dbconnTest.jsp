<%@page import="pocsin.work.common.JDBCUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>webapp 폴더 안에 dbconnTest.jsp 소스 코딩</title>
</head>
<body>
    <!-- JDBCUtil 활용 OracleDB 연결 접속을 확인해 봅니다. -->
	<% 
		try (Connection conn = JDBCUtil.getConnection()){
			out.println("커넥션 연결 성공함");
			
		} catch (SQLException e) {
			out.println("커넥션 연결 실패함 : " + e.getMessage());
			application.log("커넥션 연결 실패", e);
		}
	%>
</body>
</html>