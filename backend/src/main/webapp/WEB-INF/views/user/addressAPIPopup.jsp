<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>webapp > addressAPIPopup.jsp 소스코딩</title>

<link rel='stylesheet' type='text/css' media='screen' href='/resources/css/bootstrap-3.3.2.min.css'>
<script src="resources/js/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
// https://business.juso.go.kr/addrlink/openApi/searchApi.do 웹사이트에서
// 하단 "웹 호출 소스 보기"에서 "JSON" 클릭해서 참고 합니다.
// 도로명 주소로 검색 api 연동을 ajax로 처리 합니다.
function fn_search(){
	$.ajax({
		 url :"https://business.juso.go.kr/addrlink/addrLinkApiJsonp.do"  //인터넷망
		,type:"post"
		,data:$("#searchForm").serialize()
		,dataType:"jsonp"
		,crossDomain:true
		,success:function(jsonStr){
			var errCode = jsonStr.results.common.errorCode;
			var errDesc = jsonStr.results.common.errorMessage;
			if(errCode != "0"){
				alert(errCode+"="+errDesc);
			}else{
				if(jsonStr != null){
					fn_makeListJson(jsonStr);
				}
			}
		}
	    ,error: function(xhr,status, error){
	    	alert("에러발생");
	    }
	});
}

// 결과 테이블 생성 : 위에서 호출 받아서 처리할 fn_makeListJson(jsonStr) 메서드 선언
function fn_makeListJson(jsonStr){
	var htmlStr = "";
	$(jsonStr.results.juso).each(function(){
		htmlStr += "<tr onclick=\"javascript:chooseAddress('"+this.roadAddr+"', '"+this.jibunAddr+"', '"+this.postNum+"');\">";
		htmlStr += "<td>"
		htmlStr += "<dl>"+this.roadAddr+"</dl>";
		htmlStr += "<dl>"+this.jibunAddr+"</dl>";
		htmlStr += "</td>";
		htmlStr += "<td>"+this.postNum+"</td>";
		htmlStr += "</tr>";
	});
	$("#addressTableTbody").html(htmlStr);
}

// enter키 이벤트 처리 enterSearch()메서드 선언
function enterSearch() {
	var evt_code = (window.netscape) ? ev.which : event.keyCode;
	if (evt_code == 13) {    
		event.keyCode = 0;  
		fn_search(); //jsonp사용시 enter검색 
	} 
}

//// 주소선택
function chooseAddress(roadAddr, jibunAddr, postNum) {
	var aParam = [];
	aParam["roadAddr"] = roadAddr;
	// aParam["jibunAddr"] = jibunAddr;   // 필요시 추가 활용함
    // aParam["zipNo"] = zipNo;          // 필요시 추가 활용함
    
    opener.callback_openAddressPopup(aParam);
    window.close();
}

</script>
</head>
<body>

	<div class="container" style="margin-top:25px">
		<div id="memberSearchForm" class="text-center">
			<form name="searchForm" id="searchForm" method="post" class="navbar-form navbar-left" role="search" onsubmit="event.preventDefault();">
				<input type="hidden" name="currentPage" value="1"/> <!-- 요청 변수 설정 (현재 페이지. currentPage : n > 0) -->
				<input type="hidden" name="countPerPage" value="100"/><!-- 요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100) -->
				<input type="hidden" name="resultType" value="json"/> <!-- 요청 변수 설정 (검색결과형식 설정, json) --> 
				<input type="hidden" name="confmKey" id="confmKey" value="devU01TX0FVVEgyMDIzMTAxNjEwMTcxOTExNDE3Mjk="/><!-- 요청 변수 설정 (승인키) -->
				<div class="form-group">
					<input type="text" id="keyword" name="keyword" class="form-control" placeholder="도로명+건물번호, 건물명, 지번을 입력하세요" onkeypress="javascript:enterSearch()" />
				</div>
				<input type="button" class="btn btn-default" onclick="javascript:fn_search()" value="주소검색하기">
			</form>
		</div>
		<div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>주소</th>
						<th>우편번호</th>
					</tr>
				</thead>
				<tbody id="addressTableTbody">
					
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>