<%@page import="com.bdy.model.BdyOrder"%>
<%@page import="com.bdy.model.dao.BdyOrderDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
span{
	width:50px;
	display: inline-block;
}
</style>
</head>
<body>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="com.bdy.model.*" %>
<%@ page import="com.bdy.model.dao.*" %>
<%@ page import="java.util.List" %>
<% WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletContext());
	BdyFoodkind foodkind=(BdyFoodkind)context.getBean("foodKind");
	BdyFoodkindDao dao=(BdyFoodkindDao)context.getBean("BdyFoodkindDao");
	BdyFoodDao dao2=(BdyFoodDao)context.getBean("BdyFoodDao");
	foodkind.setFkId(3);
	foodkind.setName("主餐");
	foodkind.setPeriod(10.0);
%>
<h1><%=dao.getAllFoodkind()%></h1>
</body>
</html>