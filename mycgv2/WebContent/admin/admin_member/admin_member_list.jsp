<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.dao.CgvMemberDAO, com.mycgv2.vo.CgvMemberVO, java.util.ArrayList" %>
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
		CgvMemberDAO dao = new CgvMemberDAO();
		
		//페이징 처리
		int startCount = 0;
		int endCount = 0;
		int pageSize = 5;	//한 페이지 당 출력되는 게시글 수
		int reqPage = 1;	//현재(요청) 페이지
		int pageCount = 1;	//전체 페이지
		int dbCount = dao.totalCount();
		
		//전체 페이지
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize + 1;
		}
		
		//현제 페이지 당 게시글 번호
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage - 1) * pageSize + 1;
			endCount = reqPage * pageSize;
		}else{
			startCount = 1;
			endCount = pageSize;
		}
		
		ArrayList<CgvMemberVO> list= (ArrayList<CgvMemberVO>)dao.select(startCount, endCount);
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
	           $(location).attr('href', "http://localhost:8020/mycgv2/admin/admin_member/admin_member_list.jsp?rpage="+e.page)
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
		<h1>회원관리-리스트</h1>
		<table class="board">			
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>성명</th>
				<th>연락처</th>
				<th>가입날짜</th>
			</tr>
			<%
				if(dbCount == 0){
			%>
			<tr>
				<td colspan = "4">등록된 회원이 없습니다.</td>
			</tr>
			<%
				}else{
					for(CgvMemberVO vo : list){
			%>
			<tr>
				<td><%= vo.getRno() %></td>
				<td><a href="admin_member_content.jsp?id=<%= vo.getId() %>"><%= vo.getId() %></a></td>
				<td><%= vo.getName() %></td>
				<td><%= vo.getPnumber() %></td>
				<td><%= vo.getMdate() %></td>
			</tr>
			<%
					}
				}
			%>
			<tr>
				<td colspan="5"><div id = "ampaginationsm"></div></td>
			</tr>
		</table>	
	</div>
	
	<!-- footer Include -->
	<iframe src="http://localhost:8020/mycgv2/footer.jsp" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>

<% } %>





