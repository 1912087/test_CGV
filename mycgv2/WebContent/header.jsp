<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sid = (String)session.getAttribute("sid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="http://localhost:8020/mycgv2/css/mycgv.css">
<script src = "http://localhost:8020/mycgv2/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!---------------------------------------------->
	<!--------------- Header ----------------------->
	<!---------------------------------------------->
	<header>
		<div class="header_contents1">
			<div>
				<a href="http://localhost:8020/mycgv2/index.jsp" target="_parent">
					<img src="http://localhost:8020/mycgv2/images/logoRed.png" width="150" height="70"></a>
				<span>CULTURFLEX</span>
			</div>
			<!-- 로그인을 하지 않은 경우 -->
			<% if(sid == null){ %>
			<div>
				<img src="http://localhost:8020/mycgv2/images/hcard.png">
				<a href="http://localhost:8020/mycgv2/login/login.jsp" target="_parent" >
					<img src="http://localhost:8020/mycgv2/images/loginPassword.png">
					<span>로그인</span>
				</a>	
				
				<a href="http://localhost:8020/mycgv2/join/join.jsp" target="_parent" >
					<img src="http://localhost:8020/mycgv2/images/loginJoin.png">
					<span>회원가입</span>
				</a>
				<a href="http://localhost:8020/mycgv2/mycgv/mycgv.jsp" target="_parent">
					<img src="http://localhost:8020/mycgv2/images/loginMember.png">
					<span>MY CGV</span>
				</a>
				<a href="http://localhost:8020/mycgv2/board/board_list.jsp" target="_parent" >
					<img src="http://localhost:8020/mycgv2/images/loginCustomer.png">
					<span>게시판</span>
				</a>
				<a href="http://localhost:8020/mycgv2/notice/notice_list.jsp" target="_parent" >
					<img src="http://localhost:8020/mycgv2/images/loginCustomer.png">
					<span>공지사항</span>
				</a>				
			</div>
			
			<!-- 로그인 성공 시 -->
			<% } else { %>
			<div>
				<img src="http://localhost:8020/mycgv2/images/hcard.png">
				<a href="http://localhost:8020/mycgv2/login/logoutController.jsp" target="_parent" id = "logout">
					<img src="http://localhost:8020/mycgv2/images/logout.png">
					<span>로그아웃</span>
				</a>
				<a href="http://localhost:8020/mycgv2/join/join.jsp" target="_parent" >
					<img src="http://localhost:8020/mycgv2/images/loginJoin.png">
					<span>회원가입</span>
				</a>
				<a href="http://localhost:8020/mycgv2/mycgv/mycgv.jsp" target="_parent">
					<img src="http://localhost:8020/mycgv2/images/loginMember.png">
					<span>MY CGV</span>
				</a>
				<a href="http://localhost:8020/mycgv2/board/board_list.jsp" target="_parent" >
					<img src="http://localhost:8020/mycgv2/images/loginCustomer.png">
					<span>게시판</span>
				</a>
				<a href="http://localhost:8020/mycgv2/notice/notice_list.jsp" target="_parent" >
					<img src="http://localhost:8020/mycgv2/images/loginCustomer.png">
					<span>공지사항</span>
				</a>
				<!-- 관리자 계정일 경우에만 보이도록 설정 -->
				<% if(sid.equals("admin")){ %>
				<a href="http://localhost:8020/mycgv2/admin/admin.jsp" target="_parent" >
					<img src="http://localhost:8020/mycgv2/images/loginCustomer.png">
					<span>Admin</span>
				</a>	
				<% } %>			
			</div>
			<% } %>
		</div>
		<div class="header_contents2">
			<nav>
				<ul class="dropdown">
					<li>
						<h2><a href="#">영화</a></h2>
						<dl class="dropdown-content">
							<dt><h2>영화</h2></dt>
							<dd><h3>무비차트</h3></dd>
							<dd><h3>아트하우스</h3></dd>
							<dd><h3>ICECON</h3></dd>							
						</dl>				
					</li>
					<li>
						<h2><a href="#">극장</a></h2>
						<dl class="dropdown-content">
							<dt><h2>극장</h2></dt>
							<dd><h3>CGV 극장</h3></dd>
							<dd><h3>특별관</h3></dd>
						</dl>				
					</li>
					<li>
						<h2><a href="#">예매</a></h2>
						<dl class="dropdown-content">
							<dt><h2>예매</h2></dt>
							<dd><h3>빠른예매</h3></dd>
							<dd><h3>상영스케줄</h3></dd>
							<dd><h3>English Ticketing</h3></dd>
							<dd><h3>English Schedule</h3></dd>
						</dl>				
					</li>
					<li>
						<h2><a href="#">스토어</a></h2>
						<dl class="dropdown-content">
							<dt><h2>영화관람권</h2></dt>
							<dd><h3>기프트카드</h3></dd>
							<dd><h3>콤보</h3></dd>
							<dd><h3>팝콘</h3></dd>
							<dd><h3>음료</h3></dd>
							<dd><h3>스낵</h3></dd>
							<dd><h3>플레이존</h3></dd>
						</dl>				
					</li>
					<li>
						<h2><a href="#">이벤트</a></h2>
						<dl class="dropdown-content">
							<dt><h2>이벤트</h2></dt>
							<dd><h3>SPECIAL</h3></dd>
							<dd><h3>영화/예매</h3></dd>
							<dd><h3>멤버십/CLUB</h3></dd>
							<dd><h3>CGV 극장별</h3></dd>	
						</dl>				
					</li>
					<li>
						<h2><a href="#">혜택</a></h2>
						<dl class="dropdown-content">
							<dt><h2>혜택</h2></dt>
							<dd><h3>CGV 할인정보</h3></dd>
							<dd><h3>CLUB 서비스</h3></dd>
							<dd><h3>VIP 라운지</h3></dd>							
						</dl>				
					</li>				
				</ul>
			</nav>		
		</div>	
	</header>
</body>
</html>