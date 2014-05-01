<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="<c:url value="js/jquery-1.11.0.min.js"/>"></script>
<script src="<c:url value="js/jquery-ui-1.10.4.min.js"/>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" id="cssStyle" href="<c:url value="css/main.css"/>">
<script src="<c:url value="js/main.js"/>"></script>
<title>BDY RMS</title>
</head>
<body>
<div id="mainBox">
<div id="header">
<div id="LogoLabel">
<img id="bannerLogo" src="<c:url value="images/BDY_Logo.png"/>">
</div>
<div class="topLabel">
<p><span class="topItem">可容納人數:</span><span class="topValueint">99999</span></p>
<p><span class="topItem">餐聽內人數:</span><span class="topValueint">58</span></p>
<p><span class="topItem">桌位總數:</span><span class="topValueint">25</span></p>
<p><span class="topItem">已使用桌數:</span><span class="topValueint">20</span></p>
<p><span class="topItem">未使用桌數:</span><span class="topValueint">5</span></p>
</div>
<div class="topLabel">
<p><span class="topItem">可用活動1:</span><span class="topValue">滿千送百</span></p>
<p><span class="topItem">可用活動2:</span><span class="topValue">四人同行一人免費</span></p>
<p><span class="topItem">可用活動3:</span><span class="topValue">字數測試，這裡最多可以印出十七個字</span></p>
<p><span class="topItem">可用活動4:</span><span class="topValue">無</span></p>
<p><span class="topItem">可用活動5:</span><span class="topValue">無</span></p>
</div>
<div class="topLabel">
<p><span class="topItem">等待加入中:</span><span class="topValue">100</span></p>
<p><span class="topItem">等待加入中:</span><span class="topValue">100</span></p>
<p><span class="topItem">等待加入中:</span><span class="topValue">100</span></p>
<p><span class="topItem">等待加入中:</span><span class="topValue">100</span></p>
<p><span class="topItem">等待加入中:</span><span class="topValue">100</span></p>
</div>
<div id="topEMPinfo">
<p><span class="topItem">員工編號:</span><span class="topValue">BDY9527</span></p>
<p><span class="topItem">員工名字:</span><span class="topValue">懶洋洋</span></p>
</div>
</div>
<div id="aside">
<div id="functionTXT">功能選單</div>
<div><img id="functionLogo" src="<c:url value="images/function.jpg"/>"></div>
<input class="MenuBtn" type="button" value="訂位"><br>
<input class="MenuBtn" type="button" value="劃位"><br>
<input class="MenuBtn" type="button" value="結帳"><br>
<input class="MenuBtn" type="button" value="點餐"><br>
<input class="MenuBtn" type="button" value="餐桌擺設" onclick="goURL('TableSet')"><br>
<input class="MenuBtn" type="button" value="出餐"><br>
<input class="MenuBtn" type="button" value="報表"><br>
<input class="MenuBtn" type="button" value="員工管理"><br>
<input class="MenuBtn" type="button" value="餐廳管理"><br>
<input class="MenuBtn" type="button" onclick="window.location='index.jsp'" value="登出">
</div>
<div id="article">
<input type="button" onclick="changeStyle('modify')" value="show" />
<input type="button" onclick="changeStyle('insert')" value="insert" />
<div id="modify" style="display:none">
</div>
<c:if test="${param.page == 'TableSet' }">
	<jsp:include page="/TableSet.jsp" />
</c:if>
</div>
<div id="footer">
Kevin,Max,Hamilton,Frank and Rick 2014 © BaDoYaw RM System All Rights Reserved.
</div>
</div>
</body>
</html>