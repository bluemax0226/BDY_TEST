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
<%@ page import="com.bdy.model.BdyTable" %>
<%@ page import="com.bdy.model.dao.BdyTableDao" %>
<%@ page import="java.util.List" %>
<%
	WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletContext());
	BdyOrderDao dao = (BdyOrderDao) context.getBean("BdyOrderDao");
	

	// 查詢
	List<BdyOrder> TL = dao.getAllOrder();
	pageContext.setAttribute("tl", TL);
	
	// 刪除
	dao.delete(5);
	
	// 新增
	BdyOrder order = new BdyOrder();
	order.setOdId(6);
	order.setOrdTime(new java.util.Date("1991/08/13"));
	dao.insert(new BdyOrder());
	
	// 修改
	order = new BdyOrder();
	order.setOrdTime(new java.util.Date());
	order.setOdId(7);
	System.out.println(new java.util.Date());
	System.out.println(dao.update(order));
	
	for(BdyOrder u : dao.getAllOrder())
		System.out.println(u.getOdId() + "\t" + u.getOrdTime() + "\t");
%>

<c:forEach var="x" items="${tl}">
	<span>${x.odId}</span><span>${x.ordTime}</span><br>
</c:forEach>

<%-- <c:forEach var="x" items="${tl}"> --%>
<%-- 	<span>${x.tbId}</span><span>${x.name}</span><span>${x.size }</span><span>${x.location }</span><span>${x.tableState }</span><br> --%>
<%-- </c:forEach> --%>
</body>
</html>