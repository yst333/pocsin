<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<!-- jQuery -->
<script
	src="/resources/js/jquery-3.5.1.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js"></script>

</head>
<body>
<form id="joinFrm" name="joinFrm" role="form" method="post" action="/user/register">
	아이디 : <input type="text" name="id" id="id">
	<p id="idcheck"></p>
	비밀번호 : <input type="password" name="pw" id="pw">
	<p id="pwcheck"></p>
	이름 : <input type="text" name="name" id="name">
	<p id="nncheck"></p>
	이메일 : <input type="text" name="email" id="email">
	<p id="phcheck"></p>
	연락처 : <input type="text" name="phoneNum" id="phoneNum">
	<p id="phoneNum"></p>
	<div class="form-group">

            <label for="zipNo" class="control-label col-md-2"><b>우편번호</b></label>

            <div class="col-md-2">
               <input class="form-control" type="text" id="zipNo"  name="zipNo" disabled="disabled" required="required"/>
              </div>

            <span class="col-md-1">
               <button type="button" class="btn btn-info" data-toggle="modal" onClick="goPopup();"><b>주소검색</b></button>
            </span>
            <input type="hidden" id="postNum" name="postNum">
         </div>

         <div class="form-group">
            <label for="roadAddrPart1" class="control-label col-md-2"><b>도로명주소</b></label>
            <div class="col-md-6">
               <input class="form-control" type="text" id="roadAddrPart1"  name="roadAddrPart1" disabled="disabled" required="required"/>
            </div>
         </div>

         <div class="form-group">
            <label for="addrDetail" class="control-label col-md-2">
               <b><font color="red">*&nbsp;</font>상세주소</b>
            </label>
            <div class="col-md-6">
               <input class="form-control" type="text" id="addrDetail"  name="addrDetail" />

            </div>
            <input type="hidden" id="address" name="address">
         </div>
		<button type="submit" value="가입하기" onclick="fn_save()">가입하기</button>
</form>

<script type="text/javascript">
$(document).ready(function(){
   console.log("1");
});


function fn_save(){
	
	console.log("2");

    $("#postNum").val($("#zipNo").val());       
    $("#address").val($("#roadAddrPart1").val() + "/" + $("#addrDetail").val());

    $("#joinFrm").submit();
}


function goPopup(){  
	console.log("3");
    var pop = window.open("/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 

}
/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadAddrPart1, addrDetail, zipNo){
	console.log("4");
   document.joinFrm.roadAddrPart1.value = roadAddrPart1;   
   document.joinFrm.addrDetail.value = addrDetail;
   document.joinFrm.zipNo.value = zipNo;
   
}
</script>

</body>
</html>