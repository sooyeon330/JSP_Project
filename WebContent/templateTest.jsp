<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Template 페이지</title>
<link rel="stylesheet" href="CSS/main.css">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String contentPage = request.getParameter("CONTENTPAGE");
		String leftPage = request.getParameter("LEFTPAGE");
	%>

	<table class="template" cellpadding="2" cellspacing="0">
		
		<tr>
			<td class="top" colspan="3">
				<jsp:include page="top.jsp"	flush="false" />
			</td>
		</tr>
		<tr>
			<td class="header" colspan="3">
				<a href="main.jsp"><img width="80%" src="img/header.png"></a>
			</td>
		</tr>
		<tr>
		<%-- 	<td class="left" valign="top">
				<jsp:include page="<%=leftPage%>" flush="false" />
			</td> --%>
			<td class="cont" valign="top">
				<jsp:include page="<%=contentPage%>" flush="false" />
			</td><%-- 
			<td class="right" valign="top">
				<jsp:include page="right.jsp" flush="false" />
			</td> --%>
		</tr>
		<tr>
			<td class="bottom" colspan="3">
				<jsp:include page="bottom.jsp" flush="false" />
			</td>
		</tr>
	</table>

</body>
</html>