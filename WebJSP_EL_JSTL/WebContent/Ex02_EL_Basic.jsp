<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//EL SCRIPT LANG >> ACCESS TO RESOURCE OF SERVER  >> DON'T NEED <%=>
    	//USING EL DOESN'T MEAN SUPPORT JAVA OBJ API
    	Date today = new Date();
    	request.setAttribute("day", today);
    	session.setAttribute("day2", today);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>THE PURPOSE OF EL</h3>
	EL(SHOW THE TITLE OF OBJECT):${requestScope.day}<br>
	EL:${day}<br>
	SESSION EL : ${sessionScope.day2}<br>
</body>
</html>