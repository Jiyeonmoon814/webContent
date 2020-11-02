<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("UTF-8"); 
    String userid = request.getParameter("userid");
	String userName = request.getParameter("userName");
	String userPass = request.getParameter("userPass");
	String gender = request.getParameter("gender");
	String userEmail = request.getParameter("userEmail");
	String userSsn1 = request.getParameter("userSsn1");
	String userSsn2 = request.getParameter("userSsn2");
	String userZipCode = request.getParameter("userZipCode");
	String userAddr1 = request.getParameter("uuserAddr1 ");
	String userAddr2 = request.getParameter("userAddr2l");
	String userPhone = request.getParameter("userPhone");
	String[] hobbies = request.getParameterValues("hobby");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
PWD : <%=userPass %><br>
EMAIL: <%=userEmail %><br>
POSTCODE : <%=userZipCode %><br>
	<%
		for(String str : hobbies){
	%>
	     HOBBY : <%= str %><br>
	<%
		}
%>
B-DAY: <%=year %>년<%=month %>월<%=day %>일

	
</body>
</html>