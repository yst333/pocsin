<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../../includes/header.jsp" %> 

	 <!--faq CSS-->
	 <link rel="stylesheet" href="/resources/pages/faq.css">

</head>
<title>상품 상세정보</title>
</head>
</head>
<head>
    <meta charset="UTF-8">
    <title>제품 상세</title>
</head>
<body>
  <div class="container" style="width: 70%">
		
		<div class="row"><h1 class="page-header" style="text-align: center; margin-bottom: 50px;">${product.pname}</h1>
			<input type="hidden" value="${product.per_num}" id="per_num">
		</div>

		<div class="row productInfo" style="width: 40%; float: right;" >
			<div class="form-group" style="text-align: center;">
				<h3 class="page-header"><span>${product.pname}</span><br></h3>
			</div>
			<div class="form-group" style="text-align: left;">
				<label>가격 : </label><span>&nbsp;<fmt:formatNumber value="${product.pay_amount}" type="number"/></span><span>&nbsp;원</span>
				<input type="hidden" value="${product.pay_amount}" id="price">
			</div>
			<div class="form-group" style="text-align: left;">
				<label>배송비 : </label><span>&nbsp;50주년 무료 이벤트</span>
				
			</div>
			

			<!--<c:choose>
				<c:when test="${productInfo.productDist != 'acc' && productInfo.productDist != 'bag'}">
					<div class="form-horizontal" style="text-align: left;">
						<label>옵션 : </label> 
						<select class="form-control opt_select" name="selectedOpt">
							<option value="S">S</option>
							<option value="M">M</option>
							<option value="L">L</option>
						</select>
					</div>
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>	-->	
			<div class="form-horizontal" style="text-align: left;">
				<label>구매수량 : 1</label> 
				<!-- <select class="form-control" id="select_count">
				<c:forEach begin="1" end="${productInfo.stock}" var="count">
					<option>1</option></c:forEach> -->
				</select>
			</div>	
			<hr>
			
			<div class="row">
				<div class="selected_option" style="text-align: right;">
				</div>
				<div style="text-align: center;">
				 <a href="/work/product/register?per_num=${product.per_num}">
				 
					<button class="btn btn-default">주문하기</button>
				 </a><br>
					<!-- <button class="btn btn-default">장바구니</button> -->
					<!-- <button class="btn btn-default">위시리스트</button> -->
				</div>
			</div>
			<hr>	
		</div>
	</div>
	<div class="container">
		<div class="row nav">
			<nav id="middle_nav">
				<ul class="nav nav-tabs nav-justified">
					<li id="about">상품상세</li>
					<li id="review">리뷰</li>
					<li id="qna">상품문의</li>
				</ul>
			</nav>
		</div>
		
		<div class="row" style="margin: 50px 0;">
			<h1 class="jumbotron">
				<div class="container">
					<h1>Hello world</h1>
					<small>This is product page.</small>
				</div>
			</h1>
		</div>
		
		<div class="row about_product" style="text-align: center;">
			<h1 class="page-header">상품 상세</h1>

		</div>
		<div class="row reviews" style="text-align: center; margin: 80px 0;">
			<h1 class="page-header" style="margin-bottom: 50px;">Review</h1>
			<c:forEach begin="1" end="5">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Panel title</h3>
				</div>
				<div class="panel-body">Panel content</div>
			</div>
			</c:forEach>
		</div>


	</div>
		

</html>