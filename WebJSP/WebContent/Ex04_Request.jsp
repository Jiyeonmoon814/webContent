<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 한글처리 (페이지 상단)
	request.setCharacterEncoding("UTF-8");

   //2. 데이터 받기
	String id = request.getParameter("id");
   /*  
   	WAS 내장하고 있는 객체 : request
   	[JSP 파일은 Default 내장 객체 사용 가능 ]
   			
   request 객체(요청)	
   1. 요청 페이지당 한개의  request  객체 생성 ?
   2. 클라이언트의 정보(입력값 , IP , header ...) request ...
   
   request  내장 객체는 클라이언트에서 서버로 요청될때 생성되는
   HttpServletRequest 타입을 갖는 객체가 자동으로 생성되고 그 주소를 request 참조
   HttpServletRequest  request = new HttpServletRequest(); [  자동으로  ]..
   
   */
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
ID : <%= id%><br>
접속한  클라이언트 IP : <%= request.getRemoteAddr() %><br>
서버(요청한 방식, 인코드) : <%= request.getCharacterEncoding() %><br>
전송방식:<%=request.getMethod() %><br>
포트:<%= request.getServerPort() %><br>
context(사이트 전체) root : (홈 디렉토리 , 가상 디렉토리 ,  웹 경로): <%= request.getContextPath() %>
<!--  
        전체 : http://192.168.0.169:8090/WebJSP/Ex04_Request.jsp
		request.getContextPath()
		가상경로(웹) : /WebJSP
		실경로 : D:\bit\WEBJSP\Labs\WebJSP

       /WebJSP 가상 디렉토리 서비스 경로 : D:\bit\WEBJSP\Labs\WebJSP\WebContent
       
       게시판 (파일 업로드) >> 가상(웹) 경로 >> 실경로 반환
       
-->
<br>
<%= request.getRequestURI() %>
<!--  /WebJSP/Ex04_Request.jsp  -->
</body>
</html>