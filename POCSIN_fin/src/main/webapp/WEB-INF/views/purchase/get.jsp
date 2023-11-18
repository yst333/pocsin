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
	
<body>

	※결제처리가 정상적으로 되었습니다!purchase
	<br>
	<div class="panel-body">
					<p>read</p>
					<div class="form-group">
						<label>결제날짜</label> 
						<fmt:formatDate value="${purchase.per_time}" pattern="yy/MM/dd" />
					</div>
					<div class="form-group">
						<label>주문번호</label> 
						<c:out value="${purchase.pay_id}"/>
					</div>
					<div class="form-group">
						<label>상품번호</label> 
						<c:out value="${purchase.per_num}"/>
					</div>
					<div class="form-group">
						<label>상품명</label> 
						<c:out value="${purchase.pname}"/>
					</div>
					<div class="form-group">
						<label>상품가격</label> 
						<c:out value="${purchase.pay_amount}"/>
					</div>
					<div class="form-group">
						<label>결제수량</label> 
						<c:out value="${purchase.pcount}"/>
					</div>
					<div class="form-group">
						<label>받는이</label> 
						<c:out value="${purchase.pbuyer}"/>
					</div>
					<div class="form-group">
						<label>주소</label> 
						<c:out value="${purchase.padress}"/>
					</div>
					
				</div>
	

</body>
</html>