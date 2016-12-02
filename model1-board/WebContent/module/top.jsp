<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/cosmo.css" >
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body class = "container">
<%
String SID = (String)session.getAttribute("SID");
String SNAME = (String)session.getAttribute("SNAME");

if(SID==null){

%>
<a href="#" class="btn btn-default btn-lg btn-block"><h1>Mini Project</h1></a>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Mini Project</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
        <li><a href="<%=request.getContextPath()%>/board/boardList.jsp">Board</a></li>
        <li><a href="<%=request.getContextPath()%>/memberjoin/joinForm.jsp">MemberJoin</a></li>
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="<%=request.getContextPath()%>/login/loginForm.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
 <%
}else{
%>
<a href="#" class="btn btn-default btn-lg btn-block"><h1>Mini Project</h1></a>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Mini Project</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
        <li><a href="<%=request.getContextPath()%>/board/boardList.jsp">Board</a></li>
        
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href=#> <%=SNAME %>님 반갑습니다.</a></li>
        <li><a href="<%=request.getContextPath()%>/login/logout.jsp"> 로그아웃</a></li>
      </ul>
    </div>
  </div>
</nav>
<%
}
 %>

</body>
</html>