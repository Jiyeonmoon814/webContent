,,<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("UTF-8");
		//클라이언트가 전송한 데이터 받기
		//Tomcat : 웹 전용 객체를 제공 (request , response)  : WAS >> 내장객체(new 없이 사용가능)
        //request 요청객체 (클라이언트 정보 얻는다 : 전송한 내용이 request 담긴다 )
        //클라이언트  IP ,  브라우져 종료 , 입력한 데이터 
        
        //http://localhost:8090/WebJSP/Ex02_register.jsp?userid=a&pwd=1004&hobby=baseball&hobby=soccer
        //response 응답객체 (서버 클라이언트에게 전달 ....)
		String uid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		//다중값 ....
		String[] hobbies = request.getParameterValues("hobby");
		/*  
		한글처리 ...(GET) (Tomcat9 버전 (한글 출력))
		**Tomcat9 버전 이전
		1. 페이지 상단에 인코딩 : request.setCharacterEncoding("UTF-8");
		2. server.xml 63 라인 >> URIEncoding="UTF-8" 추가
		 <Connector URIEncoding="UTF-8" connectionTimeout="20000" port="8090" protocol="HTTP/1.1" redirectPort="8443"/>
	
		한글처리 ...(POST)
		1.Tomcat 버전에 상관없이 ..
		2.받는 페이지 상단에 무조건 : request.setCharacterEncoding("UTF-8");
	
		JSP 페이지 상단에 무조건 ** (한글이 깨짐은 없다 ....)
		request.setCharacterEncoding("UTF-8");
		*/
%>    
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	  클라이언트에게 전달<br>
	  ID : <%=uid %><br>
	  PWD: <%=pwd %><br>
	  당신의 취미는 : <br>
	   <%
	  		for(String str : hobbies){
	  	%>
	  	     hobby : <%= str %><br>
	  	<%
	  		}
	    %>
</body>
</html>