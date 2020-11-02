<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    /*
    	요청에 대한 흐름제어
    	1.include >> 디자인용
    	2.forward >> 디자인을 갖고 있지 않음, 어차피 다 날라가니깐 
    	
    	공통점 : request 객체를 공유
    	차이점: include >> 제어권을 가지고 있음
    			forward >> 제어권을 넘겨준다 (point***요청 주소는 동일하지만 서비스 페이지를 다르게 할 수 있음 )
    			
    */
    
    	String code = request.getParameter("code");
    	String viewUri = null;
    	if(code.equals("A")){
    		viewUri="/forward/A.jsp";
    	}else if(code.equals("B")){
    		viewUri="/forward/B.jsp";
    	}else if(code.equals("C")){
    		viewUri="/forward/C.jsp";
    	}
    %>
    <jsp:forward page="<%=viewUri %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	asdfasdfasdfasdf
</body>
</html>