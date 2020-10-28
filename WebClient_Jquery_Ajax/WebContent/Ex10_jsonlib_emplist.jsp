<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.bit.dto.Emp"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//http://192.168.0.32:8090/WebClient_Jquery_Ajax/Ex10_jsonlib_Ajax_emplist.html

//http://localhost:8090/WebClient_Jquery_Ajax/Ex10_jsonlib_Ajax_emplist.html
//error >> 'http://localhost:8090' has been blocked by CORS policy
//해결 >> 웹서비스를 제공하는 주체가 표현 
response.addHeader("Access-Control-Allow-Origin","*");
%>
<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bituser","tvxq1226");
	//out.print(conn.isClosed());
	
	stmt = conn.createStatement();
	String sql= "select empno ,ename , sal , job, comm from emp";
	
	rs = stmt.executeQuery(sql);
	
	/* 
		POINT ***
		여러건의 데이터를 객체에 담아 놓고 사용 (collection)
		선행조건 : dto class
		dto arraylist add 
	*/
	
	List<Emp> list = new ArrayList<>();
		
		while(rs.next()){//14건 데이터
		Emp emp = new Emp();
		emp.setEmpno(rs.getInt(1));
		emp.setEname(rs.getString(2));
		emp.setSal(rs.getInt(3));
		emp.setJob(rs.getString(4));
		emp.setComm(rs.getInt(5));
		
		list.add(emp);
		}
	//변환작업 1줄 코드
	JSONArray jsonlist = JSONArray.fromObject(list);
%>
<%= jsonlist %>