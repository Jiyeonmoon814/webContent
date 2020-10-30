<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = request.getParameter("userid"); //단일값
    //request.getParameterValues(name) // 다중값>>checkbox 
    request.setAttribute("name","korea");
    session.setAttribute("user", "bit");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--

EL(출력 표현식) : JSP 페이지에서 사용되는 스크립트 언어(화면출력)
이유 : 스파게티 (% 부분과 html 혼재되는 코드) >> 유지보수 , 코드의 해석(가독성)
문제를 해결(개선) 위해서 [html 잘 어울려야 되고 서버쪽 코드 출력 ] Script
>> EL & JSTL 탄생 (단점 : JSP 페이지에서만 사용가능)
EL : JSP 페이지에서 화면 출력 목적으로 만든 script 언어 (% 없이 살자) 

​

[EL 가지고 있는 객체]
paramValues : 요청 파라미터의 <파라미터이름, 값배열> 매핑을 저장한 Map 객체
param : 요청 파라미터의 <파라미터이름, 값> 매핑을 저장한 Map 객체
requestScope : request 기본 객체에 저장된 속성의 <속성,값> 매핑을 저장한 Map 객체
sessionScope : session 기본 객체에 저장된 속성의 <속성,값> 매핑을 저장한 Map 객체
applicationScope : application 기본 객체에 저장된 속성의 <속성,값> 매핑을 저장한 Map 객체

-->

<h3>Control server code</h3>
SCRIPTLET:<b><%=id %></b><br>
SCRIPTLET:<%= request.getAttribute("name") %><br>
SCRIPTLET:<%= request.getAttribute("user") %><br>
PARAMETER:<%= request.getParameter("userid") %><br>
<hr>
<h3>EL PRINT</h3>
EL PARAMETER : ${param.userid}<br>
EL REQUEST VALUE : ${requestScope.name}<br>
EL REQUEST VALUE : (requestScope.속성명 에서 requestScope을 생략가능하지만 지양) : ${name}<br>
EL SESSION VALUE : ${sessionScope.user}<br>
EL SESSION VALUE : {sessionScope.속성명 에서도 생략가능 } : ${user}<br>
<hr>
<h3>BASIC GRAMMER FOR EL</h3>
SCRIPTLET:<%=1+5 %><br>
EL:${100+200}<br>
EL:${"1"+1 }<br><!-- 문자형 숫자>>자동형변환>>숫자>>연산 -->
EL:${1==1}<br>
EL:${false}<br>
EL:${!false}<br>
EL:${empty x }<br><!-- x라는 변수의 값이 비어있니 -->
</body>
</html>