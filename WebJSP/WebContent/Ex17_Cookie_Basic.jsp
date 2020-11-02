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
		정보(데이터) >> 어디에 저장?
		클라이언트(개인 local pc) : web server or db server
		
		1.보안,정보의 중요성 측면 
		
		2.소멸의 측면 (일시or영속적)
		
		Client(Local PC : Web Browser)
		1.Cookie(memory or file cookie >> local txt 파일 저장>>암호화>>소멸시기 )
		2.Local Storage (map (key:value))
		
		Server(WebServer : Apache Tomcat)
		1.server memory : session 객체 (접속한 사용자, 식별값, 개인정보) >> 서버 리부팅, 꺼지거나 
		2.server memory : Application 객체 (접속한 사용자 공유자원) >> 서버 리보팅, 꺼지거나 
		3.server 영속적 : login.txt >> 관리가 힘듬 
		4.db server : 보안, 관리, 영속적
	 -->
	 
	 <%
		Cookie mycookie = new Cookie("cname","1004");
	 	//생성
	 	
	 	//Client 브라우져 전달 >> response
	 	response.addCookie(mycookie);
	 %>
	 <a href="Ex17_Cookie_Read.jsp">Cookie read</a>
</body>
</html>