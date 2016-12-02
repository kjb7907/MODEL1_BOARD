<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import = "service.*" %>
<%@ page import = "java.util.List" %>
<%@ page import ="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>BOARD LIST</title>
</head>

<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<div class="col-sm-10text-left"> 
<%
BoardDao dao = new BoardDao();
int currentPage = 1; //현재페이지 할당
int pagePerRow = 10; //가져올 게시물 수 할당
if(request.getParameter("currentPage") != null) { //전페이지에서 넘어온 페이지수가있다면 현재페이지에 저장
    currentPage = Integer.parseInt(request.getParameter("currentPage"));
}
int beginRow = currentPage-1; //시작할 게시물 번호 할당
System.out.println(currentPage+"<--현재페이지");
int  totalRowCount = dao.selectTotalBoardCount(); //전체 게시물 수 저장
System.out.println(totalRowCount); //전체 게시물 수 출력
%>
	<div class ="text-left">
		<h2>Board1</h2>
<%@ include file = "/board/boardSearchForm.jsp" %>
		전체 게시글 수 :<%= totalRowCount %>
	</div>
	<table class = "table" style = width:70%;>
            <tr class="text-left">
            	<td style = "width:50px";><b>NO</b></td>
                <td><b>제목</b></td>
                <td style="width:100px"><b>작성자</b></td>
                <td style ="width:200px"><b>작성일</b></td>
            </tr>

<%
List<Board> boards = dao.selectBoardListPerPage(beginRow, pagePerRow); //배열 형태로 게시물 가져옴
System.out.println(boards.size()+"<---가져온 게시물 수");
for(int i=0;i<boards.size();i++){
	Board bo = boards.get(i); //가져온 게시물 출력하기 위해 board 객체에 저장
%>
		<tr class ="text-left">
			<td><%= bo.getBoardNo() %></td>
			<td><a style=" text-decoration:none; color:#000000 "href ="<%= request.getContextPath()%>/board/boardView.jsp?boardNo=<%=bo.getBoardNo()%>"><%= bo.getBoardTitle() %></a></td>
			<td><%= bo.getBoardUser() %></td>
			<td><%= bo.getBoardDate() %></td>
		</tr>
<%
}
%>
	
</table>


<%
    int lastPage = totalRowCount/pagePerRow;
    if(totalRowCount%pagePerRow != 0) {
        lastPage++;
    }
%>
    <div>
<%
        if(currentPage>1) {
%>
            <a href="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=currentPage-1%>">
            	<button type="button" class="btn btn-default">이전</button>
            </a>
<%
        }
        if(currentPage < lastPage) {
%>
 
            <a href="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=currentPage+1%>">
            <button type="button" class="btn btn-default">다음
            </button></a>
<%
        }
%>
   		
        <a href="<%=request.getContextPath()%>/board/boardAddForm.jsp">
        	<button type="button" class="btn btn-default">글쓰기</button></br></br>
        </a>
    </div>
	
	</div>
</div>

</body>
</html>














