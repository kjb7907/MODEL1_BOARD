<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="service.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");
int result = 0;
System.out.println(request.getParameter("mId")+"input");
String mId = request.getParameter("mId");
String mPw = request.getParameter("mPw");
String mName = request.getParameter("mName");
String mEmail = request.getParameter("mEmail");
System.out.printf("아이디 %s 비밀번호 %s 이름 %s 이메일 %s",mId,mPw,mName,mEmail);
System.out.println("");

Member m = new Member();
m.setmId(mId);
m.setmPw(mPw);
m.setmName(mName);
m.setmEmail(mEmail);

MemberDao dao = new MemberDao();
result = dao.insertMember(m);

if(result==1){
%>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<div class="col-sm-10text-left"> 
	<div class ="text-left">
		<h2>MEMBER JOIN</h2>
		<a href = "<%=request.getContextPath()%>/index.jsp">메인으로 이동</a>
		<h1>회원가입이 정상적으로 처리 되었습니다.</h1>

</div>
</div>
<%
}else{
%>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<div class="col-sm-10text-left"> 
	<div class ="text-left">
		<h2>MEMBER JOIN</h2>
		<a href = "<%=request.getContextPath()%>/index.jsp">메인으로 이동</a>
<h1>회원가입이 처리되지 않았습니다.</h1>

</div>
</div>
<%	
}
%>
</body>
</html>