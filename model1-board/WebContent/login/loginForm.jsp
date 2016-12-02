<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn1").click(function(){
				$("#memberlogin").submit();
			})
		})
		
</script>
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<div class="col-sm-10text-left"> 
	<div class ="text-left">
		<h2>Login</h2>
		<form action="<%=request.getContextPath()%>/login/loginAction.jsp" method="post" id="memberlogin">
			<table>
				<tr>
					<td>아이디 <input type="text" class="form-control" id="mId" name="mId"></td>
					<td><span id = "idHelper" style = " font-size:1em;  color: red;"></span></td>
				</tr>
				
				<tr>
					<td>비밀번호 <input type="password" class="form-control" id="mPw" name="mPw"></td>
					<td><span id = "pwHelper" style = " font-size:1em;  color: red;"></span></td>
				</tr>
				<tr>
					<td></br>
						<a href="#" class="btn btn-success" id ="btn1">로그인</a>
						<a href="<%=request.getContextPath()%>/memberjoin/joinForm.jsp" class="btn btn-info">회원가입</a>
					</td>
				</tr>
	</div>
</div>
</body>
</html>