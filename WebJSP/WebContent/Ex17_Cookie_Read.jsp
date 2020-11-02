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
	클라이언트 브라우져가 가지고 있는 cookie 정보를 가지고 와서
	...read
 -->
 
 <%
 	Cookie[] cs = request.getCookies();
 	if(cs!=null || cs.length>0){
 		for(Cookie c : cs){
 			out.print(c.getName()+"<br>");
 			out.print(c.getValue()+"<br>");
 			out.print(c.getMaxAge()+"<br>"); //-1 >> 메모리 쿠키 >> 소멸 타임이 없음 >> 브라우저를 종료하면 같이 사라짐 
 			//out.print(c.getDomain()+"<br>");
 			out.print("<hr>");
 		}
 	}
 %>

</body>
</html>