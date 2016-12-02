<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import ="service.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<body>

<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>

<div class="col-sm-8text-left"> 
	<div class ="text-left">
		<h2>BOARD VIEW</h2>
<%
if(request.getParameter("boardNo") == null) {
    response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
} else {
    int boardNo = Integer.parseInt(request.getParameter("boardNo")); 
    BoardDao dao = new BoardDao();
    Board bo = dao.selectBoardByKey(boardNo); //board 객체 생성후 메서드통해 반환된 데이터 저장
    System.out.println(bo.getBoardNo()+"게시물 가져옴");
    
%>
	
		<table style = width:800px;>
			<thead>
				<th style = width:100px;>
					No :<%= bo.getBoardNo() %></br>&nbsp;
				</th>
				<th>
					 제목 : <%= bo.getBoardTitle() %></br>&nbsp;
				</th>
				<th style=width:300px;>
					<div class="text-right">
						작성자 : <%= bo.getBoardUser() %><br/>
						작성일 : <%= bo.getBoardDate() %>
					</div>
				</th>

			</thead>
			<tbody>
				<tr>
					</br><td colspan="6"><div class="well well-lg" style=width:800px;height:400px;><%=bo.getBoardContent() %></div></td>
				</tr>
				<tr>
					<td colspan="4">
						<div class="text-center">
							<a href="<%=request.getContextPath()%>/board/boardModifyForm.jsp?boardNo=<%= bo.getBoardNo()%>" class="btn btn-success">수정</a>
							<a href="<%=request.getContextPath()%>/board/boardRemoveForm.jsp?boardNo=<%= bo.getBoardNo()%>" class="btn btn-warning">삭제</a>
						</div>
					</td>
					
				</tr>
			</tbody>
		</table></br></br>

<%    
} 
%>
	</div>
</div>
</body>
</html>