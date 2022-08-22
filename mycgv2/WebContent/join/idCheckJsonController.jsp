<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.dao.CgvMemberDAO, com.mycgv2.vo.CgvMemberVO"%>
<%@ page import = "com.google.gson.*" %>
<%
	String id = request.getParameter("id");
	CgvMemberDAO dao = new CgvMemberDAO();
	int result = dao.idCheck(id);
	
	out.write(String.valueOf(result));
%>