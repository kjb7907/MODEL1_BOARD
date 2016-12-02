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
			if($("#mId").val()==""){
				$("#idHelper").text('아이디를 입력하세요');
				
			}else if($("#mPw").val()==""){
				$("#pwHelper").text('비밀번호를 입력하세요');
				
			}else if($("#pwCheck").val()!=$("#mPw").val()){
				$("#pwcHelper").text('비밀번호가 일치하지 않습니다.')
				
			}else if($("#mName").val()==""){
				$("#nameHelper").text('이름을 입력하세요');
				
			}else if($("#mEmail").val()==""){
				$("#mailHelper").text('이메일을 입력하세요');
				
			}else{
			$("#memberjoin").submit();
			}
		})
		
	})
</script>
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<div class="col-sm-10text-left"> 
	<div class ="text-left">
		<h2>MEMBER JOIN</h2>
		<form action="<%=request.getContextPath()%>/memberjoin/joinAction.jsp" method="post" id="memberjoin">
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
					<td>비밀번호확인 <input type="password" class="form-control" id="pwCheck"></td>
					<td><span id = "pwcHelper" style = " font-size:1em;  color: red;"></span></td>
				</tr>
				<tr>
					<td>이름 <input type="text" class="form-control" id="mName" name="mName"></td>
					<td><span id = "nameHelper" style = " font-size:1em;  color: red;"></span></td>
				</tr>
				
				<tr>
					<td>이메일 <input style = "width:500px;" type="text" class="form-control" id="mEmail" name="mEmail">
					<span id = "mailHelper" style = " font-size:1em;  color: red;"></span>
					</br>&nbsp;</td>
					
				</tr>
				
				<tr>
					<td><a href="#" class="btn btn-primary btn-lg" id="btn1">회원가입</a></td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>