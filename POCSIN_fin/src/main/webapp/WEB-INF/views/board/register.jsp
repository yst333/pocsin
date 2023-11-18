<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<%@include file="../includes/header.jsp" %> 

	 <!--list CSS-->
	 <link rel="stylesheet" href="/resources/board/register.css">

</head>

<%@ include file="../includes/nav.jsp"%>


<!--=============register(insert)================-->
<div class = "row">
  <div class = "col-lg-12">
     <div class = "panel panel-default">
        <!-- /.panel-heading -->
        <div class = "panel-body">
          <p>write</p>
           <form role = "form" action="/board/register" method="post" required="required">
             <%--  <div class="form-group">
                <label>카테고리</label>              
				<select th:field="${board.category}" name="category" class="form-select">
				    <option value="select">카테고리를 선택해주세요</option>
				    <option value="tips">꿀팁</option>
				    <option value="worries">고민</option>
				    <option value="life" >갓생</option>
				</select>
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
                 <input class = "form-control" name = "writer" value="${sessionScope.id}" readonly="readonly">
              </div>
              <div class="input-group mb-3">
                 <!-- <label>첨부파일</label> -->
                 <input type="file" class="form-control" id="inputGroupFile02">
                 <label class="input-group-text" for="inputGroupFile02">Upload</label>
              </div>
              <button type="submit" class="sub_btn btn-default">Submit Button</button>
              <button type="reset" class="reset_btn btn-default">Reset Button</button>
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
				self.location = "/wfflabboard/list";
			});
		});
</script>


<%@ include file="../includes/footer.jsp"%>
