<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");
String mId = null;
String mPw = null;
if(request.getParameter("mId")!=null & request.getParameter("mId")!="" & request.getParameter("mPw")!=null & request.getParameter("mPw")!=""){
	System.out.println("입력값 들어옴");

	Member m =null; //로그인폼에서 가져와 db와 비교할 데이터
	Member member =null; //db에서 읽어온 데이터 
	mId=request.getParameter("mId");
	mPw=request.getParameter("mPw");
	m = new Member();
	m.setmId(mId);
	m.setmPw(mPw);
	
	MemberDao dao = new MemberDao();
	member = dao.login(m);
	System.out.println("db데이타 읽어오기까지 완료");
	if(member == null){
		System.out.println("아이디불일치");
%>
<%@ include file="/module/top.jsp" %>
		<%@ include file="/module/left.jsp" %>
		<div class="col-sm-10text-left"> 
			<div class ="text-left">
				<h2>Login</h2>
				<a href = "<%=request.getContextPath()%>/login/loginForm.jsp">로그인페이지로 이동</a>
		<h1>아이디가 일치하지 않습니다..</h1>
<%
	}else if(member.getmId().equals(m.getmId())){
		System.out.println("아이디일치");
		if(member.getmPw().equals(m.getmPw())){
			System.out.println("비밀번호 일치 로그인 성공");
			session.setAttribute("SID", member.getmId());
			session.setAttribute("SNAME", member.getmName());
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}else{
			System.out.println("비밀번호 불일치");
%>
<%@ include file="/module/top.jsp" %>
		<%@ include file="/module/left.jsp" %>
		<div class="col-sm-10text-left"> 
			<div class ="text-left">
				<h2>Login</h2>
				<a href = "<%=request.getContextPath()%>/login/loginForm.jsp">로그인페이지로 이동</a>
		<h1>비밀번호가 일치하지 않습니다..</h1>
<%
		}
	}
}else{
	response.sendRedirect(request.getContextPath()+"/login/loginForm.jsp");
}
%>
</body>
</html>