<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.dao.CgvMemberDAO"%>
<jsp:useBean id = "vo" class = "com.mycgv2.vo.CgvMemberVO"/>
<jsp:setProperty name = "vo" property = "*"/>
<%
	CgvMemberDAO dao = new CgvMemberDAO();
	int result = dao.insert(vo);
	if(result == 1){
		response.sendRedirect("../login/login.jsp?join=ok");
	}else{
		response.sendRedirect("../errorPage.jsp");
	}
%>