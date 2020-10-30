<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.bit.Emp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<h3>JSTL for</h3>
			<!--
				java 코드
				int sum = 0;
				for(int i = 0 ; i <= 10 ; i++){
					sum+=i;
				}
				
				for(String s : list){  }
			  -->
			  <c:forEach var="i"  begin="1"   end="10">
			  		<c:set  var="sum" value="${sum+i}" />
					${i}&nbsp;
			  </c:forEach>
			  sum 누적값 : ${sum}<br>
			  
			  <h3>구구단 5단 출력하기</h3>
			  
			  <ul>
			  		 <c:forEach  var="i"  begin="1"  end="9">
			  		 	<li>5*${i}=${5*i}</li>
			  		 </c:forEach>
			  </ul>
			  
			  <h3>EL&JSTL 사용해서 2~9단까지 출력(forEach 중첩 사용)</h3>
			  <table border="1">
			  	<c:forEach var="i" begin="2" end="9">
			  		<c:forEach var="j" begin="0" end="9">
			  			<c:choose>
			  				<c:when test="${j==0 }">
			  					<tr bgcolor="yellow"><th>${i}단</th></tr>
			  				</c:when>
			  				<c:otherwise>
			  					<tr><td>${i}*${j}=${i*j}</td></tr>
			  				</c:otherwise>
			  			</c:choose>
			  		</c:forEach>
			  	</c:forEach>
			  </table>
			  
			  <h3>JSTL forEach</h3>
			  <%
			  	int[] arr=new int[]{10,20,30,40,50};
			  	for(int i : arr){
			  		out.print("출력값:<b>"+i+"</b><br>");
			  	}
			  	//EL만 가지고 : request, session 객체 저장
			  %>
			  
			  <h3>EL java 객체에 대하여 직접 접근 불가능[jstl통해 변수에 담아서 사용 가능]</h3>
			  arr 객체 배열에 접근이 불가 : ${arr}<br>
			  <c:set var="intarr" value="<%=arr %>"></c:set>
			  c:set 변수에 접근 : ${intarr}<br>
			  <hr>
			  <h3>java 개선된 for문 처리</h3>
			  <c:forEach var="i" items="${intarr}">
			  	array value : ${i}<br>
			  </c:forEach>
			  <hr>
			  <h3>c:set && forEach >> make it simple</h3>
			  <c:forEach var="i" items="<%=arr %>">
			  	array value2 : ${i}<br>
			  </c:forEach>
			  
			  <h3>example</h3>
			  <c:forEach var="i" items="<%=new int[] {1,2,3,4,5}%>">
			  	array value3 : ${i}<br>
			  </c:forEach>
			  
			  <h3>forEach parameter 활용</h3>
			  <c:forEach var="i" items="${intarr}" varStatus="status">
			  	index:${status.index}&nbsp;&nbsp;&nbsp;
			  	count : ${status.count}&nbsp;&nbsp;&nbsp;
			  	value : ${i}<br>
			  </c:forEach>
			  
			  <hr>
			  <h3>TOAY POINT</h3>
			  <%
			  	//사원 정보를 담는 테이블
			  	List<Emp> emplist = new ArrayList<>();
			  emplist.add(new Emp(1000,"A"));
			  emplist.add(new Emp(2000,"B"));
			  emplist.add(new Emp(3000,"C"));
			  
			  //{return emplist}
			  for(Emp e : emplist){
				  out.print(e.getEmpno()+"/"+e.getEname()+"<br>");
			  }
			  
			//jsp 화면 그 결과,목록을 출력 
			//사실은
			request.setAttribute("list", emplist);
			//forward >> jsp
			//EL > requestScope.list
			  %>
			  <h3>EL&JSTL 통해서 결과를 화면에 출력</h3>
			  <c:set var="list" value="<%=emplist %>"></c:set>
			  <table border="1">
			  	<tr>
			  		<td>사번</td><td>이름</td>	
			  	</tr>
			  	<c:forEach var="emp" items="${list}">
			  	<tr>
			  		<td>${emp.empno}</td><td>${emp.ename}</td>
			  	</tr>
			  	</c:forEach>
			  </table>
			  
			  <h3>JAVA MAP 객체 EL&JSTL 사용 출력 (KEY,VALUE)</h3>
			  <%
			  	Map<String,Object> hm = new HashMap<>();
			  	hm.put("name", "hong");
			  	hm.put("pwd", "1004");
			  	hm.put("date", new Date());
			  %>
			  <c:set var="hm" value="<%=hm %>"></c:set>
			  <c:forEach var="obj" items="${hm}">
			  	${obj.key} -> ${obj.value}<br>
			  </c:forEach>
			  
			  key:name : ${hm.name}<br>
			  key:pwd : ${hm.pwd}<br>
			  key:date : ${hm.date}<br>
			  
			  <h3>OPTION</h3>
			  <h3>JSTL 구분자 처리하기</h3>
			  <c:forTokens var="token" items="A.B.C.D" delims=".">
			  	${token}<br>
			  </c:forTokens>
			  <h3>JSTL 복합구분자 처리하기</h3>
			  <c:forTokens  var="token" items="A.B/C-D" delims="./-">
			  	${token}<br>
			  </c:forTokens>
			  <!-- forEach
			  	step=-1 마이너스 값 불가 >> 편법적인 방법
			   -->
			   <c:set var="nownum" value="10"></c:set>
			   <c:forEach var="i" begin="0" end="${nownum}" step="2">
			   	${nownum-i}<br>
			   </c:forEach>
			   <select>
			   	<c:forEach var="i" begin="0" end="${2016-1900}">
			   		<c:set var="yearoption" value="${2016-i}"></c:set>
			   		<option value="{yearoption}">${yearoption}</option>
			   	</c:forEach>
			   </select>
		
</body>
</html>