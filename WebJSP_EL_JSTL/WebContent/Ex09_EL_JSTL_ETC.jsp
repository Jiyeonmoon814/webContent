<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>	JSTL OUT 출력 객체</h3>
	<c:out value="<p>태그는 문단 태그</p>"></c:out><br>
	&lt;p&gt; 태그는 문단을 정의
	<hr>
	<!-- JSTL 예외 처리 
	c:catch 예외가 발생 >> 예외에 대한 객체 생성 
	var="msg" >> msg 변수에 예외에 대한 정보
	-->
	<h3>Exception</h3>
	<c:catch var="msg">
		name : <%= request.getParameter("name") %><br>
		<%
			if(request.getParameter("name").equals("hong")){
				out.print("your name is:" + request.getParameter("name"));
			}
		%>
	</c:catch>
	<c:if test="${msg!=null}">
		<h3>Exception</h3>
		Error msg : ${msg}<br>
		//500번이 아니라 오류 메세지를 서버에 띄워줌 
	</c:if>
</body>
</html>