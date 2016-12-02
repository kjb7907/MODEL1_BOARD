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
int currentPage = 1; //���������� �Ҵ�
int pagePerRow = 10; //������ �Խù� �� �Ҵ�
if(request.getParameter("currentPage") != null) { //������������ �Ѿ�� �����������ִٸ� ������������ ����
    currentPage = Integer.parseInt(request.getParameter("currentPage"));
}
int beginRow = currentPage-1; //������ �Խù� ��ȣ �Ҵ�
System.out.println(currentPage+"<--����������");
int  totalRowCount = dao.selectTotalBoardCount(); //��ü �Խù� �� ����
System.out.println(totalRowCount); //��ü �Խù� �� ���
%>
	<div class ="text-left">
		<h2>Board1</h2>
<%@ include file = "/board/boardSearchForm.jsp" %>
		��ü �Խñ� �� :<%= totalRowCount %>
	</div>
	<table class = "table" style = width:70%;>
            <tr class="text-left">
            	<td style = "width:50px";><b>NO</b></td>
                <td><b>����</b></td>
                <td style="width:100px"><b>�ۼ���</b></td>
                <td style ="width:200px"><b>�ۼ���</b></td>
            </tr>

<%
List<Board> boards = dao.selectBoardListPerPage(beginRow, pagePerRow); //�迭 ���·� �Խù� ������
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
            	<button type="button" class="btn btn-default">����</button>
            </a>
<%
        }
        if(currentPage < lastPage) {
%>
 
            <a href="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=currentPage+1%>">
            <button type="button" class="btn btn-default">����
            </button></a>
<%
        }
%>
   		
        <a href="<%=request.getContextPath()%>/board/boardAddForm.jsp">
        	<button type="button" class="btn btn-default">�۾���</button></br></br>
        </a>
    </div>
	
	</div>
</div>

</body>
</html>














