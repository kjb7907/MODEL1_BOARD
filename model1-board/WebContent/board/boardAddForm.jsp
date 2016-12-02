<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD ADD</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn1").click(function(){
			if($("#boardTitle").val()==""){
				$("#titleHelper").text('제목을 입력하세요');
				
			}else if($("#boardUser").val()==""){
				$("#idHelper").text('작성자를 입력하세요');
				
			}else if($("#boardPw").val()==""){
				$("#pwHelper").text('비밀번호를 입력하세요');
				
			}else if($("#boardContent").val()==""){
				$("#mainHelper").text('본문을 입력하세요');
				
			}else{
			$("#writeform").submit();
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
		<h2>BOARD ADD</h2>
		<form action="<%=request.getContextPath()%>/board/boardAddAction.jsp" method="post" id="writeform">
			<table style = width:800px>
				<tr>
					<td colspan="2">
						<div>boardTitle :<input class="form-control"name="boardTitle" id="boardTitle" type="text"/></div>
						<span id = "titleHelper" style = " font-size:1em;  color: red;"></span>
					</td>
				</tr>
				<tr>
					<td>
						<div>boardName :<input style = "width:300px" class="form-control"name="boardUser" id="boardUser" type="text"/></div>
						 <span id = "idHelper" style = " font-size:1em;  color: red;"></span>
					</td>
					<td>
						<div>boardPw : <input style = "width:300px" class="form-control"name="boardPw" id="boardPw" type="password"/></div>
						<span id = pwHelper style = " font-size:1em;  color: red;"></span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div>boardContent :<span id = "mainHelper" style = " font-size:1em;  color: red;" ></span>
						 <textarea class="form-control" name="boardContent" id="boardContent" rows="10" cols="100"></textarea></div>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<div class="text-center"><input class="form-control" type="reset" value="초기화"/><br/><a href="#" id="btn1" class="btn btn-primary btn-lg">등록</a> </div>
						<br/>
					</td>
				</tr>

		    </table>
	</div>
</div>
</form>
</body>
</html>