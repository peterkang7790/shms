<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
String structStatic = (String)request.getAttribute("structStatic");
System.out.println("structStatic : "+ structStatic);
%>
<%=structStatic %>