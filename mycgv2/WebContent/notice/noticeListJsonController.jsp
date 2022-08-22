<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.dao.CgvNoticeDAO, com.mycgv2.vo.CgvNoticeVO"%>
<%@ page import = "com.google.gson.*, java.util.ArrayList"%>
<%
	String rpage = request.getParameter("rpage");
	CgvNoticeDAO dao = new CgvNoticeDAO();
	
	//페이징 처리
	int startCount = 0;
	int endCount = 0;
	int pageSize = 5;
	int reqPage = 1;
	int pageCount = 1;
	int dbCount = dao.totalCount();
	
	//전체 페이지
	if(dbCount % pageSize == 0){
		pageCount = dbCount/pageSize;
	}else{
		pageCount = dbCount/pageSize + 1;
	}
	
	//현재 페이지
	if(rpage != null){
		reqPage = Integer.parseInt(rpage);
		startCount = (reqPage - 1) * pageSize + 1;
		endCount = reqPage * pageSize;
	}else{
		startCount = 1;
		endCount = pageSize;
	}
	
	ArrayList<CgvNoticeVO> list = (ArrayList<CgvNoticeVO>)dao.select(startCount, endCount);
	
	//JSON으로 변환
	JsonObject jobject = new JsonObject();
	JsonArray jarray = new JsonArray();
	Gson gson = new Gson();
	
	jobject.addProperty("pageSize", pageSize);
	jobject.addProperty("rpage", reqPage);
	jobject.addProperty("dbCount", dbCount);
	
	for(CgvNoticeVO vo : list){
		JsonObject jo = new JsonObject();
		jo.addProperty("rno", vo.getRno());
		jo.addProperty("nid", vo.getNid());
		jo.addProperty("ntitle", vo.getNtitle());
		jo.addProperty("nhits", vo.getNhits());
		jo.addProperty("ndate", vo.getNdate());
		
		jarray.add(jo);
	}
	
	jobject.add("list", jarray);
	
	
	//JSON으로 변환하여 내보내기
	out.write(gson.toJson(jobject));
%>