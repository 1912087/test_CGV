<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.dao.CgvNoticeDAO, com.mycgv2.vo.CgvNoticeVO, com.google.gson.*" %>
<%
	String bid = request.getParameter("bid");
	CgvNoticeDAO dao = new CgvNoticeDAO();
	CgvNoticeVO vo = dao.select(bid);
	
	//저장된 쿠키 불러오기
	Cookie[] cookieList = request.getCookies();
	
	//쿠키를 담을 변수
	String cookieMember = null;
	
	//쿠키 세션 설정
	if(session.getAttribute(bid + ":cookie") == null){
		session.setAttribute(bid + ":cookie", bid + ":" + cookieMember);
	}else{
		session.setAttribute(bid + ":cookie ex", bid + ":" + cookieMember);
		if(session.getAttribute(bid + ":cookie").equals(bid + ":" + cookieMember)){
			session.setAttribute(bid + ":cookie", bid + ":" + cookieMember);
		}
	}
	
	if(!session.getAttribute(bid + ":cookie").equals(session.getAttribute(bid + ":cookie ex"))){
		if(vo != null){
			int result = dao.updateNhits(bid);
			if(result == 1){
				vo.setNhits(vo.getNhits() + 1);
			}
		}
	}
	
	//JSON으로 변환
	JsonObject jobject = new JsonObject();
	Gson gson = new Gson();
	
	jobject.addProperty("nid", vo.getNid());
	jobject.addProperty("ntitle", vo.getNtitle());
	jobject.addProperty("ncontent", vo.getNcontent());
	jobject.addProperty("nhits", vo.getNhits());
	jobject.addProperty("ndate", vo.getNdate());
	
	out.write(gson.toJson(jobject));
%>