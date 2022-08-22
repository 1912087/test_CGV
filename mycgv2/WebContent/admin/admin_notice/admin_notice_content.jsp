<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.dao.CgvNoticeDAO, com.mycgv2.vo.CgvNoticeVO" %>
<%
	String sid = (String)session.getAttribute("sid");
	if(sid == null){
%>
<script>
	alert("권한이 없습니다.");
	location.href = "http://localhost:8020/mycgv2/index.jsp";
</script>
<%
	} else {
		String nid = request.getParameter("nid");
		CgvNoticeDAO dao = new CgvNoticeDAO();
		CgvNoticeVO vo = dao.select(nid);
		
			String id = String.valueOf(session.getAttribute("id"));
			
			//저장된 쿠키 불러오기
			Cookie[] cookieList = request.getCookies();
			
			//쿠키를 담을 변수
			String cookies = null;
			
			/*for(Cookie c : cookieList){
				//현재 쿠키 리스트 값 확인
				//System.out.println(c.getValue());
				//System.out.println(session.getAttribute("id"));
			}*/
			
		 	//쿠키 세션 설정
			if(session.getAttribute(id + ":cookie") == null){
				session.setAttribute(id + ":cookie", id);
			}else{
				session.setAttribute(id + ":cookie ex", id);
				if(session.getAttribute(id + ":cookie").equals(id)){
					session.setAttribute(id + ":cookie", id);
				}
			}
			
			if(!session.getAttribute(id + ":cookie").equals(session.getAttribute(id + ":cookie ex"))){
				if(vo!= null){
					int result = dao.updateNhits(nid);
					if(result == 1){
						//조회수 업데이트 성공 시 가시적으로 조회수 업데이트
						vo.setNhits(vo.getNhits() + 1);
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
			width : 500px;
			height : 500px;
			border-radius : 50% 50% 0 50%;
			z-index : -1;
		}
		form[name = "boardDeleteForm"] {
			text-align : right;
			display : flex;
			flex-wrap : wrap;
			justify-content : center;
			align-content : center;
			align-items : center;
			width : inherit;
			/*height : inherit;*/
		}
		form[name = "boardDeleteForm"] ul {
			border : none;
		}
		#close img{
			width : 20px;
			height : auto;
		}
		#close {
			width : 40px;
			text-align : center;
			float : right;
		}
		.show {
			z-index : 2;
			opacity : 1;
			transition : all 0.3s;
		}
		.show .popup {
			z-index : 2;
			opacity : 1;
			transform : translate(-50%, -50%);
			transition : all 0.3s;
		}
	</style>
<script src = "http://localhost:8020/mycgv2/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		let height = $(".popup").innerHeight() - $("#close").outerHeight();
		$("form[name = 'boardDeleteForm']").css("height", height);
		$("#ndeleteBtn").click(function(){
			$(this).css("cursor", "pointer");
			$(".background").addClass("show");
			$(".window").addClass("show");
		});
		$("#close").click(() =>{
			$(".background").removeClass("show");
			$(".window").removeClass("show");
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
		<h1>공지사항-상세보기</h1>
		<table class="boardContent">	
			<tr>				
				<th>등록일자</th>
				<td><%= vo.getNdate() %></td>
				<th>조회수</th>
				<td><%= vo.getNhits() %></td>
			</tr>		
			<tr>				
				<th>제목</th>
				<td colspan="3"><%= vo.getNtitle() %></td>
			</tr>
			<tr>				
				<th>내용</th>
				<td colspan="3"><%= vo.getNcontent() %><br><br><br><br></td>
			</tr>
			<tr>
				<td colspan="4">
					<a href="admin_notice_update.jsp?nid=<%=vo.getNid()%>"><button type="button" class="btn_style">수정하기</button></a>
					<button type="button" class="btn_style" id="ndeleteBtn">삭제하기</button>
					<a href="admin_notice_list.jsp">
						<button type="button" class="btn_style">리스트</button></a>
					<a href="http://localhost:8020/mycgv2/admin/admin.jsp"><button type="button" class="btn_style">관리자홈</button></a>
				</td>
			</tr>			
		</table>	
	</div>
	
	<div class = "background">
		<div class = "window">
			<div class = "popup">
					<button type="button" class="btn_style" id = "close"><img src = "http://localhost:8020/mycgv2/images/cross.png"></button>
					<form name="boardDeleteForm" action="adminNoticeDeleteController.jsp" method="post">
						<input type = "hidden" name = "nid" value = <%= nid %>>
						<ul>
							<li>
								<img src="http://localhost:8020/mycgv2/images/delete.jpg"> <!-- 휴지통 이미지 -->					
							</li>				
							<li>
								<div>정말로 삭제하시겠습니까?</div>
							</li>
							<li>
								<button type="submit" class="btn_style">삭제완료</button>					
								<a href="admin_notice_list.jsp"><button type="button" class="btn_style">리스트</button></a>
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

<% } %>





