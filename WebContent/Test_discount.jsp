<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.bdy.model.*"%>
<%@page import="com.bdy.model.dao.*" %>

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
<%@ page import="java.util.List" %>
<%



 	WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletContext());
 	BdyDiscountDao dao = (BdyDiscountDao) context.getBean("BdyDiscountDao");
 	List<BdyDiscount> TL = dao.getAllDiscount();
 	pageContext.setAttribute("tl", TL);
	
	BdyDiscount dis = dao.getDiscount(1);
	pageContext.setAttribute("t2", dis);
	
	BdyDiscount insertDis = new BdyDiscount();
	insertDis.setName("生日優惠");
	insertDis.setDisPrice(0.85);
	int insert = dao.insert(insertDis);
	pageContext.setAttribute("insert", insert);
	
	int delete = dao.delete(7);
	pageContext.setAttribute("delete", delete);
	
	BdyDiscount update = new BdyDiscount();
	update.setDisId(4);
	update.setName("生日當天優惠");
	update.setDisPrice(0.85);
	int upd = dao.update(update);
	pageContext.setAttribute("upd", upd);
	
	
%>
<c:if test="${upd==1 }">
<h3>修改成功</h3>
</c:if>
<hr>
<c:if test="${delete==1 }">
<h3>刪除成功</h3>
</c:if>
<hr>
<c:if test="${insert==1 }">
<h3>新增成功</h3>
</c:if>
<hr>
<span>${t2.disId}</span><span>${t2.disPrice}</span>
<h3>單一查詢</h3>
<hr>
<c:forEach var="x" items="${tl}">
	<span>${x.disId}</span><span>${x.disPrice}</span><br>
	<h3>全部查詢</h3>
</c:forEach>

<%-- <c:forEach var="x" items="${tl}"> --%>
<%-- 	<span>${x.tbId}</span><span>${x.name}</span><span>${x.size }</span><span>${x.location }</span><span>${x.tableState }</span><br> --%>
<%-- </c:forEach> --%>
</body>
</html>