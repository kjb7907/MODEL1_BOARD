<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn1").click(function(){
			$("#search").submit();
		})
		
	})
</script>
</head>
<body>
<form id = "search" method ="post" action = "<%=request.getContextPath()%>/board/boardSearchList.jsp">
<div  class="form-group has-success" >
  <label class="control-label">검색</label>
  <div class="input-group">
    	<select style = "width:100px" class="form-control" name="sk">
			<option value="board_title">제목</option>
			<option value="board_content">내용</option>
			<option value="board_user">작성자</option>
		</select>
    <input style = "width:300px"type="text" class="form-control" id="inputSuccess" name="sv">
      <button class="btn btn-success" type="button" id ="btn1">검색</button>
  </div>
</div>
</form>
</body>
</html>