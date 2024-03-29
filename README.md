<h1>POCSIN</h1>
<h3>숙면을 위한 현대인들의 커뮤니티로 클리닉 소개와 온라인 상품 판매를 겸한 쇼핑몰 웹/앱 반응형 서비스 개발</h3>

<div>
<!--OVERVIEW-->
<img src="https://github.com/yst333/pocsin/assets/141698056/866869c3-fd4e-4c33-ab6a-23d511a38a28" style="width:48%;">
<!--DESK REARCH-->
<img src="https://github.com/yst333/pocsin/assets/141698056/e961311c-57c1-4e14-a31e-9b1150eb031e" style="width:48%;"> <br>
<!--PERSONA-->
<img src="https://github.com/yst333/pocsin/assets/141698056/e0dbce7f-b829-48d4-9628-b1aeb8a8738f" style="width:48%;">
<!--INSIGHT-->
<img src="https://github.com/yst333/pocsin/assets/141698056/ff210aa5-922f-41f4-9225-e608e58e25b6" style="width:48%;">

</div>
<strong>☁ &nbsp; Overview</strong>
<p>“POCSIN”은 불면증으로 불편을 겪는 고객들의 꿀잠 꿀팁 정보를 공유하는 커뮤니티로 수면에 대한 정보와 솔루션을 제공하고, 숙면을 위한 상품을 판매하는 반응형 웹/앱 쇼핑몰입니다. 저희 커뮤니티& 쇼핑몰은 OracleDB 데이터베이스를 활용하여 앱/웹 서비스를 제공합니다. AndroidApp(JDK), SpringBoot를 이용하여 편안한 잠자리를 위한 sounds 기능과 상품 및 클리닉 소개로 접근성을 높였고, REACT, Spring, SpringBoot를 활용하여 더 많은 서비스 제공을 위해 웹 반응형 사이트를 구현하였습니다.</p>

<h3>⌨ &nbsp; 개발언어</h3>
<ul class="language">
	<li>
		<code>JAVA</code>
	</li>
	<li>
		<code>JSP</code>
	</li>
	<li>
		<code>HTML5</code>
	</li>
  	<li>
		<code>CSS3</code>
	</li>
	<li>
		<code>Javascript</code>
	</li>
	<li>
		<code>SQL</code>
  	</li>	
	<li>
		<code>JQuery</code>
		<code>Ajax</code>
	</li>	
	<li>
		<code>REACT</code>
	</li>	
	<li>
		<code>AndroidApp(JDK)</code>
  	</li>	
</ul>
<h3>📚 &nbsp; TOOL</h3>
<ul class="tool">
	<li>
		<code>STS</code>
	</li>
	<li>
		<code>Sql developer</code>
	</li>
	<li>
		<code>Exerd ERD</code>
	</li>
  	<li>
		<code>Android Studio</code>
	</li>
	<li>
		<code>Visual Studio Code</code>
	</li>
	<li>
		<code>Media Query</code>
  	</li>	
	<li>
		<code>Figma</code>
	</li>	
	<li>
		<code>Notion</code>
	</li>	
</ul>
<h3>🌐 &nbsp; OPEN API</h3>
<ul class="tool">
	<li>
		<code>공공포털 행정안전부 도로명 주소 API</code>
	</li>
	<li>
		<code>챗봇(Channel Talk)</code>
	</li>
	<li>
		<code>Kakao Map API</code>
	</li>
  	<li>
		<code>Google Maps Platform</code>
	</li>
	<li>
		<code>PG 이니시스 카드 결제 API</code>
	</li>
	
</ul>
<h3>COLLABORATION</h3>
<ul class="collaboration">
	<li>
		<code>Git/Github</code>
	</li>
	<li>
		<code>Sourcetree</code>
	</li>
	<li>
		<code>Trello Agile Kanban Board</code>
	</li>
</ul>

<br>
<br>

<!--user-->
<h2>🖥️ &nbsp; 사용자 웹페이지 기능</h2>
<h3>📦 상품 리스트</h3>
<p>select1(), select2(), …, select5() 각 메서드들이 서로 다른 쿼리를 실행하여 상품 목록을 다양하게 보여줄 수 있습니다.</p>
<img src="https://github.com/yst333/pocsin/assets/141698056/dee36492-35b8-4354-84fc-984eb09d131c">

<br><br>


<h3>🚚 상품 구매</h3>
<img src="https://github.com/yst333/pocsin/assets/141698056/ef79a68f-4f9d-4777-be57-5603f0ff5ea7">

<strong>상품 상세</strong>
<p>데이터베이스에서 읽을 제품의 기본 키인 pno 칼럼에 primary_key 제약조건을 부여한 후 Long 타입으로 필드 선언하여 상품별로 조회할 수 있도록 했습니다.</p>
<hr>

<strong>배송지정보</strong>
<p>
1. goPopup() 함수로 주소 검색을 위한 팝업 페이지(/jusoPopup.jsp)를 호출 <br>
2. jusoCallBack() 함수로 팝업 페이지에서 주소 입력 정보를 받아와 현재 페이지의 입력 요소에 값을 설정하였습니다
</p>

