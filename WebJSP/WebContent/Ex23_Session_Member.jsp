<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 전용 페이지</title>
<%
		String memberid = (String)session.getAttribute("memberid");
		boolean loginstate = (memberid==null) ? false : true;
	%>
</head>
<body>
	<%
		if(loginstate==true){
			out.print(memberid+"is logged in<br>");
			out.print("You have a right to check this page<br>");
			out.print("<a href='Ex23_Session_Logout.jsp'>Sign out</a>");
		}else{
			out.print("<script>alert('Denied')</script>");
			out.print("<script>location.href='Ex23_Session_Login.jsp'</script>");
		}
	%>
</body>
</html>


