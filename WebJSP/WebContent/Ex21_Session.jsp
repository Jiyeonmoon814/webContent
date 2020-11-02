<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	session 객체 : 접속한 사용자(browser, client)마다 서버에서 부여하는 고유한 객체 
	session 값 : 웹 서버가 접속한 클라이언트에게 부여하는 고유한 식별,id값 
	A라는 사용자가 웹 서버에 접속한 경우 >> session 객체 하나가 생성됨 >> 고유한 id값을 부여 >> 그 id값을 client에게 response
	
	JSESSIONID : 3F279C5D2DA0BFFA8C366F905F65A718 >> 유일값 >> 접속한 사용자에게 주는 유일한 객체 
	
	session 객체 >> 로그인 id 정보, 장바구니, 접속 시간 등 개인별 정보를 담음 
 -->
 
 <%
 Date time = new Date();
 SimpleDateFormat formatter =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 %>
 <h3>세션정보</h3>
   session 객체의 식별값 : <%= session.getId() %><br>
   <hr>
   <%
   	time.setTime(session.getCreationTime());
   %>
   [session 생성된 시간] : <%= formatter.format(time) %>
   <hr>
  <%
   	time.setTime(session.getLastAccessedTime());
   %>
   [session 마지막 접속 시간(client)] : <%= formatter.format(time) %>
   
</body>
</html>