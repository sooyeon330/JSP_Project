<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("utf-8");
	String contentPage = request.getParameter("CONTENTPAGE");
	String index =request.getParameter("index");
 %>
<jsp:forward page="templateTest.jsp">
	<jsp:param name="HEADERPAGE" value="RecommendHeader.jsp?index=<%=index %>" />		
	<jsp:param name="LEFTPAGE" value="left.jsp" />
	<jsp:param name="CONTENTPAGE" value="<%=contentPage %>" />
</jsp:forward>

    