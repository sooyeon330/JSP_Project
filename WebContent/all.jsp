<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:forward page="templateTest.jsp">
	<jsp:param name="HEADERPAGE" value="header.jsp" />		
	<jsp:param name="LEFTPAGE" value="all_left.jsp" />
	<jsp:param name="CONTENTPAGE" value="allProc.jsp" />
</jsp:forward>