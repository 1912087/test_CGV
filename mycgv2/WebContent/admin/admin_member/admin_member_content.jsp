<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.dao.CgvMemberDAO, com.mycgv2.vo.CgvMemberVO" %>
<%
	String sid = (String)session.getAttribute("sid");
	if(sid == null){
%>
<script>
	alert("권한이 없습니다.");
	location.href = "http://localhost:8020/mycgv2/index.jsp";
</script>
<%
	}else{
		String id = request.getParameter("id");
		CgvMemberDAO dao = new CgvMemberDAO();
		CgvMemberVO vo = dao.select(id);
		String address = "[" + vo.getZonecode() + "] " + vo.getAddr1() + " " + vo.getAddr2();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV</title>
<link rel="stylesheet"  href="http://localhost:8020/mycgv2/css/mycgv.css">
</head>
<body>
	<!-- Header Include -->
	<iframe src="http://localhost:8020/mycgv2/header.jsp" width="100%" height="160px" scrolling="no" frameborder=0 ></iframe>
	
	
	<!---------------------------------------------->
	<!--------------- Content ----------------------->
	<!---------------------------------------------->
	<div class="content">
		<h1>회원정보-상세보기</h1>
		<table class="boardContent">	
			<tr>				
				<th>아이디</th>
				<td><%= vo.getId() %></td>
				<th>성명</th>
				<td><%= vo.getName() %></td>
				<th>가입날짜</th>
				<td><%= vo.getMdate() %></td>
			</tr>		
			<tr>				
				<th>주소</th>
				<td colspan="5"><%= address %></td>
			</tr>
			<tr>				
				<th>연락처</th>
				<td colspan="5"><%= vo.getPnumber() %></td>
			</tr>
			<tr>				
				<th>취미</th>
				<td colspan="5" style="text-align:left;text-indent:10px;"><%= vo.getHobbylist() %></td>
			</tr>
			<tr>				
				<th>자기소개</th>
				<td colspan="5" style="text-align:left;text-indent:10px;"><%= vo.getIntro() %></td>
			</tr>
			<tr>
				<td colspan="6">					
					<a href="admin_member_list.jsp"><button type="button" class="btn_style">리스트</button></a>
					<a href="../admin.jsp"><button type="button" class="btn_style">관리자홈</button></a>
				</td>
			</tr>			
		</table>	
	</div>
	
	<!-- footer Include -->
	<iframe src="http://localhost:8020/mycgv2/footer.jsp" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>

<% } %>





