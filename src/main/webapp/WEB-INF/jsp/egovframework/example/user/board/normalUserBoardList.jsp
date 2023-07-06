<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE HTML>
<!--
	Verti by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Verti by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="user/css/main.css" />
	</head>
	<body class="is-preload no-sidebar">
	<form:form modelAttribute="normalBoardVO" id="listForm" name="listForm" method="post">
	<form:hidden path="pageIndex" />
	<form:hidden path="boardId" />
	<form:hidden path="norBrdId" />
	
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header-wrapper">
					<header id="header" class="container">

						<!-- Logo -->
							<div id="logo">
								<h1><a href="index.html">Verti</a></h1>
								<span>by HTML5 UP</span>
							</div>

						<!-- Nav -->
							<nav id="nav">
								<jsp:include page="/userNavi.do"></jsp:include>
							</nav>

					</header>
				</div>

			<!-- Main -->
				<div id="main-wrapper">
				
					<div class="container">
					
					<!-- Main -->

							<!-- Content -->

									<!-- 게시판설명 -->
									<h2 id="content"><c:out value="${boardVO.boardNm }"/></h2>
									<c:if test="${boardVO.boardDescrYn eq 'Y'}">
									<p><c:out value="${boardVO.boardDescr}"/></p>
									</c:if>
									
									

									<!-- Elements -->
										<div class="row gtr-200">
											<div class="col-12">

												<ul class="actions">
													<li>
								        				<form:select path="searchCondition">
								        					<form:option value="0" label="제목" />
								        					<form:option value="1" label="내용" />
								        				</form:select>
													</li>
													<li><form:input path="searchKeyword" placeholder="검색어를 입력" /></li>
													<li><a href="javascript:fn_egov_selectList();" class="button"><spring:message code="button.search" /></a></li>
												</ul>
									
													<div class="table-wrapper">
														<table>
															<thead>
																<tr>
																	<th>게시글ID</th>
																	<th>제목</th>
																	<th>작성일</th>
																</tr>
															</thead>
															<tbody>
															<c:forEach items="${normalBoardList}" var="normalBoardList">
																<tr>
																	<td><c:out value="${normalBoardList.norBrdId}"/></td>
																	<td><a href="javascript:fn_egov_select('<c:out value="${normalBoardList.norBrdId}"/>')">
																		<c:out value="${normalBoardList.postTitle}"/></a></td>
																	<td><c:out value="${normalBoardList.regDate}"/></td>
																</tr>
															</c:forEach>
															</tbody>
															<tfoot>
															<!-- 
																<tr>
																	<td colspan="2"></td>
																	<td>100.00</td>
																</tr>
																 -->
															</tfoot>
														</table>
														
														<ul class="actions">
															<li><a href="#" class="button primary icon solid fa-search">Icon</a></li>
															<li><a href="/normalUserBoardInsert.do?boardId=<c:out value="${boardId}" />" class="button icon solid fa-download">신규글등록</a></li>
														</ul>
													
														
														
													</div>

													<div id="pagination2">
													<ul class="pagination" >
														<li><a href="javascript:fn_egov_link_page('${paginationInfo.currentPageNo-1}');" class="button<c:if test="${paginationInfo.currentPageNo-1 eq 0}"> disabled</c:if>">Prev</a></li>
														<c:forEach var="pageNum" begin="${paginationInfo.firstPageNoOnPageList}" end="${paginationInfo.lastPageNoOnPageList}">
														<li><a href="javascript:fn_egov_link_page('${pageNum}');" class="page<c:if test="${paginationInfo.currentPageNo eq pageNum}"> active</c:if>">${pageNum }</a></li>
														</c:forEach>
														<li><a href="javascript:fn_egov_link_page('${paginationInfo.currentPageNo+1}');" class="button<c:if test="${paginationInfo.totalPageCount eq paginationInfo.currentPageNo}"> disabled</c:if>">Next</a></li>
													</ul>
													</div>
														
											</div>
											
										</div>


					
						
					</div>
				</div>

			<!-- Footer -->
				<div id="footer-wrapper">
					<jsp:include page="/userFooter.do"></jsp:include>
				</div>

			</div>

		<!-- Scripts -->

			<script src="user/js/jquery.min.js"></script>
			<script src="user/js/jquery.dropotron.min.js"></script>
			<script src="user/js/browser.min.js"></script>
			<script src="user/js/breakpoints.min.js"></script>
			<script src="user/js/util.js"></script>
			<script src="user/js/main.js"></script>
	</form:form>
	
	<script type="text/javascript">
	
		/* 글 목록 화면 function */
	    function fn_egov_selectList() {
	    	document.listForm.action = "<c:url value='/normalUserBoardList.do'/>";
	       	document.listForm.submit();
	    }
		
	    /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/normalUserBoardList.do'/>";
           	document.listForm.submit();
        }
	    
        function fn_egov_select(id) {
        	document.listForm.norBrdId.value = id;
           	document.listForm.action = "<c:url value='/normalUserBoardView.do'/>";
           	document.listForm.submit();
        }
	</script>
	
	</body>
</html>