<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/error/commonerror.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  
  페이지마다 고유하고 : page errorPage ="" 설정 페이지 ...
-->

<%
		String data = request.getParameter("name").toLowerCase();
%>
<%= data %>
</body>
</html>