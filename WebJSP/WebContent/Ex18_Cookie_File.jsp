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
	1.메모리(브라우저) 쿠키 : Client 강제로 삭제하지 않는한 브라우져 닫기 전까지는 유효(소멸타입:-1)
	2.파일 쿠키(소멸 시간) : Client 강제로 삭제하지 않는 한 정해진 시간까지 생존(유효)(ex.2020년 12월 25일)
								 >>setMaxage(60) >> 60초
								 >>setMaxage(30*24*60*60) >>일*시*분*초 >> 30일동안 유효함을 의미 
 -->
 
 	<%
 		Cookie cookie = new Cookie("bit","hong");
 		cookie.setMaxAge(30*24*60*60); // 현재시간 기준 30일동안
 		response.addCookie(cookie); //Expires >> 10/15일 기준 2020-11-14T05:10:19.396Z 까지 유효함을 확인할 수 있음 >> 브라우저를 닫아도 남아 있음 
 	
 	%>
</body>
</html>