<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- depth1 -->
<ul>
<c:forEach var="userMenuList1" items="${userMenuList}">

	<c:if test="${userMenuList1.level eq '2'}">
	<li>
		<a href="#"><c:out value="${userMenuList1.menuNm }" /></a>
		
		<!-- depth2 -->
		<ul>
		<c:forEach var="userMenuList2" items="${userMenuList}">
		<c:if test="${userMenuList2.level eq '3' && userMenuList1.menuId eq userMenuList2.pMenuId}">
			<li>
			<a href="#"><c:out value="${userMenuList2.menuNm }" /></a>
			
				<!-- depth3 -->
				<ul>
				<c:forEach var="userMenuList3" items="${userMenuList}">
				<c:if test="${userMenuList3.level eq '4' && userMenuList2.menuId eq userMenuList3.pMenuId}">
					<li>
					<a href="#"><c:out value="${userMenuList3.menuNm }" /></a>
					</li>
				</c:if>
				</c:forEach>
				</ul>
				
			</li>
		</c:if>
		</c:forEach>
		</ul>
		
	</li>
	</c:if>
	
</c:forEach>

<!-- 
	<li class="current"><a href="index.html">Welcome</a></li>
	<li>
		<a href="#">Dropdown</a>
		<ul>
			<li><a href="#">Lorem ipsum dolor</a></li>
			<li><a href="#">Magna phasellus</a></li>
			<li>
				<a href="#">Phasellus consequat</a>
				<ul>
					<li><a href="#">Lorem ipsum dolor</a></li>
					<li><a href="#">Phasellus consequat</a></li>
					<li><a href="#">Magna phasellus</a></li>
					<li><a href="#">Etiam dolore nisl</a></li>
				</ul>
			</li>
			<li><a href="#">Veroeros feugiat</a></li>
		</ul>
	</li>
	<li><a href="left-sidebar.html">Left Sidebar</a></li>
	<li><a href="right-sidebar.html">Right Sidebar</a></li>
	<li><a href="no-sidebar.html">No Sidebar</a></li>
	 -->
</ul>