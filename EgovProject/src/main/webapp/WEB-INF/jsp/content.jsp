<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/css/study/style.css" />

</head>
<body>

<jsp:include page="/header.do?pMenuCd=${pMenuCd}"></jsp:include>

<div id="subheader">
	<ul class="nav">
	<c:forEach items="${menuDepth2List }" var="menu2">
		<li class="nav-item"><a class="nav-link <c:if test="${menuCd eq menu2.id}">active</c:if>" href="/menuCall.do?menuCd=${menu2.id}"><c:out value="${menu2.nm}" /></a></li>
	</c:forEach>
	</ul>
</div>

<main>
	<div class="container">
	</div>
</main>

<footer>
	<div class="container-fluid text-center">
		<p id="copyright">
		Copyright © 2021 Oracle and/or its affiliates.  All rights reserved. 
		</p>
	</div>
</footer>

</body>
</html>