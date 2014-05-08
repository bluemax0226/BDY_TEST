<%@page import="com.bdy.model.BdyOrderlist"%>
<%@page import="com.bdy.model.dao.BdyOrderlistDao"%>
<%@page import="com.bdy.model.BdyOrder"%>
<%@page import="com.bdy.model.dao.BdyOrderDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
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

<%-- 	<sql:setDataSource var="ds" dataSource="jdbc/BDY"/> --%>
<%-- 	<sql:query var="rs" dataSource="${ds}"> --%>
<!-- 		select * from BDY_ORDERLIST -->
<%-- 	</sql:query> --%>
	
<%-- 	<c:forEach var="row" items="rs"> --%>
<%-- 		<li><c:out value="${row.odlistId}" /></li> --%>
<%-- 	</c:forEach> --%>
<%
	WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletContext());
	BdyOrderlistDao dao = (BdyOrderlistDao) context.getBean("BdyOrderlistDao");
	
	
	

	
	// 刪除
	System.out.println("刪除 : "+dao.delete(6));
	
	// 新增
	BdyOrderlist orderList = new BdyOrderlist();
	orderList.setOdlistId(6);
	orderList.setAddmoney(100.0);
	System.out.println("新增 : "+dao.insert(orderList));
	
	// 修改
	orderList = new BdyOrderlist();
	orderList.setAddmoney(200.0);
	orderList.setOdlistId(10);
	System.out.println("修改 : "+dao.update(orderList));
	
	// 查詢
	List<BdyOrderlist> TL = dao.getAllorderlist();
	pageContext.setAttribute("tl", TL);
	System.out.println("查詢 :");
	for(BdyOrderlist u : dao.getAllorderlist())
		System.out.println(u.getOdlistId() + "\t" + u.getAddmoney() + "\t");
%>

<c:forEach var="x" items="${tl}">
	<span>${x.odlistId}</span><span>${x.addmoney}</span><br>
</c:forEach>

<%-- <c:forEach var="x" items="${tl}"> --%>
<%-- 	<span>${x.tbId}</span><span>${x.name}</span><span>${x.size }</span><span>${x.location }</span><span>${x.tableState }</span><br> --%>
<%-- </c:forEach> --%>
</body>
</html>