<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.dao.CgvNoticeDAO, com.mycgv2.vo.CgvNoticeVO, java.util.ArrayList" %>
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
		String rpage = request.getParameter("rpage");
		CgvNoticeDAO dao = new CgvNoticeDAO();
		
		//페이징 처리
		int startCount = 0;
		int endCount = 0;
		int pageSize = 5;	//한 페이지 당 출력할 게시글 수
		int reqPage = 1;	//현재 페이지
		int pageCount = 1;	//전체 페이지 수
		int dbCount = dao.totalCount();
		
		//전체 페이지 계산
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize + 1;
		}
		
		//현재 페이지 게시글 수
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage - 1) * pageSize + 1;
			endCount = reqPage * pageSize;
		}else{
			startCount = 1;
			endCount = pageSize;
		}
		
		ArrayList<CgvNoticeVO> list = (ArrayList<CgvNoticeVO>)dao.select(startCount, endCount);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV</title>
<link rel="stylesheet"  href="http://localhost:8020/mycgv2/css/mycgv.css">
<link rel="stylesheet" href = "http://localhost:8020/mycgv2/css/am-pagination.css">
<script src = "http://localhost:8020/mycgv2/js/jquery-3.6.0.min.js"></script>
<script src = "http://localhost:8020/mycgv2/js/am-pagination.js"></script>
<script>
	$(document).ready(function(){
		var pager = jQuery('#ampaginationsm').pagination({
			
		    maxSize: 7,	    		// max page size
		    totals: <%=dbCount%>,	// total pages	
		    page: <%=rpage%>,		// initial page		
		    pageSize: <%= pageSize %>,			// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   //jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/mycgv/admin/amdin_notice/admin_notice_list.jsp?rpage="+e.page)
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
		<h1>공지사항-리스트</h1>
		<table class="board">
			<tr>
				<td colspan="4">
					<a href="admin_notice_write.jsp">
					<button type="button" class="btn_style">글쓰기</button>
					</a>
				</td>
			</tr>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>등록날짜</th>
				<th>조회수</th>
			</tr>
			<%
				if(dbCount == 0){
			%>
			<tr>
				<td colspan = "4">등록된 공지사항이 없습니다.</td>
			</tr>
			<%		
				}else{
					for(CgvNoticeVO vo : list){
						
			%>
			<tr>
				<td><%= vo.getRno() %></td>
				<td><a href="admin_notice_content.jsp?nid=<%= vo.getNid() %>"><%= vo.getNtitle() %></a></td>
				<td><%= vo.getNdate() %></td>
				<td><%= vo.getNhits() %></td>
			</tr>
			<%
					}
				}
			%>
			<tr>
				<td colspan="4"><div id = "ampaginationsm"></div></td>
			</tr>
		</table>	
	</div>
	
	<!-- footer Include -->
	<iframe src="http://localhost:8020/mycgv2/footer.jsp" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>

<% } %>





