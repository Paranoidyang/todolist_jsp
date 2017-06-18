<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	session.invalidate();//当月前会话注销
	response.sendRedirect("home.jsp");
%>
