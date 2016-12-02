<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD MODIFY ACTION</title>
</head>
<body>
<%

request.setCharacterEncoding("euc-kr");
if(request.getParameter("boardNo") == null || request.getParameter("boardPw") == null) {
    response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
} else {
	System.out.println("--------board 수정 start -------");
	int result=0;//수정여부 판단 변수
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    System.out.println("boardNo :"+boardNo);
    String boardPw = request.getParameter("boardPw");
    System.out.println("boardPw :"+boardPw);
    String boardTitle = request.getParameter("boardTitle");
    System.out.println(boardTitle);
    String boardUser = request.getParameter("boardUser");
    System.out.println(boardUser);
    String boardContent = request.getParameter("boardContent");
    System.out.println(boardContent);
    
    
    Board bo = new Board();
    bo.setBoardNo(boardNo);
    bo.setBoardPw(boardPw);
    bo.setBoardUser(boardUser);
    bo.setBoardTitle(boardTitle);
    bo.setBoardContent(boardContent);
    
    BoardDao dao = new BoardDao();
    result = dao.updateBoard(bo);
    
    if(result==1){
    	response.sendRedirect(request.getContextPath()+"/board/boardView.jsp?boardNo="+boardNo);
    }else{
    	response.sendRedirect(request.getContextPath()+"/board/boardModifyForm.jsp?boardNo="+boardNo);
    }
}
%>
</body>
</html>