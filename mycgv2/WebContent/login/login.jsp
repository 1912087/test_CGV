<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String join = request.getParameter("join");
	String result = request.getParameter("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV</title>
<link rel="stylesheet"  href="http://localhost:8020/mycgv2/css/mycgv.css">
<script src="http://localhost:8020/mycgv2/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:8020/mycgv2/js/mycgv_jquery.js"></script>
<script>
	$(document).ready(function(){
		let joinCheck = "<%= join %>";
		if(joinCheck == "ok"){
			alert("회원가입이 완료되었습니다.");
		}
		
		let loginCheck = "<%= result %>";
		if(loginCheck == 1){
			alert("비밀번호가 일치하지 않습니다.");
		}else if(loginCheck == 0){
			alert("존재하지 않는 아이디입니다.");
		}
		
	});
</script>
</head>
<body>
	<!-- Header Include -->
	<iframe src="http://localhost:8020/mycgv2/header.jsp" width="100%" height="160px" scrolling="no" frameborder=0 ></iframe>
	
	
	<!---------------------------------------------->
	<!--------------- Content ----------------------->
	<!---------------------------------------------->
	<div class="content">
	 <h1>Login</h1>
		<form name="loginForm" action="loginController.jsp" method="post">
		<ul>
			<li>
				<label>아이디</label>
				<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요">
			</li>
			<li>
				<label>패스워드</label>
				<input type="password" name="pass" id="pass">
			</li>
			<li>
				<button type="button" id="btnLogin">로그인</button>
				<button type="reset">다시쓰기</button>
			</li>
		</ul>
		</form>
	</div>
	
	<!-- footer Include -->
	<iframe src="http://localhost:8020/mycgv2/footer.jsp" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>







