<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
   
    
    <!-- Additional CSS Files -->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/owl.css">
    <link rel="stylesheet" href="/resources/css/animate.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css">

	 <!--list CSS-->
	 <link rel="stylesheet" href="/resources/board/register.css">

</head>


<!--=============register(insert)================-->
<div class = "row">
  <div class = "col-lg-12">
     <div class = "panel panel-default">
        <!-- /.panel-heading -->
        <div class = "panel-body">
          <p>write</p>
           <form role = "form" action="/board/register" method="post">
           	  <%-- <div class="form-group">
                 <label>ID</label>                 
                 <input class = "form-control" name = "id" value="${member.id}" readonly="readonly">
              </div> --%>
              <div class="form-group">
                 <label>제목</label>
                 <input class = "form-control" name = "title">
              </div>
              <div class="form-group">
                 <label>내용</label>
                 <textarea rows="5" class="form-control" name = "content"></textarea>
              </div>
              <div class="form-group">
                 <label>작성자</label>
                 <input class = "form-control" name = "writer">
              </div>
              <div class="input-group mb-3">
                <!-- <label>첨부파일</label> -->
                <input type="file" class="form-control" id="inputGroupFile02">
                <label class="input-group-text" for="inputGroupFile02">Upload</label>
              </div>
              <button type="submit" class="sub_btn btn-default">Submit</button>
              <button type="reset" class="reset_btn btn-default">Reset</button>
           </form>
        </div> <!-- end panel-body -->
     </div> <!-- end panel -->
  </div> <!-- end col-log-12 -->
</div> <!-- end row -->
<!--=============end register(insert)================-->
<script type="text/javascript">
	$(document).ready(
		function(){
			$("#listBtn").on("click", function(){
				self.location = "/board/list";
			});
		});
</script>

	<!-- jQuery -->
    <script src="/resources/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/js/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/js/sb-admin-2.js"></script>

    
    <!-- additional JavaScript -->
    <script src="/resources/js/isotope.min.js"></script>
    <script src="/resources/js/owl-carousel.js"></script>
    <script src="/resources/js/tabs.js"></script>
    <script src="/resources/js/popup.js"></script>
    <script src="/resources/js/custom.js"></script>