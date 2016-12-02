<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import = "service.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD MODIFY FORM</title>
</head>
<body>

<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<div class="col-sm-10text-left"> 
	<div class ="text-left">
		<h2>BOARD MODIFY</h2>
<%
if(request.getParameter("boardNo") == null) {
    response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
} else {
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    System.out.println("boardModify param boardNo:"+boardNo);
    BoardDao dao = new BoardDao();
    Board bo = dao.selectBoardByKey(boardNo);

%>    
    <form action="<%=request.getContextPath()%>/board/boardModifyAction.jsp?boardNo=<%= bo.getBoardNo() %>" method="post">
    	<table>
    		<tr>
    		    <td><div>boardNo</div>
	        	<input  style = width:70px;  class="form-control" name="boardNo" value="<%=bo.getBoardNo()%>" type="text" readonly="readonly"/></td>
    		</tr>
    		<tr>
	        <td colspan="2"><div>boardTitle : </div>
	        <input class="form-control" name="boardTitle" value="<%=bo.getBoardTitle()%>" id="boardTitle" type="text" style=width:600px;/></td>
    		</tr>
			<tr>
				<td style = width:300px;><div>boardUser : </div>
	       				 <div><input class="form-control" name="boardUser" value="<%= bo.getBoardUser() %>" id="boardUser" type="text"/></div></td>
				<td style = width:300px;> <div>비밀번호확인: </div>
	        <div><input class="form-control" name="boardPw" id="boardPw" type="password"/></div></td>
			</tr>
			<tr>
				<td colspan="2">
					<div>boardContent : </div>
	        			<div><textarea class="form-control" name="boardContent" id="boardContent" rows="10" cols="100" style = width:600px;><%=bo.getBoardContent()%></textarea></div>
				</td>
			</tr>
	        <tr>
	        <td colspan="2">
	        	<input class="form-control" type="reset" value="초기화"/>
	        	<div><input class="form-control" type="submit" value="글수정"/></div>
	        </td>
	        </tr>

    	</table>
    </form>
<%
}    
%>
	</div>
</div>
</body>
</html>
