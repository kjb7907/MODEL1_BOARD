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
request.setCharacterEncoding("euc-kr");
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
System.out.println(sk+" "+sv);

BoardDao dao = new BoardDao();

%>
	<div class ="text-left">
		<h2>SearchList</h2>
<%@ include file = "/board/boardSearchForm.jsp" %>

	</div>
	<table class = "table" style = width:70%;>
            <tr class="text-left">
            	<td style = "width:50px";><b>NO</b></td>
                <td><b>����</b></td>
                <td style="width:100px"><b>�ۼ���</b></td>
                <td style ="width:200px"><b>�ۼ���</b></td>
            </tr>

<%
ArrayList<Board> boards = new ArrayList<Board>();; //�迭 ���·� �Խù� ������
boards = dao.search(sk, sv);
System.out.println(boards.size()+"<---������ �Խù� ��");
for(int i=0;i<boards.size();i++){
	Board bo = boards.get(i); //������ �Խù� ����ϱ� ���� board ��ü�� ����
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


   		
        <a href="<%=request.getContextPath()%>/board/boardAddForm.jsp">
        	<button type="button" class="btn btn-default">�۾���</button></br></br>
        </a>
    </div>
	
	</div>
</div>

</body>
</html>














