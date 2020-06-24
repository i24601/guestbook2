<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
int i = Integer.parseInt(request.getParameter("no"));
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="./gbc" method="get">
		비밀번호 : <input type = "text" name="password"><br>
		<input type = "hidden" name="no" value=<%=i%>><br>
		<input type = "hidden" name="action" value=delete><br>
		<button type="submit">확인</button>
	</form>
</body>
<a href="./gbc?action=addlist">메인으로 돌아가기</a>
</html>