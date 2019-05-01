<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		request.setCharacterEncoding("utf-8");
		String contentPage = request.getParameter("CONTENTPAGE");
		String leftPage = request.getParameter("LEFTPAGE");
	%>
	<table class="Ctemplate" cellpadding="2" cellspacing="0">		
		<tr>
		<td class="left" valign="top">
				<jsp:include page="<%=leftPage%>" flush="false" />
			</td> 
			<td class="cont" valign="top">
				<jsp:include page="<%=contentPage%>" flush="false" />
			</td> 
			<td class="right" valign="top">
				<jsp:include page="right.jsp" flush="false" />
			</td>
		</tr>
		
	</table>
</body>
</html>