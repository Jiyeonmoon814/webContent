<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="kr.or.bit.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 Member member = new Member();
 //json 객체로 변환
 //String jsondata = "{"+"username:"+member.get... >> 사용 ㄴㄴ 
 
 JSONObject obj = JSONObject.fromObject(member);
 //{"address":"서울시 강남구","admin":"1","password":"1004","username":"bit"}
 %>
 <%= obj%>
 <hr>
 <%
 List<Member> memberlist = new ArrayList<>();
 memberlist.add(new Member("kim","1004","서울시 송파구","0"));
 memberlist.add(new Member("lee","1004","서울시 용산구","1"));
 memberlist.add(new Member("park","1004","서울시 서초구","2"));
 
 JSONArray objarray = JSONArray.fromObject(memberlist);
 %>
 <%=objarray%>