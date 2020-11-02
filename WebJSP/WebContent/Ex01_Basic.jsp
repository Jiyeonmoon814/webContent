<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
    		/*  
    			JSP 페이지 : UI(html + css + javascript) + Java(로직 , DB:JDBC)
    			Java 코드 (<% 안쪽에 구현 )
    			
    			JSP 페이지 >> 디자인 코드 + 서버 로직 코드 >> 혼재된 방식( 유지보수 ㅜㅜ)
    		    장점 : 단순한 웹 페이지 작성 or 배우기 편하다			
    		
    		    JSP 구성요소
    		    1. 선언부 (jsp 페이지에 대한 기본 설정 세팅)
    		    <%@ page language="java" 
    		    page 지시자 : 사용언어 , 인코딩 , import ....
    		    
    		    2. 스크립트 요소
    		    2.1 스크립트 릿   <%   java 코드 구현 영역
    		    2.2 표현식(출력방법) : 출력하는 대상(client 웹 브라우져 전달)  : <%=
    		    2.3 선언부(공통적인 자원 (page scope))  : 공통함수 >> <%!  공통자바코드 구현 
    		
    			>>jsp 와 html  차이점
    		    1. 처리방법 : 
    		    	1.1 jsp (WAS -> 컴파일 -> jsp.java -> jsp.class -> 변환 (text , html , script) -> 응답)   
    		    	    정적자원 + 동적자원(java 코드) >> 정적자원 만들어서 서비스
    		    	    <% 안의 코드가 수정되면  다시 컴파일 > 처리(서비스) > WAS 처리 
    		    	1.2 html(Web Server : 요청 -> 응답) -> 해석의 주체 -> 웹 브라우져 
    		    
    		    >> [결론]
    		    최종 Web >> MVC  패턴을 통해 웹 개발
    		    >>일반  java 파일   => Model
    		    >> jsp  파일            => View 
    		    >> servlet 파일      => Controller
    		    >>분업화 (잘하는 것만 하자 .....)
    		    M  : Model (DTO:데이터를 담을 수 있는 클래스 ,DAO:DB작업을 하는 클래스 역할)
    		    V  : View  (화면을 구성하는 작업 : Server 쪽 코드를 받아서 )
    		    C	: Controller (조정자 : 요청의 흐름을 제어 : 클라이언트 요청 처리 )
    		    중간 프로젝트 : model2  기반의 MVC  웹 프로젝트
    		*/
    		
    		Date day = new Date();  //자바코드
    %>
    <%!
            //이 페이지 내에서 공통 함수 사용
    		public int add(int i , int j, int k){
    			return i + j + k;
	       }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Hello World<br>
	<%=day %><br>
	<%
			int result = add(100,200,300);
	%>
	<hr>
	함수 호출 결과 : <%= result %>
</body>
</html>