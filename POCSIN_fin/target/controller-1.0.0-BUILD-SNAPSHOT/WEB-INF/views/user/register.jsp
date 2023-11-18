<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script type="text/javascript">
var dong;
var imageFolder;

$(document).ready(function(){
//    $('#dataTables-example').dataTable();
   fn_init();

   imageFolder = "userImg";

   $( "#birth" ).datepicker({
       dateFormat: 'yy-mm-dd',
       changeMonth: true,
        changeYear: true,
        yearRange: "1980:2015"
    });

   $("#dong").keydown(function (key){
      if(key.keyCode == 13){
         fn_postCheck();
      }

   });
});

function fn_setData(self){
   var postAllData = self.children().text();

   var postSplit = postAllData.split(" ");

   var zipcode = postSplit[0].split("-");
   var postNum1 = zipcode[0];
   var postNum2 = zipcode[1];
   var sido = postSplit[1];
   var gugun = postSplit[2];
   var dong = postSplit[3];
   var subDong = postSplit[4];

   if(subDong == null) subDong = "";

   var detailAddress = sido + " " + gugun + " " + dong + " " + subDong;

   $("#postNum1").val(postNum1);
   $("#postNum2").val(postNum2);

   $("#address1").val(detailAddress);

   $("#searchPost").modal('hide');
}

function fn_postCheck(){
   dong = $("#dong").val();

   if(dong == ""){
      alert("동을 입력하세요.");
      return;
   }
   $("#postBody").children().remove();

   var aheadHtml = "<tr><td style='text-align: center;'><a onclick=javascript:fn_setData($(this))><b>";
   var backHtml = "</b></a></td></tr>";
   var appendHtml = "";
   var param = {};


   param["dong"] = dong;

   $.ajax({
         url:"${context}/work/applicant/retrievePostByDong.do",
      contentType:"application/json",
      dataType:"json",
      data:param,
         success:function(result){
            for(var i = 0; i < result.length; i++){
               appendHtml
                  += aheadHtml
                  + result[i].zipcode + " "
               + result[i].sido    + " "
                + result[i].gugun   + " "
               + result[i].dong    + " "
               + backHtml;
            }
               $("#postBody").append(appendHtml);
         }
      });
}

function fn_save(){
   if(!fn_validation()) return;
   if($("#flag").val() == "false"){
      alert("이미 사용중인 ID입니다");
      $("id").focus();
      return;
   }


   $("#phoneNum").val($("#phone1").val() + "-" + $("#phone2").val());
   
   // 11단계 : 아래 2줄 소스 #zipNo, #roadAddrPart1, #addrDetail 변경해 줌.
                      //            그리고, 회원가입 웹페이지 새로고침(F5) 후에 전체적으로 회원 정보 등록 가입하고 로그인 확인함.
    $("#postNum").val($("#zipNo").val());       
    $("#address").val($("#roadAddrPart1").val() + "/" + $("#addrDetail").val());
   
    // $("#postNum").val($("#postNum1").val() + "-" + $("#postNum2").val());
    // $("#address").val($("#address1").val() + "/" + $("#address2").val());

    $("#joinFrm").submit();
}

function idCheck(){
   var id = $("#id").val();
   var access = $("#message");
   $.ajax({
      url:"${context}/work/user/idCheck.do?id=" + id,
      success:function(result){
         result2 = result.replace(/"/gi, "");
         var splResult = result2.split("@");
         access.html(splResult[0]);
         $("#flag").val(splResult[1]);
      }
   });
}

function fn_upload(){
   $("#ajaxform").ajaxSubmit({
        type: "POST",
        dataType: 'text',
        url: $("#ajaxform").attr("action"),
        data: $("#ajaxform").serialize(),
        success: function (data) {
           data2 = data.replace(/"/gi, "");
           var imageUrl = "${context}/userImg/" + data2;
           $("#pic").attr("src", imageUrl);
           $("#userImage").val(data2);
        },
        error: function (xhr, status, error) {
            alert(error);
        }
    });
}
</script>
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
            <!-- 2단계 : 아래 구문에서 우편번호 텍스트 수정 -->
            <label for="zipNo" class="control-label col-md-2"><b>우편번호</b></label>
            <!-- 
            <label for="postnum1" class="control-label col-md-2"><b>주소</b></label>
             -->
            <div class="col-md-2">
               <!-- 3단계 : 아래 구문에서 우편번호 id="zipNo"  name="zipNo" 추가 -->
               <input class="form-control" type="text" id="zipNo"  name="zipNo" disabled="disabled" required="required"/>
               <!-- 
               <input class="form-control" type="text" id="postNum1" disabled="disabled" required="required"/>
                -->
              </div>
              <!-- 4단계 : 아래 우편번호 두번째 입력란은 필요 없기에 주석 처리를 해줍니다! -->
              <!--
            <div class="col-md-2">                
               <input class="form-control" type="text" id="postNum2" disabled="disabled" required="required"/>               
            </div>
             -->
            <span class="col-md-1">
               <!-- 5단계 : 아래 구문에서 onClick="goPopup(); goPopup 메서드 호출 구문 추가 -->
               <button type="button" class="btn btn-info" data-toggle="modal" onClick="goPopup();"><b>주소검색</b></button>
               <!-- 
               <button type="button" class="btn btn-info" data-toggle="modal" data-target="#searchPost"><b>주소검색</b></button>
                -->
            </span>
            <input type="hidden" id="postNum" name="postNum">
         </div>

         <div class="form-group">
            <!-- 6단계 : 아래 "상세주소" 텍스트를 "도로명주소"로 변경함  -->
            <label for="roadAddrPart1" class="control-label col-md-2"><b>도로명주소</b></label>
            <!-- 
            <label for="address1" class="control-label col-md-2"><b>상세주소</b></label>
             -->
            <div class="col-md-6">
               <!-- 7단계 : 아래에 id="roadAddrPart1"  name="roadAddrPart1" 속성과 값을 추가함  -->
               <input class="form-control" type="text" id="roadAddrPart1"  name="roadAddrPart1" disabled="disabled" required="required"/>
               <!-- 
               <input class="form-control" type="text" id="address1" disabled="disabled" required="required"/>
                -->
            </div>
         </div>

         <div class="form-group">
            <!-- 8단계 : 아래에 label 태그 안에 "상세주소" 텍스트를 추가해 줌  -->
            <label for="addrDetail" class="control-label col-md-2">
               <b><font color="red">*&nbsp;</font>상세주소</b>
            </label>
            <div class="col-md-6">
               <!-- 9단계 : 아래에 id="addrDetail"  name="addrDetail" 속성과 값을 추가함  -->
               <input class="form-control" type="text" id="addrDetail"  name="addrDetail" />
               <!-- 
               <input class="form-control" type="text" id="address2"/>
                -->
            </div>
            <input type="hidden" id="address" name="address">
         </div>
		<button type="submit" value="가입하기">가입하기</button>
</form>

   <script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
   // 10단계 : 아래에 window 객체의 open() 메서드 주소를 ${context}/user/jusoPopup.jsp 로 변경처리 해 줌
   // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.   
    var pop = window.open("/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    
   // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadAddrPart1,addrDetail,zipNo){
   // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
   document.joinFrm.roadAddrPart1.value = roadAddrPart1;   
   document.joinFrm.addrDetail.value = addrDetail;
   document.joinFrm.zipNo.value = zipNo;
}
</script>

</body>
</html>