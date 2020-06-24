<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.javaex.dao.GuestBookDao"%>
<%@ page import="com.javaex.vo.GuestBookVo"%>

<%
List<GuestBookVo> gList = (List<GuestBookVo>)request.getAttribute("gList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전화번호</title>
</head>
<body>

	<form action="./gbc" method="get">
	<fieldset style = "width:500px">
		<input type="hidden" name="action" value="add">
		이름 : <input type="text" name="name"> 
		비밀번호 : <input type="text" name="password"><br><br>
		<textarea name="content" cols="70" rows="10"></textarea><br>
		<button type="submit" style='float: right;'>확인</button>
		</fieldset>
	</form>

	<%
		for (GuestBookVo vo : gList) {
	%>
	<table border='1'>
		<colgroup>
			<col style="width: 120px">
			<col style="width: 170px">
		</colgroup>
		<tbody>
			<tr>
				<td><%=vo.getNumber()%></td>
				<td><%=vo.getName()%></td>
				<td><%=vo.getReg_date()%></td>
				<td><a href = "./gbc?action=deleteForm&no=<%=vo.getNumber()%>">삭제</a>
			</td>

			<tr>
			<td colspan="4"><%=vo.getContent()%></td>
			</tr>
		</tbody>
	</table>
	<br>
	<%
		}
	%>

</body>
</html>