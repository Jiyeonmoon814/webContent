<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>request Obj(Ex14_include_Main.jsp) >> share include page </h3>
	<hr>
	<%= request.getParameter("type")%><br>
	<%= request.getParameter("userid") %><br>
	<hr>
	<h3>A value which has been sent from main to param action tag</h3>
	<%
		String hobby = request.getParameter("hobby");
		String pwd = request.getParameter("pwd");
		out.print("pwd:"+pwd+"<br>");
		if(hobby.equals("baseball")){
			out.print("<i>Your hobby is "+hobby+"</i>");
		} else{
		out.print("Have another hobby");
		}
	%>
</body>
</html>