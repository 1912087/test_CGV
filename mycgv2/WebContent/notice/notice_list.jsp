<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv2.dao.CgvNoticeDAO, com.mycgv2.vo.CgvNoticeVO" %>
<%
	String rpage = request.getParameter("rpage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV</title>
<link rel="stylesheet"  href="http://localhost:8020/mycgv2/css/mycgv.css">
<link rel="stylesheet"  href="http://localhost:8020/mycgv2/css/am-pagination.css">
<script src = "http://localhost:8020/mycgv2/js/jquery-3.6.0.min.js"></script>
<script src = "http://localhost:8020/mycgv2/js/am-pagination.js"></script>
<script>
	$(document).ready(function(){
		
		initAjax(1);
		function initAjax(rpage){
			$.ajax({
				url : "noticeListJsonController.jsp?rapge="+rpage,
				success : function(result){
					//alert(result);
					
					//JSON 객체로 변환
					//서버로 전송된 데이터들은 String 형태로 전송되기 때문에 JSON으로 변환해주어야 함
					let data = JSON.parse(result);
					
					output = "<table class='board'>";
					
					output += "<tr><th>번호</th><th>제목</th><th>등록날짜</th><th>조회수</th></tr>";
					
					if(data.list.length == 0){
						output += "<tr><td colspan = '4'>등록된 공지사항이 없습니다.</td></tr>";					
					}else{
						for(dataset of data.list){
							output += "<tr>";
							output += "<td>" + dataset.rno + "</td>";
							output += "<td><a href='#' class = 'bclass' id = '" + dataset.nid + "'>" + dataset.ntitle + "</a></td>";
							output += "<td>" + dataset.ndate + "</td>";
							output += "<td>" + dataset.nhits + "</td>";
							output += "</tr>";
						}
					}

					output += "<tr><td colspan='4'><div id='ampaginationsm'></div></td></tr>";
					output += "<table>";
						
					//출력
					$("table.board").remove();
					$("h1").after(output);
						
					noticePagination(data.pageSize, data.rpage, data.dbCount);

					jQuery('#ampaginationsm').on('am.pagination.change',function(e){
						jQuery('.showlabelsm').text('The selected page no: '+e.page);
						initAjax(e.page);
					});
					
					$(".bclass").click(function(){
						noticeContent($(this).attr("id"));
					});
				}//success
			});//ajax
		}//initAjax();
		
		
		function noticePagination(pageSize, rpage, dbCount){
			var pager = jQuery('#ampaginationsm').pagination({
				
			    maxSize: 7,	    		// max page size
			    totals: dbCount,	// total pages	
			    page: rpage,		// initial page		
			    pageSize: pageSize,			// max number items per page
			
			    // custom labels		
			    lastText: '&raquo;&raquo;', 		
			    firstText: '&laquo;&laquo;',		
			    prevText: '&laquo;',		
			    nextText: '&raquo;',
					     
			    btnSize:'sm'	// 'sm'  or 'lg'		
			});
		}//noticePagination()
		
		function noticeContent(bid){
			$.ajax({
				url : "noticeContentJsonController.jsp?bid="+bid,
				success : function(result){
					//alert(result);
					
					let data = JSON.parse(result);
					
					output = "<table class = 'boardContent'>";
					output += "<tr><th>등록일자</th><td>" + data.ndate + "</td>";
					output += "<th>조회수</th><td>" + data.nhits + "</td></tr>";
					output += "<tr><th>제목</th>";
					output += "<td colspan='3'>" + data.ntitle + "</td></tr>";
					output += "<tr><th>내용</th>";
					output += "<td colspan = '3'>" + data.ncontent + "</td><tr>";
					
					output += "<td colspan='4'>";
					output += "<a href='notice_list.jsp'><button type='button' class='btn_style'>리스트</button></a>"
							+ "<a href='http://localhost:8020/mycgv2/index.jsp'><button type='button' class='btn_style'>홈으로</button></a>"
							+ "</td>"
					output += "</table>";
					
					//출력
					$("table.board").remove();
					$('h1').after(output);
				}//success()
			});
		}//noticeContent()
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
		<h1>공지사항</h1>
		<!-- <table class="board">			
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>등록날짜</th>
				<th>조회수</th>
			</tr>
			<tr>
				<td>1</td>
				<td><a href="notice_content.jsp">7월 마지막 이벤트 입니다~ ^^</a></td>
				<td>2022-07-22</td>
				<td>1245</td>
			</tr>
			<tr>
				<td>2</td>
				<td>탑건 재밌어요~ ^^</td>
				<td>2022-07-22</td>
				<td>1245</td>
			</tr>
			<tr>
				<td>3</td>
				<td>탑건 재밌어요~ ^^</td>
				<td>2022-07-22</td>
				<td>1245</td>
			</tr>
			<tr>
				<td>4</td>
				<td>탑건 재밌어요~ ^^</td>
				<td>2022-07-22</td>
				<td>1245</td>
			</tr>
			<tr>
				<td>5</td>
				<td>탑건 재밌어요~ ^^</td>
				<td>2022-07-22</td>
				<td>1245</td>
			</tr>
			<tr>
				<td>6</td>
				<td>탑건 재밌어요~ ^^</td>
				<td>2022-07-22</td>
				<td>1245</td>
			</tr>
			<tr>
				<td>7</td>
				<td>탑건 재밌어요~ ^^</td>
				<td>2022-07-22</td>
				<td>1245</td>
			</tr>
			<tr>
				<td>8</td>
				<td>탑건 재밌어요~ ^^</td>
				<td>2022-07-22</td>
				<td>1245</td>
			</tr>
			<tr>
				<td>9</td>
				<td>탑건 재밌어요~ ^^</td>
				<td>2022-07-22</td>
				<td>1245</td>
			</tr>
			<tr>
				<td>10</td>
				<td>탑건 재밌어요~ ^^</td>
				<td>2022-07-22</td>
				<td>1245</td>
			</tr>
			<tr>
				<td colspan="4"> << 1 2 3 4 5 >> </td>
			</tr>
		</table> -->	
	</div>
	
	<!-- footer Include -->
	<iframe src="http://localhost:8020/mycgv2/footer.jsp" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>