<hr>
<strong> 결제</strong>
<p>
1.배송지 입력 후 결제하기 클릭시 PG사 카드결제가 진행되도록 설계 하였습니다. <br>
2.변수를 사용하여 결제창에 상품명과  상품가격이 반영되도록 하였습니다. <br>
3.처리 성공시 결제내역으로 돌아가고, 실패시에는 alert로 안내처리를 하였습니다.
</p>

<hr>
<strong>🧾 구매내역</strong>
<p>카드결제를 완료하면 PG사를 통해 상품가격이 출금되고, CRUD의 READ기능을 사용해 객체로 불러와 필요항목만 화면에 띄워 사용자가 방금 결제한 내용을 확인하도록 하였습니다.</p>

<br><br>

<h3>✨ 이벤트</h3>
<p>jQuery-cookie 라이브러리를 이용해서 3일 동안 이 창 열지않기 체크박스에 체크를 하면 생성된 쿠키가 3일간 남아있게 되고, 쿠키가 남아있으면 팝업이 뜨지 않도록 했습니다.</p>
<img src="https://github.com/yst333/pocsin/assets/141698056/8acd873c-1ab2-45f5-a9bb-fe1df4d9ad18)">

<br><br>

<h3>🎈 자유게시판</h3>
<p>게시글 CRUD 및 페이징 처리, 댓글 CRUD, 카운트 기능을 화면에서 출력될 수 있도록 구현하습니다. <br>
검색 기능을 추가하여 글제목, 작성자, 글내용별로 검색이 가능하도록 구현하였습니다.  모달창으로 수정, 등록, 삭제 시 알림처리를 구현하였습니다.
</p>
<img src="https://github.com/yst333/pocsin/assets/141698056/d825bdbb-6a74-4961-8dc0-5fa1b4b637b3">

<br><br>

<h3>💬 1:1문의사항</h3>
<p>origins를 메인 화면으로 설정하고 RequestMapping 처리한 후 해당 페이지의 URL을 PostMapping 해서 화면에 입력된 데이터를 가져왔습니다</p>
<img src="https://github.com/yst333/pocsin/assets/141698056/cee9e4db-7721-4eda-9811-3122f3759c10"/>

<br><br>

<h3>📢 공지사항</h3>
<p>
GetMapping으로 관리자가 등록한 게시글을 CRUD의 Read를 사용하여 읽어왔습니다. <br>
글 번호를 기준으로 최신  공지사항이 상단에 뜨게 하였습니다.</p>
<img src="https://github.com/yst333/pocsin/assets/141698056/5edd16c2-9dd9-4306-af84-307bd8159379">

<br><br>

<h3>🧭 찾아오시는길</h3>
<p> 
Kakao Map API를 사용하여 지도 구현했습니다. <br>
AOS 라이브러리를 사용하여 아이콘을 효과적으로 표현하고, 클리닉 대해 간편 상담 신청이 가능하며, 개인정보 약관은 POP-UP창으로 구현하였습니다.
</p>
<img src="https://github.com/yst333/pocsin/assets/141698056/c126e81a-e407-445f-8d28-e5c0491f7f13">

<br><br>

<h3>🗃 마이페이지</h3>
<p>GetMapping으로 회원정보를 불러들여온 후 로그인 한 세션에 남아있는 계정에 대해서 PostMapping으로 회원정보 수정 또는 탈퇴처리 하도록 구현하였습니다. </p>
<img src="https://github.com/yst333/pocsin/assets/141698056/ee9eaf46-2c2e-41c1-be6f-4742c2dd0217">

<br><br>
<hr>



<!--admin-->
<h2>🖥️ &nbsp;관리자 웹페이지 기능</h2>

<h3>☑ 판매내역</h3>
<p>JPA를 이용해 결제일자 기준으로 최신 판매내역이 상단에 뜨도록 READ기능을 적용하고 Axios로 값을 불러와 구매자 사이트에서 확인 되도록 하였습니다. fotmatDate() 자바스크립을 이용해 날짜형식을 바꿔 가독성을 높였습니다.</p>

<br><br>

<h3>☑ 공지사항</h3>
<p>
Spring Boot MVC , CRUD 를 이용하여 관리자가 공지사항 게시판을 작성, 조회, 작성 ,삭제 할수 있도록 기능 구현 하였습니다. <br>
AXIOS 라이브러리를 사용하여 서버통신이 가능하도록 했습니다.
</p>
<img src="https://github.com/yst333/pocsin/assets/141698056/8bd2eaa2-b852-44d7-8f67-f2207c887b79">

<br><br>

<h3>☑ 문의사항</h3>
<p>Spring Boot MVC , Read 를 이용하여 관리자가 QnA 게시판을  조회할수 있도록 기능 구현 하였습니다. AXIOS 라이브러리를 사용하여 서버통신이 가능하도록 했습니다. </p>

<br><br>

<h3>☑ 1:1문의</h3>
<p>Spring Boot MVC , CRUD 를 이용하여 관리자가 클리닉 간편 상담 게시글을 조회 할 수 있도록 기능 구현 하였습니다. AXIOS 라이브러리를 사용하여 서버통신이 가능하도록 했습니다. </p>
<img src="https://github.com/yst333/pocsin/assets/141698056/2dff37ee-9641-4d05-a79f-cf3e51064388)">

<br>
<hr>

<h3>💫 구동 방법</h3>
<p>back-end/README.md참조</p>

<h3>🔗링크</h3>




