<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	/* session.removeAttribute("id");
	Cookie cookie = new Cookie("id", null);
	cookie.setMaxAge(0); */
	
	String sid = (String)session.getAttribute("sid");
	if(sid != null){
		session.invalidate();
	}
	//response.sendRedirect("../index.jsp");
%>
<script>
	alert("로그아웃 되었습니다.");
	location.href = "http://localhost:8020/mycgv2/index.jsp";
</script>
