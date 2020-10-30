<%@page import="java.util.HashMap"%>
<%@page import="kr.or.bit.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>    
 <%
 		Emp e = new Emp();
 		e.setEmpno(2000);
 		e.setEname("bituser");
 		
 		HashMap<String,String> hp = new HashMap<>();
 		hp.put("data", "1004");
 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>기존방식</h3>
<%= e %><br>
<%= e.getEmpno() %><br>
<%= e.getEname() %><br>

<h3>EL 출력</h3>
자바 객체 출력하기(자바 객체에 대한 직접 접근 불가) : ${e}<br>
${e.getEmpno()}<br>

1. JSTL (core) : 변수 생성 , 제어문 <br>
<c:set  var="m"  value="<%=e %>" />
JSTL을 사용해서 변수 M 생성 >> 그 변수를 출력 : ${m}<br>
getter 호출 (el 잘 안씀) : ${m.getEmpno()}<br>
EL 출력 : (m.member field명 : getter 함수 자동 호출) : ${m.empno}<br>
EL 출력 : (m.member field명 : getter 함수 자동 호출) : ${m.ename}<br>

<hr>
<h3>ES&JSTL</h3>
***** EL을 통해서 JAVA 객체에 대한 직접 접근 불가 *****<br>
방법 : 1.request, session 객체에 담아서 접근<br>
방법 : 2.JSTL 변수를 사용 <br>
<c:set var="username" value="${m.ename}"/>
변수값 출력 : ${username }<br>
<hr>
<h3>JSTL 변수를 만들고 SCOPE 정의</h3>
<c:set var="job" value="a basketball player" scope="request"></c:set>
YOUR JOB IS : ${job}<br>
만약 include, forward한 페이지가 있다면 그 페이지에서 job 변수 사용가능<br>
<hr>
<c:set var="job2" value="a baseball player" scope="request"></c:set>
print value:${job2}<br>
Delete made variable<br>
<c:remove var="job2"/><br>
Delete job2:${job2}<br>

<hr>
hp객체(직접 접근불가):${hp}<br>
<c:set var="vhp" value="<%=hp %>"></c:set>
hp obj:${vhp}<br>
hp obj:${vhp.data}<br>
<!--  
 			hp.put("color", "red")
 -->
 <c:set  target="${vhp}"  property="color"  value="red" />
 hp객체 : ${vhp}<br>
</body>
</html>