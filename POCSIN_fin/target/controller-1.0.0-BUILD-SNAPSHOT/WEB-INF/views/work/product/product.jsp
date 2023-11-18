<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


	 <!--index CSS-->
	 <link rel="stylesheet" href="../../resources/css/product.css">
	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Product</title>

  
<%@ include file="../../includes/header.jsp" %>
<script>
/*$(function(){
    $("#btnAdd").click(function(){
        loation.href="${path}/shop/product/write.do";    
    });
}); /* Add버튼을 누르면 write.do 실행하는 함수 */ 
 
</script>
</head>
<body>

 	<div class="container">
	 <div class="banner">
        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="false">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4" aria-label="Slide 5"></button>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <video src="../../resources/video/pocsin.mp4" class="d-block w-100"></video>
		      <!-- <img src="..." class="d-block w-100" alt="..."> -->
		      <div class="carousel-caption d-none d-md-block">
		        <h5>First slide label</h5>
		        <p>Some representative placeholder content for the first slide.</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <img src="../../resources/images/cloud.svg" class="d-block w-100" alt="cloud">
		      <div class="carousel-caption d-none d-md-block">
		        <h5>Second slide label</h5>
		        <p>Some representative placeholder content for the second slide.</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <video src="../../resources/video/dream.mp4" class="d-block w-100 "></video>
		      <!--<img src="..." class="d-block w-100" alt="...">-->
		      <div class="carousel-caption d-none d-md-block">
		        <h5>Third slide label</h5>
		        <p>Some representative placeholder content for the third slide.</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <img src="../../resources/images/bedcloud.svg" class="d-block w-100" alt="...">
		      <div class="carousel-caption d-none d-md-block">
		        <h5>50주년 이벤트</h5>
		        <p>50주년을 맞이하여 무료배송을 해드립니다!</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <img src="../../resources/images/pandent.svg" class="d-block w-100" alt="...">
		      <div class="carousel-caption d-none d-md-block">
		        <h5>Third slide label</h5>
		        <p>Some representative placeholder content for the third slide.</p>
		      </div>
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
      </div>
      <div class="store_title mt-5" clearfix>
        <h1>STORE</h1>
        <p>폭잠을 위한 숙면템</p>
      </div>
    
    
      
      <section id="store">
		<!-- 탭 메뉴 시작 -->
	    <ul class="nav nav-pills" id="pills-tab" role="tablist">
	  		<li class="nav-item" role="presentation">
	   			<button class="nav-link active" id=" pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">수면등</button>
	 		 </li>
	  		<li class="nav-item" role="presentation">
	   			<button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">가습기</button>
	 		</li>
	  		<li class="nav-item" role="presentation">
	   		 	<button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">잠옷세트</button>
	  		</li>
	  		<li class="nav-item" role="presentation">
	   		 	<button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#pills-messages" type="button" role="tab" aria-controls="pills-messages" aria-selected="false">침구세트</button>
	  		</li>
	  		<li class="nav-item" role="presentation">
	   		 	<button class="nav-link" id="pills-settings-tab" data-bs-toggle="pill" data-bs-target="#pills-settings" type="button" role="tab" aria-controls="pills-settings" aria-selected="false">잠옷세트</button>
	  		</li>
		</ul>
		<!-- 탭 메뉴 끝 -->
		<!-- 탭 내용 시작 -->
		<div class="tab-content  mb-3" id="pills-tabContent" style="margin-left: 9.3%;">
		  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
		  	<!-- 탭 1 내용 -->
		  	<div class="list1">
			  <c:forEach var="row" items="${list1}" varStatus="loop">
			    <div style="width: 30%; float: left; padding: 10px;">
			      <a href="/work/product/productDetail?pno=${row.pno}"><img alt="productImage" src="../../resources/images/${row.pimage}" style="width: 100%;"></a><br>
			      <c:out value="${row.pbrand}" /><br>
			      <a href="/work/product/productDetail?pno=${row.pno}">${row.pname}</a><br>
			      <fmt:formatNumber value="${row.pprice}" pattern="#,###"/><br>
			    </div>
			  
			    <c:if test="${loop.index % 3 == 2 or loop.last}">
			      <div style="clear: both;"></div>
			    </c:if>
			  </c:forEach>
			</div>
		  </div>
			  
		  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">
		  	<!-- 탭 2 내용 -->
			  	<div class="list2">
				  <c:forEach var="row" items="${list2}" varStatus="loop">
				    <div style="width: 30%; float: left; padding: 10px;">
				      <a href="/work/product/productDetail?pno=${row.pno}"><img alt="productImage" src="../../resources/images/${row.pimage}" style="width: 100%;"></a><br>
				      <c:out value="${row.pbrand}" /><br>
				      <a href="/work/product/productDetail?pno=${row.pno}">${row.pname}</a><br>
				      <fmt:formatNumber value="${row.pprice}" pattern="#,###"/><br>
				    </div>
				    
				    <c:if test="${loop.index % 3 == 2 or loop.last}">
				      <div style="clear: both;"></div>
				    </c:if>
				  </c:forEach>
				</div>
			  </div>
			  <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab" tabindex="0">
			  	<h2>c</h2>
			  	<!-- 탭 3 내용 -->
			  	<div class="list3">
				  <c:forEach var="row" items="${list3}" varStatus="loop">
				    <div style="width: 30%; float: left; padding: 10px;">
				      <a href="/work/product/productDetail?pno=${row.pno}"><img alt="productImage" src="../../resources/images/${row.pimage}" style="width: 100%;"></a><br>
				      <c:out value="${row.pbrand}" /><br>
				      <a href="/work/product/productDetail?pno=${row.pno}">${row.pname}</a><br>
				      <fmt:formatNumber value="${row.pprice}" pattern="#,###"/><br>
				    </div>
				    
				    <c:if test="${loop.index % 3 == 2 or loop.last}">
				      <div style="clear: both;"></div>
				    </c:if>
				  </c:forEach>
				</div>
			  </div>
			  <div class="tab-pane fade" id="pills-messages" role="tabpanel" aria-labelledby="pills-contact-tab" tabindex="0">
			  	<!-- 탭 4 내용 -->
			  	<div class="list4">
				  <c:forEach var="row" items="${list4}" varStatus="loop">
				    <div style="width: 30%; float: left; padding: 10px;">
				      <a href="/work/product/productDetail?pno=${row.pno}"><img alt="productImage" src="../../resources/images/${row.pimage}" style="width: 100%;"></a><br>
				      <c:out value="${row.pbrand}" /><br>
				      <a href="/work/product/productDetail?pno=${row.pno}">${row.pname}</a><br>
				      <fmt:formatNumber value="${row.pprice}" pattern="#,###"/><br>
				    </div>
				    
				    <c:if test="${loop.index % 3 == 2 or loop.last}">
				      <div style="clear: both;"></div>
				    </c:if>
				  </c:forEach>
				</div>
			  </div>
			  
			  <div class="tab-pane fade" id="pills-settings" role="tabpanel" aria-labelledby="pills-contact-tab" tabindex="0">
			  	<!-- 탭 5 내용 -->
			  	<div class="list5">
				  <c:forEach var="row" items="${list5}" varStatus="loop">
				    <div style="width: 30%; float: left; padding: 10px;">
				      <a href="/work/product/productDetail?pno=${row.pno}"><img alt="productImage" src="../../resources/images/${row.pimage}" style="width: 100%;"></a><br>
				      <c:out value="${row.pbrand}" /><br>
				      <a href="/work/product/productDetail?pno=${row.pno}">${row.pname}</a><br>
				      <fmt:formatNumber value="${row.pprice}" pattern="#,###"/><br>
				    </div>
				    
				    <c:if test="${loop.index % 3 == 2 or loop.last}">
				      <div style="clear: both;"></div>
				    </c:if>
				  </c:forEach>
				</div>
			  </div>
		  
		  <!-- 탭 내용 끝 -->
			
		</div>
      </section>
    </div>

 



<%@ include file="../../includes/footer.jsp"%>
</body>

