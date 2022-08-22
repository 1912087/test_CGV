<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.dao.CgvBoardDAO, com.mycgv2.vo.CgvBoardVO" %>
<% 
	String bid = request.getParameter("bid");
	CgvBoardDAO dao = new CgvBoardDAO();
	CgvBoardVO vo = dao.select(bid);
	
	//조회수 업데이트
	//쿠키 불러오기
	Cookie[] cookieList = request.getCookies();
	
	//쿠키를 담을 변수
	String cookieMember = null;
	
	//쿠키 세션 처리
	if(session.getAttribute(bid + ":cookie") == null){
		session.setAttribute(bid + ":cookie" , bid + ":" + cookieMember);
	}else{
		session.setAttribute(bid + ":cookie ex", bid + ":" + cookieMember);
		if(session.getAttribute(bid + ":cookie").equals(bid + ":" + cookieMember)){
			session.setAttribute(bid + ":cookie", bid + ":" + cookieMember);
		}
	}
	
	if(!session.getAttribute(bid + ":cookie").equals(session.getAttribute(bid + ":cookie ex"))){
		if(vo != null){
			int result = dao.updateBhits(bid);
			if(result == 1){
				//조회수 업데이트 성공 시 가시적으로 조회수를 올려줌
				vo.setBhits(vo.getBhits() + 1);
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV</title>
<link rel="stylesheet"  href="http://localhost:8020/mycgv2/css/mycgv.css">
<script src = "http://localhost:8020/mycgv2/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		let height = $(".popup").innerHeight() - $("#close").outerHeight();
		$("form[name = 'boardDeleteForm']").css("height", height);
		
		$("#deleteClick").click(()=>{
			$(".background").addClass("show");
			$(".popup").addClass("show");
		});
		
		$("#close").click(function(){
			$(".background").removeClass("show");
			$(".popup").removeClass("show");
		});
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
		<h1>게시판-상세보기</h1>
		<table class="boardContent">	
			<tr>				
				<th>등록일자</th>
				<td><%= vo.getBdate() %></td>
				<th>조회수</th>
				<td><%= vo.getBhits() %></td>
			</tr>		
			<tr>				
				<th>제목</th>
				<td colspan="3"><%= vo.getBtitle() %></td>
			</tr>
			<tr>				
				<th>내용</th>
				<td colspan="3"><%= vo.getBcontent() %><br><br><br><br></td>
			</tr>
			<tr>
				<td colspan="4">
					<a href="board_update.jsp?bid=<%= vo.getBid() %>"><button type="button" class="btn_style">수정하기</button></a>
					<button type="button" class="btn_style" id = "deleteClick">삭제하기</button>
					<a href="board_list.jsp">
						<button type="button" class="btn_style">리스트</button>
					</a>
				</td>
			</tr>			
		</table>	
	</div>
	
	<style>
		.background {
			position : fixed;
			top : 0;
			left : 0;
			width : 100%;
			height : 100vh;
			background-color : rgba(0, 0, 0, 0.3);
			opacity : 0;
			z-index : -1;
		}
		.window {
			position : relative;
			top : 0;
			left : 0;
			width : 100%;
			height : 100vh;
		}
		.popup {
			position : absolute;
			top : 50%;
			left : 50%;
			transform : translate(-50%, -30%);
			background-color : white;
			border-radius : 50% 50% 0 50%;
			width : 500px;
			height : 500px;
			z-index : -1;
		}
		form[name = 'boardDeleteForm'] {
			width : inherit;
			display : flex;
			justify-content : flex-end;
			align-content : center;
			flex-wrap : wrap;
		}
		form[name = 'boardDeleteForm'] ul {
			border : none;
		}
		#close {
			background-color : tomato;
			border : none;
			width : 40px;
			height : 40px;
		}
		#close img {
			width : 20px;
		}
		#deleteOk, #listOk {
			transition-duration : 0.4s;
		}
		#listOk:hover, #deleteOk:hover	{
			background-color : tomato;
			cursor : pointer;
		}
		.show {
			opacity : 1;
			z-index : 1;
			transition : all 0.5s;
		}
		.show .popup {
			z-index : 1;
			transform : translate(-50%, -50%);
			transition : all 0.5s;
		}
	</style>
	<div class = "background">
		<div class = "window">
			<div class = "popup">
				<form name="boardDeleteForm" action="boardDeleteController.jsp" method="post">
					<button type="button" id = "close"><img src = "http://localhost:8020/mycgv2/images/cross.png"></button>
					<input type = "hidden" name = "bid" value = "<%= bid %>">
					<ul>
						<li>
							<img src="../images/delete.jpg"> <!-- 휴지통 이미지 -->					
						</li>				
						<li>
							<div>정말로 삭제하시겠습니까?</div>
						</li>
						<li>
							<button type="submit" class="btn_style" id = "deleteOk">삭제완료</button>					
							<a href="board_list.jsp"><button type="button" class="btn_style" id = "listOk">리스트</button></a>
						</li>
					</ul>
				</form>
			</div>
		</div>
	</div>
	<!-- footer Include -->
	<iframe src="http://localhost:8020/mycgv2/footer.jsp" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>







