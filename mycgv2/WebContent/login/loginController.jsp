<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.dao.CgvMemberDAO , com.google.gson.*" %>
<jsp:useBean id = "vo" class = "com.mycgv2.vo.CgvMemberVO"/>
<jsp:setProperty name = "vo" property = "*"/>
<%
	CgvMemberDAO dao = new CgvMemberDAO();
	int result = dao.login(vo);
	if(result == 2){
		/* Cookie member = new Cookie("id" , vo.getId());
		session.setAttribute("id", member);
		member.setPath("/"); */
		
		//session 생성
		session.setAttribute("sid", vo.getId());
		response.sendRedirect("../index.jsp?login=ok");
		//System.out.println(session.getAttribute("id"));
	}else{
		response.sendRedirect("login.jsp?login=" + result);
	} 

%>