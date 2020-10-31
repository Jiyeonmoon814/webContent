<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%> 
   
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		table{border: 1px solid black; border-collapse: collapse;}
		
		tr{border: 1px solid blue; background-color: white; color: black}
		
		td{border: 1px solid red; }
		
	</style>
</head>
<body>
<!--  
	JDBC
	1. 드라이버 참조 (WEB > Webcontent > WEB-INF > lib > 붙여넣기 (ojdbc6.jar)
	2. 드라이버 메모리 로딩 : class.forName("드라이버 클래스명")
	3. DB 연결(연결문자열 : 서버 IP, PORT , 계정 , 비번 )
	
	JAVA JDBC API(Interface , class 제공)
	Connection
	Statement
	PrepareStatement
	ResultSet
	
-->


<table>
	<tr>
		<th>사번</th>
		<th>이름</th>
		<th>급여</th>
		<th>직종</th>
	</tr>
	<c:forEach var="list" items="${requestScope.emplist}">
		<tr>
		<td>${list.ename}</td>
		<td>${list.empno}</td>
		<td>${list.sal}</td>
		<td>${list.job}</td>
		</tr>
	</c:forEach>
	
	<tr>
		
	</tr>

</table>
</body>
</html>









