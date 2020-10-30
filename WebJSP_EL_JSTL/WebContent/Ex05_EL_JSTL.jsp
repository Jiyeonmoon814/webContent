<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
/*
    **<c:set> : 변수 생성, 값을 저장, 자바 객체 변수 value=""
	<c:remove> : 변수 삭제
	**<c:if> : 조건문 (test="조건절(el)")
	**<c:choose> : 여러가지 조건에 따라 처리 가능(if보다 활용도가 높음)
	***<c:forEach> : 반복문
	<c:forTokens> : for문과 split의 결합
	<c:out> : JSTL 출력 (JSTL보다 EL >> ${} 빈도가 더 높음)
	<c:catch>
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL PARAMETER</h3>
	${param.id } - ${param.pwd }<br>
	<h3>SET EL PARAMETER VALUE AS A VARIABLE </h3>
	<c:set var="userid" value="${param.id }"></c:set>
	<c:set var="userpwd" value="${param.pwd }"></c:set>
	<hr>
	<h3>JSTL 변수값 출력</h3>
	id:${userid }<br>
	pwd:${userpwd}<br>
	<hr>
	<c:if test="${!empty userpwd}">
	<h3>not empty userpwd</h3>
		<c:if test="${userpwd=='1004'}">
		<h3>welcome admin page</h3>
		</c:if>
	</c:if>
</body>
</html>