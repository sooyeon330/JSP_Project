<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:forward page="templateTest.jsp">
	<jsp:param name="HEADERPAGE" value="header.jsp" />		
	<jsp:param name="LEFTPAGE" value="left.jsp" />
	<jsp:param name="CONTENTPAGE" value="coverProc.jsp" />
</jsp:forward>

