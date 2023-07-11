<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- depth1 -->
<ul>
<c:forEach var="userMenuList1" items="${userMenuList}">

	<c:if test="${userMenuList1.depth eq '1'}">
	<li>
		<a href="#"><c:out value="${userMenuList1.menuNm }" /></a>
		
		<!-- depth2 -->
		<c:if test="${userMenuList1.cMenuCnt > 0}">
		<ul>
		</c:if>
		<c:forEach var="userMenuList2" items="${userMenuList}">
		<c:if test="${userMenuList2.depth eq '2' && userMenuList1.menuId eq userMenuList2.pMenuId}">
			<li>
			<a href="/UserContentView.do"><c:out value="${userMenuList2.menuNm }" /></a>
			
				<!-- depth3 -->
				<c:if test="${userMenuList2.cMenuCnt > 0}">
				<ul>
				</c:if>
				<c:forEach var="userMenuList3" items="${userMenuList}">
				<c:if test="${userMenuList3.depth eq '3' && userMenuList2.menuId eq userMenuList3.pMenuId}">
					<li>
					<c:if test="${userMenuList3.menuType eq 'board'}">
					<a href="<c:out value="${userMenuList3.boardType}" />UserBoardList.do?boardId=<c:out value="${userMenuList3.typeVal}" />">
						<c:out value="${userMenuList3.menuNm }" />
					</a>
					</c:if>
					<c:if test="${userMenuList3.menuType eq 'content'}">
					<a href="UserContentsView.do?contentsId=<c:out value="${userMenuList3.typeVal}" />">
						<c:out value="${userMenuList3.menuNm }" />
					</a>
					</c:if>
					</li>
				</c:if>
				</c:forEach>
				<c:if test="${userMenuList2.cMenuCnt > 0}">
				</ul>
				</c:if>
				
			</li>
		</c:if>
		</c:forEach>
		<c:if test="${userMenuList1.cMenuCnt > 0}">
		</ul>
		</c:if>
		
	</li>
	</c:if>
	
</c:forEach>
