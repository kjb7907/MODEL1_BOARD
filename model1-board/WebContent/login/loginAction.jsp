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
	System.out.println("�Է°� ����");

	Member m =null; //�α��������� ������ db�� ���� ������
	Member member =null; //db���� �о�� ������ 
	mId=request.getParameter("mId");
	mPw=request.getParameter("mPw");
	m = new Member();
	m.setmId(mId);
	m.setmPw(mPw);
	
	MemberDao dao = new MemberDao();
	member = dao.login(m);
	System.out.println("db����Ÿ �о������� �Ϸ�");
	if(member == null){
		System.out.println("���̵����ġ");
%>
<%@ include file="/module/top.jsp" %>
		<%@ include file="/module/left.jsp" %>
		<div class="col-sm-10text-left"> 
			<div class ="text-left">
				<h2>Login</h2>
				<a href = "<%=request.getContextPath()%>/login/loginForm.jsp">�α����������� �̵�</a>
		<h1>���̵� ��ġ���� �ʽ��ϴ�..</h1>
<%
	}else if(member.getmId().equals(m.getmId())){
		System.out.println("���̵���ġ");
		if(member.getmPw().equals(m.getmPw())){
			System.out.println("��й�ȣ ��ġ �α��� ����");
			session.setAttribute("SID", member.getmId());
			session.setAttribute("SNAME", member.getmName());
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}else{
			System.out.println("��й�ȣ ����ġ");
%>
<%@ include file="/module/top.jsp" %>
		<%@ include file="/module/left.jsp" %>
		<div class="col-sm-10text-left"> 
			<div class ="text-left">
				<h2>Login</h2>
				<a href = "<%=request.getContextPath()%>/login/loginForm.jsp">�α����������� �̵�</a>
		<h1>��й�ȣ�� ��ġ���� �ʽ��ϴ�..</h1>
<%
		}
	}
}else{
	response.sendRedirect(request.getContextPath()+"/login/loginForm.jsp");
}
%>
</body>
</html>