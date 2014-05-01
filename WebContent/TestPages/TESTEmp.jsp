<%@page import="com.bdy.model.BdyEmp"%>
<%@page import="com.bdy.model.dao.BdyEmpDao"%>
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
	BdyEmpDao dao = (BdyEmpDao) context.getBean("BdyEmpDao");
	
	
	

	
	// 刪除
	System.out.println("刪除 : "+dao.deleteEmpById("A"));
	
	// 新增
	BdyEmp Emp = new BdyEmp();
	Emp.setEmpId("A123456789");
	Emp.setPasswd("o");
	Emp.setName("oldName");
	System.out.println("新增 : "+dao.insert(Emp));
	
	// 修改
	Emp = new BdyEmp();
	Emp.setEmpId("A123456789");
	Emp.setPasswd("n");
	Emp.setName("newName");
	System.out.println("修改 : "+dao.update(Emp));
	
	// 查詢
	List<BdyEmp> TL = dao.getAllEmp();
	pageContext.setAttribute("tl", TL);
	System.out.println("查詢 :");
	for(BdyEmp u : dao.getAllEmp())
		System.out.println(u.getEmpId() + "\t" + u.getName() + "\t");
%>

<c:forEach var="x" items="${tl}">
	<span>${x.empId}</span><br><span>${x.name}</span><br>
</c:forEach>

<%-- <c:forEach var="x" items="${tl}"> --%>
<%-- 	<span>${x.tbId}</span><span>${x.name}</span><span>${x.size }</span><span>${x.location }</span><span>${x.tableState }</span><br> --%>
<%-- </c:forEach> --%>
</body>
</html>